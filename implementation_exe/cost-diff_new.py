#!/usr/bin/env python3
import sys
import re
import os
from pathlib import Path
from typing import Dict, Any, List, Tuple
import argparse
import matplotlib.pyplot as plt
import numpy as np

# Usage method: python3 cost-diff.py <base_directory> <rev_directory1> [<rev_directory2> ...] --output_prefix <prefix> [--analyze-styles]
# This file will compare the cost of the base and revised LLVM Implmentations


def parse_cost_from_log(filename):
    """
    Parse the log file and sum up all costs found in lines containing 'LV: Selecting VF:'
    
    Args:
        filename (str): Path to the log file
        
    Returns:
        float: Total sum of all costs found
    """
    # Initialize total cost
    total_cost = 0.0
    
    try:
        # Open and read the log file
        with open(filename, 'r') as file:
            # Regular expression pattern to match the cost value
            # Looks for "With Cost: " followed by a number (can be decimal)
            pattern = r'With Cost:\s*([-+]?\d*\.?\d+)'
            
            # Read file line by line
            for line in file:
                # Only process lines that contain our target string
                if "LV: Selecting VF:" in line:
                    # Search for the cost value using regex
                    match = re.search(pattern, line)
                    if match:
                        # Extract and add the cost to total
                        cost = float(match.group(1))
                        total_cost += cost
        
        return total_cost
    
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found")
        return None
    except Exception as e:
        print(f"Error processing file: {str(e)}")
        return None

def get_benchmark_name(filename):
    """
    Extract the benchmark name in format [number.name] from the filename
    
    Args:
        filename (str): Full filename
        
    Returns:
        str: Benchmark name (e.g., "458.sjeng")
    """
    # Regular expression to match number.name pattern
    pattern = r'(\d+\.[a-zA-Z0-9]+)'
    match = re.search(pattern, filename)
    if match:
        return match.group(1)
    return filename

def process_directory(directory_path) -> Dict[str, float]:
    """
    Process all log files in the given directory
    
    Args:
        directory_path (str): Path to the directory containing log files
    
    Returns:
        Dict[str, float]: Dictionary mapping benchmark names to costs
    """
    # Convert directory path to Path object
    dir_path = Path(directory_path)
    
    # Check if directory exists
    if not dir_path.is_dir():
        print(f"Error: Directory '{directory_path}' not found")
        sys.exit(1)
    
    # Store results in a dictionary
    results = {}
    
    # Process each file in directory
    for file_path in dir_path.glob('*.log'):
        # Get benchmark name (e.g., "458.sjeng")
        benchmark_name = get_benchmark_name(file_path.stem)
        
        # Parse the file and get total cost
        total_cost = parse_cost_from_log(file_path)
        
        # Store result if parsing was successful
        if total_cost is not None:
            results[benchmark_name] = total_cost
    
    return results

def get_directory_name(path: str) -> str:
    """
    Extract the directory name from a path
    
    Args:
        path (str): Directory path
        
    Returns:
        str: Directory name
    """
    # Convert to Path object and get the name of the final directory
    return Path(path).name

def print_master_comparison_table(
    base_dir_name: str, 
    base_costs: Dict[str, float], 
    rev_dirs_data: List[Tuple[str, Dict[str, float]]]
):
    """
    Print a single formatted comparison table of costs for base and all revised directories.
    Each revised directory will have its cost, difference from base, and percentage difference.
    """
    all_benchmarks = set(base_costs.keys())
    for _, rev_costs in rev_dirs_data:
        all_benchmarks.update(rev_costs.keys())
    
    sorted_benchmarks = sorted(list(all_benchmarks))

    if not sorted_benchmarks:
        print("No benchmark data found to compare.")
        return

    header_parts = [f"{'Benchmark':<20}", f"{base_dir_name:>12}"]
    for rev_name, _ in rev_dirs_data:
        header_parts.append(f"{rev_name:>12}")

    header = " ".join(header_parts)
    print("\nBenchmark Cost Comparison Table:")
    print("-" * len(header))
    print(header)
    print("-" * len(header))
    
    for benchmark in sorted_benchmarks:
        row_parts = [f"{benchmark:<20}"]
        base_cost_val = base_costs.get(benchmark, 0.0)
        row_parts.append(f"{base_cost_val:>12.2f}")

        for rev_name, rev_costs_dict in rev_dirs_data:
            rev_cost_val = rev_costs_dict.get(benchmark, 0.0)
            row_parts.append(f"{rev_cost_val:>12.2f}")
        
        print(" ".join(row_parts))
    
    print("-" * len(header))


# --- Plotting Functions ---
def autolabel(rects, ax):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        
        height = rect.get_height()
        ax.annotate(f'{int(round(height))}',
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),
                    textcoords="offset points",
                    ha='center', va='bottom',
                    fontsize=8)

def plot_total_cost_comparison(
    base_dir_name: str,
    base_costs: Dict[str, float],
    rev_dirs_data: List[Tuple[str, Dict[str, float]]],
    output_prefix: str
):
    """Plots a single bar chart comparing total costs for all directories."""
    all_dir_names = [base_dir_name] + [name for name, _ in rev_dirs_data]
    
    # Consolidate data: {dir_name: {benchmark: cost}}
    consolidated_data = {base_dir_name: base_costs}
    for name, costs in rev_dirs_data:
        consolidated_data[name] = costs

    all_benchmarks_set = set(base_costs.keys())
    for _, costs in rev_dirs_data:
        all_benchmarks_set.update(costs.keys())
    
    sorted_benchmarks = sorted(list(all_benchmarks_set))

    if not sorted_benchmarks:
        print("No benchmark data found for total cost plot.")
        return

    num_benchmarks = len(sorted_benchmarks)
    num_dirs = len(all_dir_names)

    fig, ax = plt.subplots(figsize=(max(15, num_benchmarks * num_dirs * 0.25), 8))
    
    total_width_per_benchmark_group = 0.8
    bar_width = total_width_per_benchmark_group / num_dirs
    x_indices = np.arange(num_benchmarks)
    
    # Use a colormap for directory colors
    colors = plt.cm.get_cmap('tab10', num_dirs)

    for i, dir_name in enumerate(all_dir_names):
        costs_for_current_dir = [consolidated_data[dir_name].get(b, 0.0) for b in sorted_benchmarks]
        bar_offset = (i - num_dirs / 2 + 0.5) * bar_width
        rects = ax.bar(x_indices + bar_offset, costs_for_current_dir, bar_width, label=dir_name, color=colors(i))
        # Only add labels if it's NOT the third bar (index 2)
        if i != 2 and i != 1:
            autolabel(rects, ax)

    ax.set_ylabel('Total Cost')
    ax.set_title('Total Cost Comparison Across Directories')
    ax.set_xticks(x_indices)
    ax.set_xticklabels(sorted_benchmarks, rotation=45, ha="right")
    ax.legend(title="Directories", bbox_to_anchor=(1.05, 1), loc='upper left')
    
    plt.tight_layout(rect=[0, 0, 0.85, 1])
    
    plot_file = f"{output_prefix}total_costs_comparison.png"
    try:
        # Ensure output directory exists
        output_dir = os.path.dirname(plot_file)
        if output_dir and not os.path.exists(output_dir):
            os.makedirs(output_dir)
        plt.savefig(plot_file, bbox_inches='tight', dpi=300)
        print(f"Total cost comparison plot saved to: {plot_file}")
    except Exception as e:
        print(f"Error saving total cost plot: {e}")
    plt.close(fig)


def plot_style_cost_comparison(
    base_dir_name: str,
    base_style_costs: Dict[str, Dict[str, float]], # benchmark -> style -> cost
    rev_dirs_style_data: List[Tuple[str, Dict[str, Dict[str, float]]]], # List of (rev_name, rev_style_costs)
    output_prefix: str,
    style_to_plot: str = "Widen_Reverse" # Focus on this style
):
    """Plots a single bar chart comparing costs for a specific style (e.g., Widen_Reverse) for all directories."""
    all_dir_names = [base_dir_name] + [name for name, _ in rev_dirs_style_data]

    # Consolidate data for the specific style: {dir_name: {benchmark: style_cost}}
    consolidated_style_data = {}
    
    base_specific_style_costs = {
        bench: costs.get(style_to_plot, 0.0) 
        for bench, costs in base_style_costs.items() # Removed 'if style_to_plot in costs' to ensure all benchmarks are considered for base
    }
    consolidated_style_data[base_dir_name] = base_specific_style_costs
    
    all_benchmarks_with_style_set = set(base_specific_style_costs.keys())

    for name, dir_styles in rev_dirs_style_data:
        current_dir_specific_style_costs = {
            bench: costs.get(style_to_plot, 0.0) 
            for bench, costs in dir_styles.items() # Removed 'if style_to_plot in costs'
        }
        consolidated_style_data[name] = current_dir_specific_style_costs
        # Update the set of all benchmarks that have *any* data for this style, even if it's 0
        # This ensures all benchmarks appearing in any directory are plotted.
        all_benchmarks_with_style_set.update(dir_styles.keys()) # Consider all benchmarks present in dir_styles
            
    # We want to plot all benchmarks that appear in *any* of the directories for the style analysis,
    # even if the specific style_to_plot is 0 or missing for some.
    # So, let's collect all benchmarks first from base_style_costs and all rev_dirs_style_data's keys.
    temp_all_benchmarks = set(base_style_costs.keys())
    for _, rev_data in rev_dirs_style_data:
        temp_all_benchmarks.update(rev_data.keys())
    
    # Filter this list to only those benchmarks where at least one directory has the style_to_plot
    # This is implicitly handled by .get(style_to_plot, 0.0) later, but good to be clear.
    # For now, let's use all benchmarks found in the style data for any style, then filter by style_to_plot for values.
    
    # Re-evaluate which benchmarks to plot for the style graph:
    # A benchmark should be plotted if *any* directory has *any* style data for it,
    # and then we'll plot the specific 'style_to_plot' value (or 0 if not present).
    # The previous logic for all_benchmarks_with_style_set was a bit too restrictive.

    benchmarks_to_consider_for_style_plot = set()
    if base_style_costs:
        benchmarks_to_consider_for_style_plot.update(base_style_costs.keys())
    for _, rev_style_data_for_dir in rev_dirs_style_data:
        if rev_style_data_for_dir:
            benchmarks_to_consider_for_style_plot.update(rev_style_data_for_dir.keys())

    sorted_benchmarks = sorted(list(benchmarks_to_consider_for_style_plot))


    if not sorted_benchmarks:
        print(f"No benchmark data found for style '{style_to_plot}' plot.")
        return

    num_benchmarks = len(sorted_benchmarks)
    num_dirs = len(all_dir_names)

    fig, ax = plt.subplots(figsize=(max(15, num_benchmarks * num_dirs * 0.25), 8))
    
    total_width_per_benchmark_group = 0.8
    bar_width = total_width_per_benchmark_group / num_dirs
    x_indices = np.arange(num_benchmarks)
    colors = plt.cm.get_cmap('tab10', num_dirs)

    for i, dir_name in enumerate(all_dir_names):
        # Ensure we attempt to get data for all sorted_benchmarks from each directory's style data
        costs_for_current_dir = [
            consolidated_style_data.get(dir_name, {}).get(b, 0.0) for b in sorted_benchmarks
        ]
        bar_offset = (i - num_dirs / 2 + 0.5) * bar_width
        rects = ax.bar(x_indices + bar_offset, costs_for_current_dir, bar_width, label=dir_name, color=colors(i))
        # Only add labels if it's NOT the third bar (index 2)
        if i != 2:
            autolabel(rects, ax)

    ax.set_ylabel(f"Cost for Style '{style_to_plot}'")
    ax.set_title(f"Style Cost Comparison ('{style_to_plot}') Across Directories")
    ax.set_xticks(x_indices)
    ax.set_xticklabels(sorted_benchmarks, rotation=45, ha="right")
    ax.legend(title="Directories", bbox_to_anchor=(1.05, 1), loc='upper left')
    
    plt.tight_layout(rect=[0, 0, 0.85, 1])

    plot_file = f"{output_prefix}style_{style_to_plot}_costs_comparison.png"
    try:
        output_dir = os.path.dirname(plot_file)
        if output_dir and not os.path.exists(output_dir):
            os.makedirs(output_dir)
        plt.savefig(plot_file, bbox_inches='tight', dpi=300)
        print(f"Style cost comparison plot for '{style_to_plot}' saved to: {plot_file}")
    except Exception as e:
        print(f"Error saving style cost plot: {e}")
    plt.close(fig)


# --- Functions for analyzing decision styles ---

def parse_decision_style_costs_from_log(filename: str) -> Dict[str, Dict[str, float]]:
    """
    Parse the log file to find "Function that is being costed:'{func_name}'" blocks,
    then within these blocks, find "LV: Decision: {Style}" lines (specifically for
    Widen and Widen_Reverse styles) and extract cost from the *next* line for that style.
    Sums costs per style within each function.
    Returns:
        Dict[str, Dict[str, float]]: func_name -> {style_name -> cost}
    """
    # func_name -> {style_name -> cost}
    parsed_data: Dict[str, Dict[str, float]] = {}
    current_function_name: str | None = None
    function_block_pattern = r"Function that is being costed:'([^']*)'"
    decision_pattern = r"LV: Decision:\s*(\S+)"
    cost_pattern = r'Found an estimated cost of\s*([-+]?\d*\.?\d+)'

    try:
        with open(filename, 'r') as file:
            lines = iter(file)
            for line in lines:
                func_match = re.search(function_block_pattern, line)
                if func_match:
                    current_function_name = func_match.group(1)
                    if current_function_name not in parsed_data:
                        parsed_data[current_function_name] = {}
                    continue

                if current_function_name is None:
                    continue

                decision_match = re.search(decision_pattern, line)
                if decision_match:
                    style = decision_match.group(1)
                    if style == "Widen_Reverse": # Filter for specific styles
                        try:
                            next_line = next(lines)
                            cost_match = re.search(cost_pattern, next_line)
                            if cost_match:
                                try:
                                    cost_str = cost_match.group(1)
                                    cost = float(cost_str)
                                    if current_function_name in parsed_data: # Should always be true
                                        func_styles = parsed_data[current_function_name]
                                        func_styles[style] = func_styles.get(style, 0.0) + cost
                                except ValueError:
                                    print(f"Warning: Could not convert cost string '{cost_str}' to float in '{filename}' "
                                          f"for function '{current_function_name}', style '{style}'.")
                        except StopIteration:
                            break
                        except Exception as e_inner:
                            print(f"Warning: Error processing line after decision in '{filename}' "
                                  f"for function '{current_function_name}', style '{style}': '{next_line.strip()}'. Error: {e_inner}")
        return parsed_data
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found while parsing styles.")
        return {}
    except Exception as e:
        print(f"Error processing file '{filename}' for styles: {str(e)}")
        return {}

def process_directory_styles(directory_path: str) -> Dict[str, Dict[str, Dict[str, float]]]:
    """
    Process all log files to extract costs by benchmark -> function -> style.
    Returns:
        Dict[str, Dict[str, Dict[str, float]]]: benchmark_name -> {function_name -> {style_name -> cost}}
    """
    dir_path = Path(directory_path)
    if not dir_path.is_dir():
        print(f"Error: Directory '{directory_path}' not found for style analysis.")
        return {}
    
    results: Dict[str, Dict[str, Dict[str, float]]] = {}
    for file_path in dir_path.glob('*.log'):
        benchmark_name = get_benchmark_name(file_path.stem)
        per_file_data = parse_decision_style_costs_from_log(str(file_path)) # func -> style -> cost
        
        if per_file_data:
            if benchmark_name not in results:
                results[benchmark_name] = {}
            
            benchmark_agg_data = results[benchmark_name] # func -> style -> cost for this benchmark
            for func_name, styles_in_func in per_file_data.items():
                if func_name not in benchmark_agg_data:
                    benchmark_agg_data[func_name] = {}
                
                func_agg_styles = benchmark_agg_data[func_name] # style -> cost for this func
                for style_name, cost_val in styles_in_func.items():
                    func_agg_styles[style_name] = func_agg_styles.get(style_name, 0.0) + cost_val
    return results

def aggregate_styles_for_benchmark_from_detailed(
    detailed_data: Dict[str, Dict[str, Dict[str, float]]] # benchmark -> func -> style -> cost
) -> Dict[str, Dict[str, float]]: # benchmark -> style -> aggregated_cost
    """
    Aggregates costs by style for each benchmark from detailed function-level data.
    """
    aggregated_by_style: Dict[str, Dict[str, float]] = {}
    for benchmark_name, funcs_in_bench in detailed_data.items():
        current_bench_styles: Dict[str, float] = {}
        for _, styles_in_func in funcs_in_bench.items():
            for style_name, cost_val in styles_in_func.items():
                current_bench_styles[style_name] = current_bench_styles.get(style_name, 0.0) + cost_val
        if current_bench_styles:
            aggregated_by_style[benchmark_name] = current_bench_styles
    return aggregated_by_style

def print_master_style_comparison_table(
    base_dir_name: str,
    base_style_costs: Dict[str, Dict[str, float]], # benchmark -> style -> cost
    rev_dirs_style_data: List[Tuple[str, Dict[str, Dict[str, float]]]] # List of (rev_name, rev_style_costs)
):
    """
    Prints a single table comparing style costs across base and all revised directories.
    """
    # Find all benchmarks that appear in any directory's style cost data
    all_benchmarks_with_styles = set(base_style_costs.keys())
    for _, rev_costs in rev_dirs_style_data:
        all_benchmarks_with_styles.update(rev_costs.keys())

    if not all_benchmarks_with_styles:
        print("No style-specific cost data found for comparison.")
        return

    # For each benchmark, find all styles that appear in any directory for that benchmark
    benchmark_to_all_styles_map: Dict[str, set] = {}
    for benchmark_name in all_benchmarks_with_styles:
        styles_in_this_benchmark = set()
        if benchmark_name in base_style_costs:
            styles_in_this_benchmark.update(base_style_costs[benchmark_name].keys())
        for _, rev_costs in rev_dirs_style_data:
            if benchmark_name in rev_costs:
                styles_in_this_benchmark.update(rev_costs[benchmark_name].keys())
        if styles_in_this_benchmark:
            benchmark_to_all_styles_map[benchmark_name] = styles_in_this_benchmark
    
    # Header
    header_parts = [f"{'Benchmark':<25}", f"{'Style':<20}", f"{base_dir_name:>15}"]
    for rev_name, _ in rev_dirs_style_data:
        header_parts.append(f"{rev_name:>15}")

    header_str = " ".join(header_parts)
    print("\nBenchmark Style Cost Comparison Table (Aggregated by Style per Benchmark):")
    print("-" * len(header_str))
    print(header_str)
    print("-" * len(header_str))

    comparable_entries_found = 0
    for benchmark_name in sorted(list(benchmark_to_all_styles_map.keys())):
        first_style_for_benchmark = True
        for style_name in sorted(list(benchmark_to_all_styles_map[benchmark_name])):
            comparable_entries_found +=1
            
            bench_display_name = benchmark_name if first_style_for_benchmark else ""
            row_parts = [f"{bench_display_name:<25}", f"{style_name:<20}"]
            
            base_cost_val = base_style_costs.get(benchmark_name, {}).get(style_name, 0.0)
            row_parts.append(f"{base_cost_val:>15.2f}")

            for rev_name, rev_style_costs_dict in rev_dirs_style_data:
                rev_cost_val = rev_style_costs_dict.get(benchmark_name, {}).get(style_name, 0.0)
                row_parts.append(f"{rev_cost_val:>15.2f}")
            
            print(" ".join(row_parts))
            first_style_for_benchmark = False
            
    if comparable_entries_found > 0:
        print("-" * len(header_str))
    else:
        print("No comparable style-specific cost data found to display in the master table.")


def main():
    parser = argparse.ArgumentParser(
        description="Compare LLVM implementation costs between a base directory and one or more revised directories. "
                    "Generates a single summary table and plots.",
        formatter_class=argparse.RawTextHelpFormatter,
        usage="%(prog)s <base_dir> <rev_dir1> [<rev_dir2> ...] --output_prefix <prefix> [--analyze-styles]"
    )
    parser.add_argument("base_dir", help="Path to the base (original) directory containing benchmark logs.")
    parser.add_argument("rev_dirs", nargs='+', help="Paths to one or more revised (comparison) directories containing benchmark logs.")
    parser.add_argument(
        "--output_prefix",
        required=True,
        help="Prefix for the output files (e.g., 'results/experiment1_'). Include trailing slash if it's a directory."
    )
    parser.add_argument(
        "--analyze-styles",
        action="store_true",
        help="Enable analysis of costs based on 'LV: Decision: {Style}' entries, \n"
             "considering only costs from common functions in both logs for each comparison, then \n"
             "aggregating these costs per style at the benchmark level."
    )
    
    args = parser.parse_args()

    base_dir_path = args.base_dir
    rev_dir_paths = args.rev_dirs

    base_dir_name = get_directory_name(base_dir_path)
    all_rev_dirs_data_total_costs = []
    all_rev_dirs_data_style_costs = []

    output_prefix = args.output_prefix
    # Ensure output directory from prefix exists
    output_dir_from_prefix = os.path.dirname(output_prefix)
    if output_dir_from_prefix and not os.path.exists(output_dir_from_prefix):
        os.makedirs(output_dir_from_prefix)
        print(f"Created output directory for plots: {output_dir_from_prefix}")

    if args.analyze_styles:
        print(f"--- Processing Base Directory for Styles: {base_dir_name} ({base_dir_path}) ---")
        base_detailed_data = process_directory_styles(base_dir_path) # bench -> func -> style -> cost
        if not base_detailed_data:
            print(f"No style data found for base directory {base_dir_name}.")
            # Decide if to proceed with empty base or halt
        base_aggregated_style_costs = aggregate_styles_for_benchmark_from_detailed(base_detailed_data) # bench -> style -> cost

        for rev_dir_path in rev_dir_paths:
            rev_dir_name = get_directory_name(rev_dir_path)
            print(f"\n--- Processing Revised Directory for Styles: {rev_dir_name} ({rev_dir_path}) ---")
            rev_detailed_data = process_directory_styles(rev_dir_path)
            if not rev_detailed_data:
                print(f"No style data found for revised directory {rev_dir_name}.")
            rev_aggregated_style_costs = aggregate_styles_for_benchmark_from_detailed(rev_detailed_data)
            all_rev_dirs_data_style_costs.append((rev_dir_name, rev_aggregated_style_costs))
        
        print_master_style_comparison_table(base_dir_name, base_aggregated_style_costs, all_rev_dirs_data_style_costs)
        # Add plotting for style costs
        if base_aggregated_style_costs or any(data[1] for data in all_rev_dirs_data_style_costs):
            plot_style_cost_comparison(base_dir_name, base_aggregated_style_costs, all_rev_dirs_data_style_costs, output_prefix)
        else:
            print("Not enough data for style cost plot.")

    else:
        print(f"--- Processing Base Directory for Total Costs: {base_dir_name} ({base_dir_path}) ---")
        base_total_costs = process_directory(base_dir_path) # benchmark -> cost
        if not base_total_costs:
            print(f"No cost data found for base directory {base_dir_name}.")
            # Decide if to proceed or halt

        for rev_dir_path in rev_dir_paths:
            rev_dir_name = get_directory_name(rev_dir_path)
            print(f"\n--- Processing Revised Directory for Total Costs: {rev_dir_name} ({rev_dir_path}) ---")
            rev_total_costs = process_directory(rev_dir_path)
            if not rev_total_costs:
                 print(f"No cost data found for revised directory {rev_dir_name}.")
            all_rev_dirs_data_total_costs.append((rev_dir_name, rev_total_costs))

        print_master_comparison_table(base_dir_name, base_total_costs, all_rev_dirs_data_total_costs)
        # Add plotting for total costs
        if base_total_costs or any(data[1] for data in all_rev_dirs_data_total_costs):
            plot_total_cost_comparison(base_dir_name, base_total_costs, all_rev_dirs_data_total_costs, output_prefix)
        else:
            print("Not enough data for total cost plot.")


if __name__ == "__main__":
    main()
