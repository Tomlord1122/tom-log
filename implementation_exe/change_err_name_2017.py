import os
import re
import logging
import shutil
# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def change_build_directory_names():
    base_dir = '/home/tomlord/workspace/SPECCPU2017/benchspec/CPU'
    # 遍歷所有基準測試目錄
    for benchmark in os.listdir(base_dir):
        benchmark_path = os.path.join(base_dir, benchmark)
        if os.path.isdir(benchmark_path):
            # 尋找 run 目錄
            build_dir = os.path.join(benchmark_path, 'build')
            if os.path.isdir(build_dir):
                for arch in os.listdir(build_dir):
                    if arch.startswith('riscv_tom_custom') or arch.startswith('riscv_tom_debug'):
                        arch_dir = os.path.join(build_dir, arch)
                        if os.path.isdir(arch_dir):
                            # Get make.err
                            # Find file that starts with 'make' and ends with '.out'
                            make_out_files = [f for f in os.listdir(arch_dir) if f.startswith('make') and f.endswith('.out')]
                            if make_out_files:
                                make_out_path = os.path.join(arch_dir, make_out_files[0])
                            else:
                                make_out_path = None
                            if  os.path.exists(make_out_path):
                                # Change make.err name to benchmark+arch
                                # new_name = os.path.join('/home/tomlord/workspace/Tom/', f"{benchmark}_{arch}_IR.ll")
                                if arch.startswith('riscv_tom_custom'):
                                    new_name_out = os.path.join('/home/tomlord/workspace/Tom/TTI/rev2017', f"{benchmark}_{arch}_out.log")
                                elif arch.startswith('arm2017'):
                                    new_name_out = os.path.join('/home/tomlord/workspace/Tom/TTI/arm2017', f"{benchmark}_{arch}_out.log")
                                elif arch.startswith('arm_tom_after'):
                                    new_name_out = os.path.join('/home/tomlord/workspace/Tom/TTI/arm_tom_after', f"{benchmark}_{arch}_out.log")
                                else:
                                    new_name_out = os.path.join('/home/tomlord/workspace/Tom/TTI/origin2017', f"{benchmark}_{arch}_out.log")
                                shutil.copyfile(make_out_path, new_name_out)
                                logging.info(f"Successfully renamed {make_out_path} to {new_name_out}")
                            

if __name__ == '__main__':
    try:
        change_build_directory_names()
        logging.info("Script completed successfully")
    except Exception as e:
        logging.exception("An unexpected error occurred:")
