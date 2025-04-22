#!/usr/bin/env python3
import sys
import re
import os
from pathlib import Path
from typing import Dict

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

def main():
    # Check if both directory paths are provided as command line arguments
    if len(sys.argv) != 3:
        print("Usage: python cost-diff.py <origin_directory> <rev_directory>")
        sys.exit(1)
    
    # Get directory paths from command line arguments
    origin_dir = sys.argv[1]
    rev_dir = sys.argv[2]
    
    # Process both directories
    origin_costs = process_directory(origin_dir)
    rev_costs = process_directory(rev_dir)
    
    # Print comparison table with directory names
    print_comparison_table(origin_costs, rev_costs, origin_dir, rev_dir)

if __name__ == "__main__":
    main()
