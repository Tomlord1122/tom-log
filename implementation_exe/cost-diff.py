#!/usr/bin/env python3
import sys
import re
import os
from pathlib import Path
from typing import Dict, Any
import argparse

# Usage method: python3 cost-diff.py <directory_origin_path> <directory_custom_path>
# This file will compare the cost of the origin and custom LLVM Implmentation


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

def print_comparison_table(origin_costs: Dict[str, float], rev_costs: Dict[str, float], origin_dir: str, rev_dir: str):
    """
    Print a formatted comparison table of costs with dynamic headers
    """
    # Get directory names for column headers
    origin_name = get_directory_name(origin_dir)
    rev_name = get_directory_name(rev_dir)
    
    # Get all unique benchmarks
    all_benchmarks = sorted(set(origin_costs.keys()) | set(rev_costs.keys()))
    
    # Print table header
    print("\nBenchmark Comparison Table:")
    print("-" * 80)
    print(f"{'Benchmark':<15} {origin_name:>12} {rev_name:>12} {'Diff':>12} {'Diff%':>12}")
    print("-" * 80)
    
    # Print each benchmark's comparison
    for benchmark in all_benchmarks:
        origin_cost = origin_costs.get(benchmark, 0)
        rev_cost = rev_costs.get(benchmark, 0)
        diff = rev_cost - origin_cost
        diff_percent = (diff / origin_cost * 100) if origin_cost != 0 else float('inf')
        
        print(f"{benchmark:<15} {origin_cost:>12.2f} {rev_cost:>12.2f} {diff:>12.2f} {diff_percent:>11.2f}%")
    
    print("-" * 80)

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

def aggregate_common_costs_by_benchmark(
    origin_detailed_data: Dict[str, Dict[str, Dict[str, float]]], # benchmark -> func -> style -> cost
    rev_detailed_data: Dict[str, Dict[str, Dict[str, float]]]
) -> tuple[Dict[str, Dict[str, float]], Dict[str, Dict[str, float]]]:
    """
    Aggregates costs by benchmark and style, but only considering costs from functions
    and styles common to both origin and revised data for a given benchmark.
    Returns:
        tuple[Dict[str, Dict[str, float]], Dict[str, Dict[str, float]]]:
            (origin_aggregated_costs, rev_aggregated_costs)
            Both are: benchmark_name -> {style_name -> total_cost}
    """
    origin_aggregated: Dict[str, Dict[str, float]] = {}
    rev_aggregated: Dict[str, Dict[str, float]] = {}

    common_benchmarks = sorted(list(set(origin_detailed_data.keys()) & set(rev_detailed_data.keys())))

    for bench_name in common_benchmarks:
        origin_funcs_in_bench = origin_detailed_data[bench_name]
        rev_funcs_in_bench = rev_detailed_data[bench_name]

        # Initialize style aggregations for this benchmark if we find any common data
        current_bench_origin_styles: Dict[str, float] = {}
        current_bench_rev_styles: Dict[str, float] = {}
        
        common_functions = sorted(list(set(origin_funcs_in_bench.keys()) & set(rev_funcs_in_bench.keys())))

        for func_name in common_functions:
            origin_styles_in_func = origin_funcs_in_bench[func_name]
            rev_styles_in_func = rev_funcs_in_bench[func_name]

            common_styles = sorted(list(set(origin_styles_in_func.keys()) & set(rev_styles_in_func.keys())))

            for style_name in common_styles:
                origin_cost = origin_styles_in_func[style_name]
                rev_cost = rev_styles_in_func[style_name]
                
                current_bench_origin_styles[style_name] = current_bench_origin_styles.get(style_name, 0.0) + origin_cost
                current_bench_rev_styles[style_name] = current_bench_rev_styles.get(style_name, 0.0) + rev_cost
        
        if current_bench_origin_styles: # If any common styles were actually aggregated for this benchmark
            origin_aggregated[bench_name] = current_bench_origin_styles
        if current_bench_rev_styles:
            rev_aggregated[bench_name] = current_bench_rev_styles
            
    return origin_aggregated, rev_aggregated

def print_style_comparison_table(
    origin_style_costs: Dict[str, Dict[str, float]], # benchmark -> style -> cost
    rev_style_costs: Dict[str, Dict[str, float]],
    origin_dir_name: str, rev_dir_name: str
):
    """
    Print a formatted comparison table for costs categorized by benchmark and decision style.
    Assumes input data has already been filtered and aggregated appropriately.
    """
    print("\nBenchmark Style Cost Comparison (Aggregated from Common Functions):")
    header = f"{'Benchmark':<25} {'Style':<20} {origin_dir_name:>18} {rev_dir_name:>18} {'Diff':>12} {'Diff%':>12}"
    print("-" * len(header))
    print(header)
    print("-" * len(header))

    comparable_entries_found = 0
    
    # Iterate through benchmarks present in either origin or revised aggregated data
    # (after common function filtering, a benchmark might only have data in one if the other had no common functions/styles)
    # For a stricter comparison, we could iterate only common_benchmarks again.
    # Let's stick to common benchmarks for cleaner table.
    all_benchmarks_with_data = sorted(list(set(origin_style_costs.keys()) & set(rev_style_costs.keys())))


    for benchmark_name in all_benchmarks_with_data:
        origin_styles_in_bench = origin_style_costs.get(benchmark_name, {})
        rev_styles_in_bench = rev_style_costs.get(benchmark_name, {})
        
        # Determine all styles present for this benchmark across both origin and rev
        all_styles_for_this_bench = sorted(list(set(origin_styles_in_bench.keys()) | set(rev_styles_in_bench.keys())))

        if not all_styles_for_this_bench:
            continue # Should not happen if benchmark_name is from the intersection

        first_style_for_benchmark = True
        for style_name in all_styles_for_this_bench:
            origin_cost = origin_styles_in_bench.get(style_name, 0.0)
            rev_cost = rev_styles_in_bench.get(style_name, 0.0)

            # Important: only print if there's a common style after aggregation.
            # If a style only exists in one side (e.g. origin_cost > 0, rev_cost = 0 for that style)
            # it implies it was common at function level but perhaps its counterpart was 0.
            # The user might want to see these.
            # For true "commonality" at this display stage, both should ideally have the style.
            # The current `all_benchmarks_with_data` ensures bench is common.
            # `all_styles_for_this_bench` ensures we show all styles from those common benches.

            # Let's refine to only show if style is common in the *aggregated* results
            if style_name not in origin_styles_in_bench or style_name not in rev_styles_in_bench:
                 # This style was not present in both aggregated sets for this common benchmark
                 # (Potentially one side had 0 cost for this style across all common functions)
                 # If we want to show it, we'd remove this check. For stricter "common at agg level", keep it.
                 # Let's show it if it's in *either* after aggregation, as the benchmark itself is common.
                 pass # Allow printing if style appears in at least one

            comparable_entries_found += 1
            diff = rev_cost - origin_cost
            if origin_cost != 0:
                diff_percent = (diff / origin_cost * 100)
            elif diff == 0:
                diff_percent = 0.0
            else:
                diff_percent = float('inf') if diff > 0 else float('-inf')
            
            bench_display_name = benchmark_name if first_style_for_benchmark else ""
            print(f"{bench_display_name:<25} {style_name:<20} {origin_cost:>18.2f} {rev_cost:>18.2f} {diff:>12.2f} {diff_percent:>11.2f}%")
            first_style_for_benchmark = False
            
    if comparable_entries_found > 0:
        print("-" * len(header))
    else:
        print("No comparable style-specific cost data found (after aggregating from common functions).")


def main():
    parser = argparse.ArgumentParser(
        description="Compare LLVM implementation costs, with an option to analyze by decision styles.",
        formatter_class=argparse.RawTextHelpFormatter,
        usage="%(prog)s <origin_directory> <rev_directory> [--analyze-styles]"
    )
    parser.add_argument("origin_dir", help="Path to the directory containing original benchmark logs.")
    parser.add_argument("rev_dir", help="Path to the directory containing revised benchmark logs.")
    parser.add_argument(
        "--analyze-styles",
        action="store_true",
        help="Enable analysis of costs based on 'LV: Decision: {Style}' entries, \n"
             "considering only costs from common functions in both logs, then \n"
             "aggregating these costs per style at the benchmark level."
    )
    
    args = parser.parse_args()

    origin_dir_name = get_directory_name(args.origin_dir)
    rev_dir_name = get_directory_name(args.rev_dir)

    if args.analyze_styles:
        print(f"\nAnalyzing costs by style (from common functions) for '{origin_dir_name}' and '{rev_dir_name}'...")
        # Detailed data: benchmark -> func -> style -> cost
        origin_detailed_data = process_directory_styles(args.origin_dir)
        rev_detailed_data = process_directory_styles(args.rev_dir)
        
        # Aggregated data: benchmark -> style -> cost (after common function filtering)
        origin_aggregated_style_costs, rev_aggregated_style_costs = aggregate_common_costs_by_benchmark(
            origin_detailed_data, rev_detailed_data
        )
        
        print_style_comparison_table(
            origin_aggregated_style_costs, rev_aggregated_style_costs,
            origin_dir_name, rev_dir_name
        )
    else:
        # Original functionality
        print(f"\nAnalyzing total costs for '{origin_dir_name}' and '{rev_dir_name}'...")
        origin_costs = process_directory(args.origin_dir)
        rev_costs = process_directory(args.rev_dir)
        print_comparison_table(origin_costs, rev_costs, args.origin_dir, args.rev_dir)

if __name__ == "__main__":
    main()
