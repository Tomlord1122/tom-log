#!/usr/bin/env python3
import sys
import re
import os
from pathlib import Path
from typing import Dict, List, Tuple, Any
import argparse
import math

# Usage method: python3 insn-diff.py <directory_origin_path> <directory_custom_path> [--aggregate | --median]
# This file will compare the dynamic instruction count of the origin and custom LLVM Implmentation
# --aggregate: Sum counts for benchmarks with the same base name (e.g., gcc_0, gcc_1 -> gcc)
# --median: Show only the run with the median difference percentage for benchmarks with multiple runs


def parse_insn_count(filename):
    """
    Parse the log file and get the total instruction count
    
    Args:
        filename (str): Path to the log file
        
    Returns:
        int: Total instruction count
    """
    try:
        with open(filename, 'r') as file:
            for line in file:
                if "total insns:" in line:
                    # Extract the number after "total insns:"
                    match = re.search(r'total insns:\s*(\d+)', line)
                    if match:
                        return int(match.group(1))
        # If "total insns:" not found, return 0 for this file
        print(f"Warning: 'total insns:' not found in '{filename}'. Assuming 0.")
        return 0
    
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found")
        return 0 # Return 0 if file not found, allows processing others
    except Exception as e:
        print(f"Error processing file '{filename}': {str(e)}")
        return 0 # Return 0 on other errors


def get_base_benchmark_name(filename):
    """
    Extract the base benchmark name, removing trailing _<number> if present.
    Handles filenames like 'perlbench.0.log' -> 'perlbench' or 'gcc_1.log' -> 'gcc'
    or 'mcf.log' -> 'mcf'
    
    Args:
        filename (str): Full filename (e.g., 'perlbench.0.log', 'gcc_1.log')
        
    Returns:
        str: Base benchmark name (e.g., 'perlbench', 'gcc')
    """
    # Remove the .log suffix first
    name_part = Path(filename).stem 
    # Try to remove trailing _<number> or .<number>
    match = re.match(r'^(.*?)[\._](\d+)$', name_part)
    if match:
        return match.group(1) # Return the part before _<number> or .<number>
    else:
        return name_part # Return the original name part if no pattern matched

def process_directory(directory_path) -> Dict[str, int]:
    """
    Process all log files in the given directory.
    Sums counts for log files belonging to the *exact same* benchmark run 
    (e.g., `gcc_0.log` and `gcc_0.extra.log` would be summed under `gcc_0`).
    Does *not* aggregate across different runs (e.g., `gcc_0` and `gcc_1` remain separate).
    
    Args:
        directory_path (str): Path to the directory containing log files
    
    Returns:
        Dict[str, int]: Dictionary mapping full benchmark run names to their total instruction counts.
                        Example: {'gcc_0': 12345, 'gcc_1': 67890, 'mcf_0': 54321}
    """
    dir_path = Path(directory_path)
    
    if not dir_path.is_dir():
        print(f"Error: Directory '{directory_path}' not found")
        # Returning an empty dict instead of exiting allows comparison if one dir exists
        return {} 
    
    # Use the full stem (filename without suffix) as the key initially
    results_per_file_stem = {}
    for file_path in dir_path.glob('*.log'):
        full_stem = file_path.stem # e.g., 'gcc_0' or 'perlbench.0'
        insn_count = parse_insn_count(file_path)
        
        # Sum counts if multiple log files have the exact same stem (e.g. gcc_0.log, gcc_0.trace.log)
        results_per_file_stem[full_stem] = results_per_file_stem.get(full_stem, 0) + insn_count
        
    return results_per_file_stem


def calculate_comparison_data(origin_counts: Dict[str, int], rev_counts: Dict[str, int]) -> Dict[str, List[Dict[str, Any]]]:
    """
    Calculates detailed comparison data for each benchmark run and groups them by base name.

    Args:
        origin_counts: Dict mapping full benchmark run name to origin count.
        rev_counts: Dict mapping full benchmark run name to revised count.

    Returns:
        Dict[str, List[Dict[str, Any]]]: Dictionary where keys are base benchmark names
        and values are lists of dictionaries, each containing details for one run ('name', 'origin', 'rev', 'diff', 'diff_p').
        Example:
        {
            'gcc': [
                {'name': 'gcc_0', 'origin': 100, 'rev': 95, 'diff': -5, 'diff_p': -5.0},
                {'name': 'gcc_1', 'origin': 110, 'rev': 105, 'diff': -5, 'diff_p': -4.55},
            ],
            'mcf': [
                {'name': 'mcf_0', 'origin': 50, 'rev': 50, 'diff': 0, 'diff_p': 0.0},
            ]
        }
    """
    comparison_data: Dict[str, List[Dict[str, Any]]] = {}
    all_full_names = sorted(set(origin_counts.keys()) | set(rev_counts.keys()))

    for full_name in all_full_names:
        base_name = get_base_benchmark_name(full_name)
        origin_count = origin_counts.get(full_name, 0)
        rev_count = rev_counts.get(full_name, 0)
        diff = rev_count - origin_count
        
        if origin_count != 0:
            diff_percent = (diff / origin_count * 100)
        elif diff == 0:
             diff_percent = 0.0 # Both are zero
        else:
             diff_percent = float('inf') if diff > 0 else float('-inf') # Origin is zero, rev is not

        run_details = {
            'name': full_name,
            'origin': origin_count,
            'rev': rev_count,
            'diff': diff,
            'diff_p': diff_percent
        }

        if base_name not in comparison_data:
            comparison_data[base_name] = []
        comparison_data[base_name].append(run_details)
        
    # Sort runs within each base name for consistent median calculation later
    for base_name in comparison_data:
         comparison_data[base_name].sort(key=lambda x: x['diff_p'])

    return comparison_data

def aggregate_results(comparison_data: Dict[str, List[Dict[str, Any]]]) -> Tuple[Dict[str, int], Dict[str, int]]:
    """
    Aggregates results by base benchmark name.

    Args:
        comparison_data: Detailed comparison data grouped by base name.

    Returns:
        Tuple[Dict[str, int], Dict[str, int]]: Two dictionaries (origin_aggregated, rev_aggregated)
        mapping base benchmark names to their total summed counts.
    """
    origin_aggregated: Dict[str, int] = {}
    rev_aggregated: Dict[str, int] = {}

    for base_name, runs in comparison_data.items():
        total_origin = sum(run['origin'] for run in runs)
        total_rev = sum(run['rev'] for run in runs)
        origin_aggregated[base_name] = total_origin
        rev_aggregated[base_name] = total_rev
        
    return origin_aggregated, rev_aggregated

def find_median_results(comparison_data: Dict[str, List[Dict[str, Any]]]) -> Tuple[Dict[str, int], Dict[str, int]]:
    """
    Finds the run with the median difference percentage for each base benchmark name.

    Args:
        comparison_data: Detailed comparison data grouped by base name, with runs sorted by diff_p.

    Returns:
        Tuple[Dict[str, int], Dict[str, int]]: Two dictionaries (origin_median, rev_median)
        mapping the *full name* of the median run to its corresponding counts.
    """
    origin_median: Dict[str, int] = {}
    rev_median: Dict[str, int] = {}

    for base_name, runs in comparison_data.items():
        if not runs:
            continue
        
        # Runs are already sorted by diff_p in calculate_comparison_data
        median_index = len(runs) // 2 
        median_run = runs[median_index]
        
        # Use the original full name of the median run as the key for printing
        origin_median[median_run['name']] = median_run['origin']
        rev_median[median_run['name']] = median_run['rev']
        
    return origin_median, rev_median

def print_comparison_table(origin_counts: Dict[str, int], rev_counts: Dict[str, int], title_suffix: str = ""):
    """
    Print a formatted comparison table of instruction counts.
    Handles cases where benchmarks might only exist in one dictionary.
    
    Args:
        origin_counts: Dictionary mapping benchmark name (can be full, base, or median run's name) to origin count.
        rev_counts: Dictionary mapping benchmark name to revised count.
        title_suffix: Optional string to append to the table title (e.g., "(Aggregated)").
    """
    # Get all unique benchmarks across both dictionaries
    all_benchmarks = sorted(set(origin_counts.keys()) | set(rev_counts.keys()))
    
    # Print table header
    print(f"\nBenchmark Instruction Count Comparison Table {title_suffix}:")
    print("-" * 110)
    print(f"{'Benchmark':<25} {'Origin Count':>20} {'Rev Count':>20} {'Diff':>20} {'Diff%':>15}") # Adjusted spacing
    print("-" * 110)
    
    # Print each benchmark's comparison
    for benchmark in all_benchmarks:
        origin_count = origin_counts.get(benchmark, 0)
        rev_count = rev_counts.get(benchmark, 0)
        diff = rev_count - origin_count
        
        # Calculate diff percentage, handling division by zero
        if origin_count != 0:
            diff_percent = (diff / origin_count * 100)
        elif diff == 0:
             diff_percent = 0.0 # Both are zero
        else:
             # Use math.inf for clearer representation of infinite percentage
             diff_percent = math.inf if diff > 0 else -math.inf 

        # Format large numbers with commas for readability
        # Handle infinity for printing percentage
        diff_percent_str = f"{diff_percent:,.2f}%" if isinstance(diff_percent, (int, float)) and math.isfinite(diff_percent) else f"{diff_percent}"
        
        print(f"{benchmark:<25} {origin_count:>20,d} {rev_count:>20,d} {diff:>20,d} {diff_percent_str:>15}")
    
    print("-" * 110)

def main():
    # --- Argument Parsing ---
    parser = argparse.ArgumentParser(
        description="Compare dynamic instruction counts between two sets of benchmark logs.",
        usage="%(prog)s <origin_directory> <rev_directory> [--aggregate | --median]"
    )
    parser.add_argument("origin_dir", help="Path to the directory containing original benchmark logs")
    parser.add_argument("rev_dir", help="Path to the directory containing revised benchmark logs")
    
    # Create a mutually exclusive group for the flags
    group = parser.add_mutually_exclusive_group()
    group.add_argument("-a", "--aggregate", action="store_true", 
                       help="Aggregate counts for benchmarks with the same base name (e.g., gcc_0, gcc_1 -> gcc)")
    group.add_argument("-m", "--median", action="store_true", 
                       help="Show only the run with the median difference percentage for benchmarks with multiple runs")
                       
    args = parser.parse_args()
    
    # --- Process Directories ---
    origin_raw_counts = process_directory(args.origin_dir)
    rev_raw_counts = process_directory(args.rev_dir)

    # --- Prepare Data for Comparison/Analysis ---
    # This step groups runs by base name and calculates individual diffs, needed for both median and aggregate
    comparison_data = calculate_comparison_data(origin_raw_counts, rev_raw_counts)

    # --- Determine which results to print based on flags ---
    if args.aggregate:
        origin_results, rev_results = aggregate_results(comparison_data)
        title = "(Aggregated)"
    elif args.median:
        origin_results, rev_results = find_median_results(comparison_data)
        title = "(Median Diff Run)"
    else:
        # Default behavior: use the raw counts processed initially
        origin_results, rev_results = origin_raw_counts, rev_raw_counts
        title = "(Individual Runs)"

    # --- Print Comparison Table ---
    # Pass the selected results (raw, aggregated, or median) to the print function
    print_comparison_table(origin_results, rev_results, title)

if __name__ == "__main__":
    main() 