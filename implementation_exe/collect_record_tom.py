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


def plot_comparison(dir1_results, dir2_results, output_file):
    # 獲取所有基準測試名稱（從檔案名取出）
    benchmarks1 = {os.path.basename(f).split('_')[0]: dir1_results[f]['success'] 
                  for f in dir1_results}
    benchmarks2 = {os.path.basename(f).split('_')[0]: dir2_results[f]['success'] 
                  for f in dir2_results}
    
    # 找出兩個目錄中都有的基準測試
    common_benchmarks = sorted(list(set(benchmarks1.keys()) & set(benchmarks2.keys())))
    
    # 準備繪圖數據
    x = np.arange(len(common_benchmarks))
    width = 0.35
    
    fig, ax = plt.subplots(figsize=(15, 8))
    
    # 建立長條圖
    rects1 = ax.bar(x - width/2, [benchmarks1[b] for b in common_benchmarks], 
                   width, label='origin', color='blue')
    rects2 = ax.bar(x + width/2, [benchmarks2[b] for b in common_benchmarks], 
                   width, label='rev', color='red')
    
    # 在長條圖上加入數值標籤
    def autolabel(rects):
        for rect in rects:
            height = rect.get_height()
            ax.annotate(f'{int(height)}',
                        xy=(rect.get_x() + rect.get_width() / 2, height),
                        xytext=(0, 5),
                        textcoords="offset points",
                        ha='center', va='bottom')
    
    autolabel(rects1)
    autolabel(rects2)
    
    # 自定義圖表
    ax.set_ylabel('Success Count')
    ax.set_title('Success Count Comparison Between Directories')
    ax.set_xticks(x)
    ax.set_xticklabels(common_benchmarks, rotation=45)
    ax.legend()
    
    plt.tight_layout()
    
    # 儲存圖表
    plt.savefig(f"{output_file}_comparison.png", bbox_inches='tight', dpi=300)
    plt.close()


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
    if len(sys.argv) != 4:
        print("Usage: python collect_record.py <directory_path_1> <directory_path_2> <output_file>")
        sys.exit(1)

    directory_path_1 = sys.argv[1]
    directory_path_2 = sys.argv[2]
    output_file = sys.argv[3]

    # 處理第一個目錄
    print(f"\nProcessing Directory 1: {directory_path_1}")
    dir1_results, dir1_attempts, dir1_fails, dir1_successes = process_directory(directory_path_1)
    
    # 處理第二個目錄
    print(f"\nProcessing Directory 2: {directory_path_2}")
    dir2_results, dir2_attempts, dir2_fails, dir2_successes = process_directory(directory_path_2)
    
    # 輸出總結果
    print("\nDirectory 1 Total Results:")
    print(f"Total Attempts: {dir1_attempts}")
    print(f"Total Successes: {dir1_successes}")
    print(f"Total Fails: {dir1_fails}")
    
    print("\nDirectory 2 Total Results:")
    print(f"Total Attempts: {dir2_attempts}")
    print(f"Total Successes: {dir2_successes}")
    print(f"Total Fails: {dir2_fails}")
    
    # 寫入結果到檔案
    with open(f"{output_file}.txt", 'w') as f:
        f.write("Directory 1 Results:\n")
        for file_path, results in dir1_results.items():
            f.write(f"\n{file_path}:\n")
            f.write(f"Attempts: {results['attempt']}\n")
            f.write(f"Successes: {results['success']}\n")
            f.write(f"Fails: {results['fail']}\n")
            
        f.write("\nDirectory 1 Total Results:\n")
        f.write(f"Total Attempts: {dir1_attempts}\n")
        f.write(f"Total Successes: {dir1_successes}\n")
        f.write(f"Total Fails: {dir1_fails}\n")
        
        f.write("\n\nDirectory 2 Results:\n")
        for file_path, results in dir2_results.items():
            f.write(f"\n{file_path}:\n")
            f.write(f"Attempts: {results['attempt']}\n")
            f.write(f"Successes: {results['success']}\n")
            f.write(f"Fails: {results['fail']}\n")
            
        f.write("\nDirectory 2 Total Results:\n")
        f.write(f"Total Attempts: {dir2_attempts}\n")
        f.write(f"Total Successes: {dir2_successes}\n")
        f.write(f"Total Fails: {dir2_fails}\n")
    
    # 為每個目錄個別繪製圖表
    plot_counts(dir1_results, f"{output_file}_dir1")
    plot_counts(dir2_results, f"{output_file}_dir2")
    
    # 繪製比較圖表
    plot_comparison(dir1_results, dir2_results, output_file)
