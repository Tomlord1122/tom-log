import os
import re
import logging
import shutil
# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def change_build_directory_names():
    base_dir = '/home/tomlord/workspace/SPECCPU2006/benchspec/CPU2006'
    # 遍歷所有基準測試目錄
    for benchmark in os.listdir(base_dir):
        benchmark_path = os.path.join(base_dir, benchmark)
        if os.path.isdir(benchmark_path):
            # 尋找 run 目錄
            run_dir = os.path.join(benchmark_path, 'run')
            if os.path.isdir(run_dir):
                for arch in os.listdir(run_dir):
                    # if arch.startswith('riscv_tom_custom') or arch.startswith('arm_tom_after') or arch.startswith('riscv_tom_after'):
                    if arch.startswith('riscv_tom_custom') :
                        arch_dir = os.path.join(run_dir, arch)
                        if os.path.isdir(arch_dir):
                            # Get make.err
                            make_err_path = os.path.join(arch_dir, 'make.err')
                            make_out_path = os.path.join(arch_dir, 'make.out')
                            if os.path.exists(make_err_path) or os.path.exists(make_out_path):
                                # Change make.err name to benchmark+arch
                                if arch.startswith('riscv_tom_custom') :
                                # if arch.startswith('riscv_tom_custom') or arch.startswith('riscv_tom_after'):
                                    # new_name_out = os.path.join('/home/tomlord/workspace/Tom/WIDEN_REVERSE', f"{benchmark}_{arch}_out.log")
                                    # new_name_out = os.path.join('/home/tomlord/workspace/Tom/TTI/origin-cost', f"{benchmark}_{arch}_out.log")
                                    # new_name_out = os.path.join('/home/tomlord/workspace/Tom/WIDEN_REVERSE', f"{benchmark}_{arch}_out.log")
                                    new_name_out = os.path.join('/home/tomlord/workspace/Tom/TTI/rev', f"{benchmark}_{arch}_out.log")
                                    # new_name_err = os.path.join('/home/tomlord/workspace/Tom/WIDEN_REVERSE', f"{benchmark}_{arch}_IR.ll")
                                elif arch.startswith('arm_tom_after'):
                                    new_name_out = os.path.join('/home/tomlord/workspace/Tom/WIDEN_REVERSE', f"{benchmark}_{arch}_out.log")
                                else:
                                    new_name_out = os.path.join('/home/tomlord/workspace/Tom/WIDEN_REVERSE', f"{benchmark}_{arch}_out.log")
                                try:
                                    # out.log -------------------------------------
                                    shutil.copyfile(make_out_path, new_name_out)
                                    # shutil.copyfile(make_err_path, new_name_err)
                                    logging.info(f"Successfully renamed {make_out_path} to {new_name_out}")
                            
                                except OSError as e:
                                    logging.error(f"Error renaming {make_err_path}: {e}")
  

if __name__ == '__main__':
    try:
        change_build_directory_names()
        logging.info("Script completed successfully")
    except Exception as e:
        logging.exception("An unexpected error occurred:")
