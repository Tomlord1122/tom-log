import re
import numpy as np
import matplotlib.pyplot as plt
import sys
import os
import argparse


def collect_record(file_path):
    attempt_count = 0
    success_count = 0
    fail_count = 0

    try:
        with open(file_path, 'r') as file:
            # 讀取整個文件內容
            content = file.read()

            # 使用更精確的模式匹配
            attempts = re.findall(r'LV: Selecting VF:', content)
            successes = re.findall(r'Executing best plan with VF', content)

            attempt_count = len(attempts)
            success_count = len(successes)
            fail_count = attempt_count - success_count

            print(f"\nResults for {file_path}:")
            print(f"Attempt count: {attempt_count}")
            print(f"Success count: {success_count}")
            print(f"Fail count: {fail_count}")

            return attempt_count, fail_count, success_count

    except Exception as e:
        print(f"Error processing file {file_path}: {str(e)}")
        return 0, 0, 0


def plot_master_comparison(all_dirs_data: dict, output_file_prefix: str):
    """
    Generates a single plot comparing success counts for common benchmarks across all specified directories.

    Args:
        all_dirs_data (dict): A dictionary where keys are directory names and values are
                              their processed results (including a 'results' key which maps
                              file paths to 'success' counts, and a 'name' key for the dir name).
                              Example: {'base_dir_name': {'results': {'file1_path': {'success': 10,...}}, 'name': 'base_dir_name'}, ...}
        output_file_prefix (str): Prefix for the output plot file.
    """
    dir_names = list(all_dirs_data.keys())
    if not dir_names:
        print("No directory data provided for master comparison plot.")
        return

    # Extract benchmark success counts for each directory
    # benchmark_data will be: {dir_name: {benchmark_short_name: success_count}}
    benchmark_data = {}
    for dir_name, data in all_dirs_data.items():
        current_dir_benchmarks = {}
        if data.get('results'): # Check if 'results' exist for the directory
            for file_path, counts in data['results'].items():
                # Assuming get_benchmark_name or similar logic to get short name
                short_benchmark_name = os.path.basename(file_path).split('_')[0]
                current_dir_benchmarks[short_benchmark_name] = counts['success']
        benchmark_data[dir_name] = current_dir_benchmarks
        
    # Find common benchmarks across all directories
    if not benchmark_data:
        print("No benchmark data extracted. Skipping master plot.")
        return

    common_benchmarks_set = set()
    first_dir = True
    for dir_name in dir_names:
        if benchmark_data[dir_name]: # Only consider dirs with data
            if first_dir:
                common_benchmarks_set = set(benchmark_data[dir_name].keys())
                first_dir = False
            else:
                common_benchmarks_set.intersection_update(benchmark_data[dir_name].keys())
        else: # If any directory has no data, there can be no common benchmarks with it
            common_benchmarks_set.clear() # Or handle more gracefully, e.g. exclude this dir
            print(f"Warning: Directory {dir_name} has no benchmark data. It might affect common benchmark calculation.")


    if not common_benchmarks_set:
        print("No common benchmarks found across all directories. Skipping master comparison plot.")
        return
        
    common_benchmarks_list = sorted(list(common_benchmarks_set))
    num_common_benchmarks = len(common_benchmarks_list)
    num_dirs = len(dir_names)

    fig, ax = plt.subplots(figsize=(max(15, num_common_benchmarks * num_dirs * 0.5), 8)) # Dynamic width
    
    # Define bar width based on number of directories
    total_width_per_benchmark = 0.8 # How much space a group of bars for a benchmark takes
    bar_width = total_width_per_benchmark / num_dirs
    
    x_indices = np.arange(num_common_benchmarks) # Position for each group of bars

    # Create color cycle for directories if more than a few, or define manually
    colors = plt.cm.get_cmap('tab10', num_dirs) # Using a colormap
    colors = ['blue', 'red', 'green']
    for i, dir_name in enumerate(dir_names):
        # Get success counts for common benchmarks for the current directory
        success_counts = [benchmark_data[dir_name].get(b, 0) for b in common_benchmarks_list]
        
        # Calculate offset for each bar within the group
        bar_offset = (i - num_dirs / 2 + 0.5) * bar_width
        # Use direct color indexing instead of calling colors as a function
        color = colors[i % len(colors)]  # Use modulo to handle case with more than 3 directories
        rects = ax.bar(x_indices + bar_offset, success_counts, bar_width, label=dir_name, color=color)
        autolabel(rects, ax) # Pass ax to autolabel

    ax.set_ylabel('Success Count')
    ax.set_title('Success Count Comparison Across Directories')
    ax.set_xticks(x_indices)
    ax.set_xticklabels(common_benchmarks_list, rotation=45, ha="right")
    ax.legend(title="Directories")
    
    plt.tight_layout()
    
    output_plot_file = f"{output_file_prefix}_all_dirs_comparison.png"
    output_plot_dir = os.path.dirname(output_plot_file)
    if output_plot_dir and not os.path.exists(output_plot_dir):
        os.makedirs(output_plot_dir)
    plt.savefig(output_plot_file, bbox_inches='tight', dpi=300)
    print(f"Master comparison plot saved to: {output_plot_file}")
    plt.close()

def autolabel(rects, ax): # Added ax argument
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate(f'{int(height)}',
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')

def process_directory(directory_path):
    all_results = {}
    total_attempts = 0
    total_fails = 0
    total_successes = 0
    
    for filename in os.listdir(directory_path):
        file_path = os.path.join(directory_path, filename)
        if os.path.isfile(file_path) and filename.endswith('.log'):
            print(f"\nProcessing file: {filename}")
            attempt_count, fail_count, success_count = collect_record(file_path)
            
            # 加入總計
            total_successes += success_count
            total_attempts += attempt_count
            total_fails += fail_count
            
            # 儲存個別檔案結果
            all_results[file_path] = {
                'attempt': attempt_count,
                'fail': fail_count,
                'success': success_count
            }
    
    return all_results, total_attempts, total_fails, total_successes


if __name__ == '__main__':
    # --- Argument Parsing ---
    parser = argparse.ArgumentParser(description="Collects and compares LLVM vectorization records from log files in specified directories.")
    parser.add_argument("base_directory", help="Path to the base directory containing log files.")
    parser.add_argument("comparison_directories", nargs='+', help="Paths to one or more comparison directories containing log files.")
    parser.add_argument("output_file_prefix", help="Prefix for the output files (e.g., 'results/experiment1_').")
    
    args = parser.parse_args()

    base_dir_path = args.base_directory
    comparison_dir_paths = args.comparison_directories
    output_prefix = args.output_file_prefix

    # Ensure output directory from prefix exists
    output_dir_from_prefix = os.path.dirname(output_prefix)
    if output_dir_from_prefix and not os.path.exists(output_dir_from_prefix):
        os.makedirs(output_dir_from_prefix)
        print(f"Created output directory: {output_dir_from_prefix}")

    # --- Process Base Directory ---
    base_dir_name = os.path.basename(base_dir_path.rstrip('/\\')) # Get a clean name for the directory
    print(f"\nProcessing Base Directory: {base_dir_name} ({base_dir_path})")
    base_results, base_total_attempts, base_total_fails, base_total_successes = process_directory(base_dir_path)
    
    # Store all processed data including base
    all_dirs_data_for_plot = {
        base_dir_name: {
            'path': base_dir_path,
            'results': base_results,
            'total_attempts': base_total_attempts,
            'total_fails': base_total_fails,
            'total_successes': base_total_successes,
            'name': base_dir_name
        }
    }
    
    # --- Process Comparison Directories ---
    for comp_dir_path in comparison_dir_paths:
        comp_dir_name = os.path.basename(comp_dir_path.rstrip('/\\'))
        print(f"\nProcessing Comparison Directory: {comp_dir_name} ({comp_dir_path})")
        comp_results, comp_total_attempts, comp_total_fails, comp_total_successes = process_directory(comp_dir_path)
        
        all_dirs_data_for_plot[comp_dir_name] = {
            'path': comp_dir_path,
            'results': comp_results,
            'total_attempts': comp_total_attempts,
            'total_fails': comp_total_fails,
            'total_successes': comp_total_successes,
            'name': comp_dir_name
        }
        # Removed individual plot_counts and pairwise plot_comparison calls

    # --- Generate a single master comparison plot ---
    if any(d.get('results') for d in all_dirs_data_for_plot.values()): # Check if any dir has results
        plot_master_comparison(all_dirs_data_for_plot, output_prefix)
    else:
        print("No results found in any directory. Skipping master comparison plot.")

    # --- Write Combined Results to Text File ---
    with open(f"{output_prefix}summary_report.txt", 'w') as f:
        for dir_name, data in all_dirs_data_for_plot.items(): # Use the same data dict
            f.write(f"--- Results for Directory: {dir_name} ({data['path']}) ---\n")
            f.write(f"Total Attempts: {data['total_attempts']}\n")
            f.write(f"Total Successes: {data['total_successes']}\n")
            f.write(f"Total Fails: {data['total_fails']}\n")
            
            if data['results']:
                f.write("\nIndividual File Results:\n")
                for file_path, results_detail in data['results'].items():
                    f.write(f"  File: {os.path.basename(file_path)}\n")
                    f.write(f"    Attempts: {results_detail['attempt']}\n")
                    f.write(f"    Successes: {results_detail['success']}\n")
                    f.write(f"    Fails: {results_detail['fail']}\n")
            else:
                f.write("  No log files processed in this directory.\n")
            f.write("\n\n")
            
    print(f"\nProcessing complete. Summary report saved to: {output_prefix}summary_report.txt")
    print(f"Plots saved with prefix: {output_prefix}")
