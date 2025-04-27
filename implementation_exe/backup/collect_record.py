import re
import numpy as np
import matplotlib.pyplot as plt
import sys
import os


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


def plot_counts(all_results, output_file):
    # Get unique files
    files_list = sorted(list(all_results.keys()))

    # Prepare data for plotting
    x = np.arange(len(files_list))
    width = 0.25  # Width of bars

    fig, ax = plt.subplots(figsize=(15, 8))

    # Extract data for each category
    # attempts = [all_results[f]['attempt'] for f in files_list]
    fails = [all_results[f]['fail'] for f in files_list]
    successes = [all_results[f]['success'] for f in files_list]

    # Create bars
    # rects1 = ax.bar(x - width/2, attempts, width, label='Attempts', color='blue')
    rects2 = ax.bar(x - width/2, successes, width, label='Successes', color='blue')
    rects3 = ax.bar(x + width/2, fails, width, label='Fails', color='red')

    # Add value labels on top of bars
    def autolabel(rects):
        for rect in rects:
            height = rect.get_height()
            ax.annotate(f'{int(height)}',
                        xy=(rect.get_x() + rect.get_width() / 2, height),
                        # Increased vertical offset to avoid overlap
                        xytext=(0, 5),
                        textcoords="offset points",
                        ha='center', va='bottom')
    # autolabel(rects1)
    autolabel(rects2)
    autolabel(rects3)

    # Customize the plot
    ax.set_ylabel('Count')
    ax.set_title('Loop Vectorization Results Across Files')
    ax.set_xticks(x)

    # Simplify file names for better readability
    labels = [f.split('/')[-1].split('_')[0] for f in files_list]
    ax.set_xticklabels(labels, rotation=45)

    ax.legend()
    plt.tight_layout()

    # Save the plot
    plt.savefig(f"{output_file}_results.png", bbox_inches='tight', dpi=300)
    plt.close()


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python collect_record.py <directory_path> <output_file>")
        sys.exit(1)

    directory_path = sys.argv[1]
    output_file = sys.argv[2]

    # Store results for all files
    all_results = {}
    total_attempts = 0
    total_fails = 0
    total_successes = 0
    # Process each file
    for filename in os.listdir(directory_path):
        file_path = os.path.join(directory_path, filename)
        if os.path.isfile(file_path) and filename.endswith('.log'):
            print(f"\nProcessing file: {filename}")
            attempt_count, fail_count, success_count = collect_record(
                file_path)

            # Add to totals
            total_successes += success_count
            total_attempts += attempt_count
            total_fails += fail_count
            # Store individual file results
            all_results[file_path] = {
                'attempt': attempt_count,
                'fail': fail_count,
                'success': success_count  # Add success count to results dictionary
            }

    # Print total results
    print("\nTotal Results:")
    print(f"Total Attempts: {total_attempts}")
    print(f"Total Successes: {total_successes}")  # Print total successes
    print(f"Total Fails: {total_fails}")

    # Write results to file
    with open(f"{output_file}.txt", 'w') as f:
        f.write("Individual File Results:\n")
        for file_path, results in all_results.items():
            f.write(f"\n{file_path}:\n")
            f.write(f"Attempts: {results['attempt']}\n")
            f.write(f"Successes: {results['success']}\n")  # Write success count
            f.write(f"Fails: {results['fail']}\n")

        f.write("\nTotal Results:\n")
        f.write(f"Total Attempts: {total_attempts}\n")
        f.write(f"Total Successes: {total_successes}\n")  # Write total successes
        f.write(f"Total Fails: {total_fails}\n")

    # Create plot
    plot_counts(all_results, output_file)
