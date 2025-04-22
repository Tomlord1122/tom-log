#!/usr/bin/env python3
import sys
import re
import os
from pathlib import Path
from typing import Dict

# Usage method: python3 insn-diff.py <directory_origin_path> <directory_custom_path>
# This file will compare the dynamic instruction count of the origin and custom LLVM Implmentation


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
        return 0
    
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found")
        return 0
    except Exception as e:
        print(f"Error processing file: {str(e)}")
        return 0

def get_benchmark_name(filename):
    """
    Extract the benchmark name without the sequence number
    
    Args:
        filename (str): Full filename (e.g., 'perlbench.0.log')
        
    Returns:
        str: Benchmark name (e.g., 'perlbench')
    """
    return filename.split('.')[0]

def process_directory(directory_path) -> Dict[str, int]:
    """
    Process all log files in the given directory
    
    Args:
        directory_path (str): Path to the directory containing log files
    
    Returns:
        Dict[str, int]: Dictionary mapping benchmark names to total instruction counts
    """
    dir_path = Path(directory_path)
    
    if not dir_path.is_dir():
        print(f"Error: Directory '{directory_path}' not found")
        sys.exit(1)
    
    results = {}
    
    # Group files by benchmark name
    benchmark_files = {}
    for file_path in dir_path.glob('*.log'):
        benchmark_name = get_benchmark_name(file_path.name)
        if benchmark_name not in benchmark_files:
            benchmark_files[benchmark_name] = []
        benchmark_files[benchmark_name].append(file_path)
    
    # Process each benchmark's files
    for benchmark, files in benchmark_files.items():
        total_insns = 0
        for file_path in files:
            insn_count = parse_insn_count(file_path)
            total_insns += insn_count
        results[benchmark] = total_insns
    
    return results

def print_comparison_table(origin_counts: Dict[str, int], rev_counts: Dict[str, int]):
    """
    Print a formatted comparison table of instruction counts
    """
    # Get all unique benchmarks
    all_benchmarks = sorted(set(origin_counts.keys()) | set(rev_counts.keys()))
    
    # Print table header
    print("\nBenchmark Instruction Count Comparison Table:")
    print("-" * 100)
    print(f"{'Benchmark':<15} {'Origin Count':>20} {'Rev Count':>20} {'Diff':>20} {'Diff%':>20}")
    print("-" * 100)
    
    # Print each benchmark's comparison
    for benchmark in all_benchmarks:
        origin_count = origin_counts.get(benchmark, 0)
        rev_count = rev_counts.get(benchmark, 0)
        diff = rev_count - origin_count
        diff_percent = (diff / origin_count * 100) if origin_count != 0 else float('inf')
        
        # Format large numbers with commas for readability
        print(f"{benchmark:<15} {origin_count:>20,d} {rev_count:>20,d} {diff:>20,d} {diff_percent:>20.2f}%")
    
    print("-" * 100)

def main():
    if len(sys.argv) != 3:
        print("Usage: python insn-diff.py <origin_directory> <rev_directory>")
        sys.exit(1)
    
    origin_dir = sys.argv[1]
    rev_dir = sys.argv[2]
    
    # Process both directories
    origin_counts = process_directory(origin_dir)
    rev_counts = process_directory(rev_dir)
    
    # Print comparison table
    print_comparison_table(origin_counts, rev_counts)

if __name__ == "__main__":
    main() 