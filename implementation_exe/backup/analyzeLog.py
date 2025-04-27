#!/usr/bin/env python3
import os
import sys
import re

# usage: python3 analyzeLog.py <directory_path> 
# It will count the number of "vector reverse" occurrences in the final VPlan recipes
# The result will help us to know which benchmarks are more likely to have vector reverse

def count_reverse_in_vplan(log_content):
    # Go through every line of the log file
    vplan_blocks = []
    current_block = []
    in_vplan = False
    executing_plan = False
    current_function = ""  # 用來存儲當前處理的函數信息

    # Go through every line of the log file
    for line in log_content.split('\n'):
        # Check if we found a function that is being costed
        if "-----------------Function that is being costed:" in line:
            # 提取函數名稱和位置信息
            match = re.search(r"Function that is being costed:'([^']+)' from ([^-]+)", line)
            if match:
                function_name = match.group(1)
                location = match.group(2).strip()
                current_function = f"{location} with {function_name}"
        # Check if the line contains "Executing best plan with VF="
        elif "Executing best plan with VF=" in line:
            executing_plan = True
            
        # Check if this is the start of a VPlan block
        elif "================ Final VPlan ================" in line and executing_plan and not in_vplan:
            in_vplan = True
            current_block = []
            
        # Check if this is the end of a VPlan block
        elif "================ Final VPlan ================" in line and in_vplan:
            in_vplan = False
            vplan_blocks.append((current_function, current_block))  # 存儲函數信息和對應的VPlan塊
            executing_plan = False
            
        # If the line is in the VPlan block, then add the current line to the current block
        elif in_vplan:
            current_block.append(line)
    
    # Calculate the number of "reverse" occurrences in each VPlan block
    total_reverse_count = 0
    function_reverse_counts = {}  # 用來追蹤每個函數中的reverse數量
    
    for func, block in vplan_blocks:
        block_reverse_count = 0
        for line in block:
            if "reverse" in line:
                block_reverse_count += 1
                total_reverse_count += 1
        
        # 如果這個函數中有reverse，更新計數
        if block_reverse_count > 0:
            if func in function_reverse_counts:
                function_reverse_counts[func] += block_reverse_count
            else:
                function_reverse_counts[func] = block_reverse_count
    
    # 只有當總數大於0時才輸出函數詳情
    if total_reverse_count > 0:
        for func, count in function_reverse_counts.items():
            print(f"{func}: {count} reverse")
    
    return total_reverse_count

def analyze_log_files(directory_path):
    total_reverse_count = 0
    files_processed = 0
    files_with_reverse = 0
    
    # Go through every file in the directory
    for root, _, files in os.walk(directory_path):
        for file in files:
            # Only process .log files
            if file.endswith('.log'):
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, 'r', errors='ignore') as f:
                        log_content = f.read()
                    
                    # Count the number of "reverse" occurrences in the current file
                    file_reverse_count = count_reverse_in_vplan(log_content)
                    
                    # 只有當檔案中有reverse出現時才處理並輸出
                    if file_reverse_count > 0:
                        files_with_reverse += 1
                        # Extract benchmark name by finding either 'rev/' or 'rev2017/' in the path
                        if 'rev/' in file_path:
                            benchmark_name = file_path.split('rev/')[1].split('_')[0]
                        elif 'rev2017/' in file_path:
                            benchmark_name = file_path.split('rev2017/')[1].split('_')[0]
                        else:
                            # Fallback: just use the filename if neither pattern is found
                            benchmark_name = os.path.basename(file_path).split('_')[0]
                        print(f"{benchmark_name}: Total {file_reverse_count} reverse occurrences")                    
                        total_reverse_count += file_reverse_count
                        print("----------------------------------------")
                    
                    files_processed += 1
                except Exception as e:
                    print(f"Error processing {file_path}: {e}")
    
    print(f"\nTotal files processed: {files_processed}")
    print(f"Files with reverse occurrences: {files_with_reverse}")
    print(f"Total reverse occurrences across all files: {total_reverse_count}")
    
    return total_reverse_count

def main():
    if len(sys.argv) != 2:
        print("Usage: python analyzeLog.py <directory_path>")
        sys.exit(1)
    
    directory_path = sys.argv[1]
    
    if not os.path.isdir(directory_path):
        print(f"Error: {directory_path} is not a valid directory")
        sys.exit(1)
    
    total_count = analyze_log_files(directory_path)

if __name__ == "__main__":
    main()
