import re
import os

def parse_log_file(file_path):
    """解析 log 文件，提取 benchmark 數據"""
    benchmark_data = {}
    
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    # 跳過表頭
    for line in lines:
        if line.strip() and not line.startswith('----') and not line.startswith('Benchmark'):
            # 使用正則表達式分割行並移除逗號
            parts = re.split(r'\s+', line.strip())
            
            # 確定 benchmark 的名稱，通常是第一個元素但需要處理可能包含下劃線的情況
            benchmark_name = '_'.join(parts[0].split('_')[0:1])  # 只取第一部分作為 benchmark 名稱
            
            # 提取 Origin Count 和 Rev Count（需移除逗號）
            origin_count = int(parts[-4].replace(',', ''))
            rev_count = int(parts[-3].replace(',', ''))
            
            # 在字典中累加該 benchmark 的數據
            if benchmark_name not in benchmark_data:
                benchmark_data[benchmark_name] = {'origin': 0, 'rev': 0}
            
            benchmark_data[benchmark_name]['origin'] += origin_count
            benchmark_data[benchmark_name]['rev'] += rev_count
    
    return benchmark_data

def calculate_diff_and_percentage(data):
    """計算 diff 和 diff%"""
    for benchmark in data:
        origin = data[benchmark]['origin']
        rev = data[benchmark]['rev']
        diff = rev - origin
        
        # 避免除以零的情況
        if origin == 0:
            diff_percent = 0
        else:
            diff_percent = (diff / origin) * 100
        
        data[benchmark]['diff'] = diff
        data[benchmark]['diff_percent'] = diff_percent
    
    return data

def format_number(number):
    """將數字格式化為帶逗號的形式"""
    return f"{number:,}"

def print_results(data, output_file):
    """按照指定格式輸出結果"""
    with open(output_file, 'w') as f:
        f.write("Benchmark Instruction Count Comparison Table (Aggregated):\n")
        f.write("-" * 110 + "\n")
        f.write("{:<30} {:<20} {:<20} {:<20} {:<10}\n".format(
            "Benchmark", "Origin Count", "Rev Count", "Diff", "Diff%"))
        f.write("-" * 110 + "\n")
        
        for benchmark in sorted(data.keys()):
            origin = data[benchmark]['origin']
            rev = data[benchmark]['rev']
            diff = data[benchmark]['diff']
            diff_percent = data[benchmark]['diff_percent']
            
            f.write("{:<30} {:>20} {:>20} {:>20} {:>10.2f}%\n".format(
                benchmark, 
                format_number(origin), 
                format_number(rev), 
                format_number(diff),
                diff_percent))
        
        f.write("-" * 110 + "\n")
        print(f"結果已寫入到 {output_file}")

def process_log_files(log_files, output_files):
    """處理多個 log 文件並輸出結果"""
    for log_file, output_file in zip(log_files, output_files):
        # 解析 log 文件
        data = parse_log_file(log_file)
        
        # 計算 diff 和 diff%
        data = calculate_diff_and_percentage(data)
        
        # 輸出結果
        print_results(data, output_file)

if __name__ == "__main__":
    # 設定 log 檔案路徑和輸出檔案路徑
    log_files = ["./insn-diff-2006.log", 
                "./insn-diff-2017.log"]
    output_files = ["./aggregate-2006.log", 
                   "./aggregate-2017.log"]
    
    # 處理 log 檔案
    process_log_files(log_files, output_files)
