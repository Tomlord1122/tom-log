import os
import re
import shutil

def change_build_directory_names():
    base_dir = '/home/tomlord/workspace/SPECCPU2006/benchspec/CPU2006'
    # base_dir = '/home/tomlord/workspace/SPECCPU2017/benchspec/CPU'
    # 遍歷所有基準測試目錄
    for benchmark in os.listdir(base_dir):
        benchmark_path = os.path.join(base_dir, benchmark)
        if os.path.isdir(benchmark_path):
            # 尋找 build_base_*** 目錄
            for item in os.listdir(benchmark_path):
                if item.startswith('run'):
                    run_dir = os.path.join(benchmark_path, item)
                    if os.path.isdir(run_dir):
                        for run_item in os.listdir(run_dir):
                            if run_item.startswith('build_base_'):
                                build_dir = os.path.join(run_dir, run_item)
                                # 讀取 Makefile.spec 文件
                                makefile_spec_path = os.path.join(build_dir, 'Makefile.spec')
                                if os.path.exists(makefile_spec_path):
                                    with open(makefile_spec_path, 'r') as f:
                                        content = f.read()
                                    # 尋找 configpath
                                    match = re.search(r'configpath\s*=\s*(.+)', content)
                                    if match:
                                        config_path = match.group(1).strip() # 
                                        # 提取目標名稱
                                        target_name = os.path.basename(config_path).replace('.cfg', '')
                                        # 創建新的目錄名
                                        new_dir_name = target_name
                                        new_dir_path = os.path.join(benchmark_path + "/run/", new_dir_name)
                                        # 重命名目錄
                                        if new_dir_name != item:
                                            if os.path.exists(new_dir_path):
                                                shutil.rmtree(new_dir_path)
                                            shutil.move(build_dir, new_dir_path)
                                            print(f'Renamed: {build_dir} -> {new_dir_path}')

if __name__ == '__main__':
    change_build_directory_names()
