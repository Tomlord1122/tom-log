import os  # 用來處理檔案路徑和目錄
import subprocess # 用來執行外部指令，像 run.sh
import concurrent.futures # 匯入多執行緒相關模組
import time # 匯入時間模組，可以選擇性地用來計時
import sys # 匯入 sys 模組，用於結束腳本
import shutil # 匯入 shutil 模組，用於檔案複製

# --- 設定區 ---

# 基礎目錄列表，把你要檢查的四個主要目錄放在這裡
base_dirs = [
    "/home/tomlord/workspace/Speckle-2017/build/overlay/riscv_tom_debug/fprate/ref",
    "/home/tomlord/workspace/Speckle-2017/build/overlay/riscv_tom_custom/fprate/ref",
    "/home/tomlord/workspace/Speckle-2017/build/overlay/riscv_tom_debug/intrate/ref",
    "/home/tomlord/workspace/Speckle-2017/build/overlay/riscv_tom_custom/intrate/ref"
]

# benchmark 編號列表 (作為前綴)
benchmark_nums = [508, 510, 511, 519, 538, 544, 500, 502, 520, 525, 531, 541, 557]
benchmark_num_strs = [str(num) for num in benchmark_nums]

# 設定最大同時執行的執行緒數量
MAX_THREADS = 8

# Log 分類的目標基礎路徑
LOG_TARGET_BASE_PATH = "/home/tomlord/workspace/Speckle-2017"
ORIGIN_LOG_DIR = os.path.join(LOG_TARGET_BASE_PATH, "origin")
REV_LOG_DIR = os.path.join(LOG_TARGET_BASE_PATH, "rev")


# --- Worker Function ---
# 這個函式會在獨立的執行緒中執行，負責執行單一個 benchmark 的 run.sh
def run_single_benchmark(benchmark_dir, bench_num_prefix):
    """
    執行指定 benchmark 目錄下的 run.sh 腳本。

    Args:
        benchmark_dir (str): 包含 run.sh 的完整 benchmark 目錄路徑。
        bench_num_prefix (str): 用來識別的 benchmark 編號前綴 (僅用於印出訊息)。
    """
    run_script_path = os.path.join(benchmark_dir, "run.sh")
    # 取得目錄名稱，方便在訊息中顯示
    dir_name = os.path.basename(benchmark_dir)
    base_name = os.path.basename(os.path.dirname(benchmark_dir)) # 取得上一層目錄名 (例如 ref)

    # 檢查 run.sh 檔案是否存在
    if os.path.isfile(run_script_path):
        # 加上 [Thread] 前綴，方便區分不同執行緒的輸出
        print(f"  [Thread] 開始執行: {dir_name} (於 {base_name})")

        # 執行 run.sh
        try:
            start_time = time.time() # 記錄開始時間
            # 執行 run.sh，增加 timeout 避免卡住 (例如 300 秒 = 5 分鐘)
            result = subprocess.run(
                ['bash', 'run.sh'],
                cwd=benchmark_dir,      # 在 benchmark 目錄下執行
                check=True,             # 如果 run.sh 報錯，則拋出例外
                capture_output=True,    # 捕捉標準輸出和標準錯誤
                text=True,              # 讓輸出是文字格式
            )
            end_time = time.time()   # 記錄結束時間
            duration = end_time - start_time # 計算執行時間
            # 執行成功
            print(f"    [Thread] ✅ 執行成功: {dir_name} (於 {base_name}) (耗時: {duration:.2f} 秒)")

        except FileNotFoundError:
            print(f"    [Thread] ❌ 錯誤：在 {dir_name} 找不到 bash 命令或 run.sh 腳本。")
        except subprocess.CalledProcessError as e:
            print(f"    [Thread] ❌ 執行失敗: {dir_name} (於 {base_name})")
            print(f"      錯誤訊息:\n{e.stderr.strip()}")
        except Exception as e:
            print(f"    [Thread] ❌ 發生預期外的錯誤於 {dir_name} (於 {base_name}): {e}")

    else:
        print(f"  [Thread] 在 benchmark 目錄 {dir_name} (前綴 {bench_num_prefix}) 中找不到 run.sh，跳過。")

# --- Log Collection Function ---
def collect_and_classify_logs(tasks_completed):
    """
    收集並分類已完成 benchmark 的 log 檔案。

    Args:
        tasks_completed (list): 一個包含 (benchmark_dir, prefix, original_base_dir) 元組的列表。
    """
    print("\n---\n開始收集並分類 Log 檔案...")
    processed_benchmarks = set() # 用來記錄已處理過的 benchmark 目錄，避免重複處理

    for benchmark_dir, _, original_base_dir in tasks_completed:
        # 如果這個 benchmark 目錄已經處理過，就跳過
        if benchmark_dir in processed_benchmarks:
            continue
        processed_benchmarks.add(benchmark_dir)

        # 組合出 logs 資料夾的路徑
        logs_dir = os.path.join(benchmark_dir, "logs")

        # 檢查 logs 資料夾是否存在
        if os.path.isdir(logs_dir):
            target_dest_dir = None
            target_subdir_name = ""

            # 判斷目標分類目錄
            if "riscv_tom_debug" in original_base_dir:
                target_dest_dir = ORIGIN_LOG_DIR
                target_subdir_name = "origin"
            elif "riscv_tom_custom" in original_base_dir:
                target_dest_dir = REV_LOG_DIR
                target_subdir_name = "rev"

            # 如果成功判斷出目標目錄
            if target_dest_dir:
                try:
                    # 確保目標目錄存在，如果不存在就建立它
                    # exist_ok=True 表示如果目錄已經存在，也不會報錯
                    os.makedirs(target_dest_dir, exist_ok=True)
                    print(f"  檢查 Logs 於: {os.path.basename(benchmark_dir)} (來自 {os.path.basename(original_base_dir)})")
                    print(f"    目標分類目錄: {target_subdir_name}/")

                    # 遍歷 logs 資料夾下的所有檔案
                    for log_filename in os.listdir(logs_dir):
                        src_log_path = os.path.join(logs_dir, log_filename)

                        # 確保我們處理的是檔案，而不是子目錄或其他東西
                        if os.path.isfile(src_log_path):
                            # 組合出目標檔案路徑
                            dest_log_path = os.path.join(target_dest_dir, log_filename)
                            try:
                                # 複製檔案，使用 copy2 保留元數據
                                shutil.copy2(src_log_path, dest_log_path)
                                print(f"      已複製: {log_filename} -> {target_subdir_name}/")
                            except OSError as copy_err:
                                # 如果複製過程中發生錯誤 (例如權限問題、磁碟空間不足)
                                print(f"      ❌ 複製錯誤 {log_filename}: {copy_err}")
                except OSError as mkdir_err:
                     # 如果建立目標目錄時發生錯誤
                     print(f"  ❌ 無法建立目標目錄 {target_dest_dir}: {mkdir_err}")
            else:
                # 如果根據原始路徑無法判斷是 debug 還是 custom
                 print(f"  警告: 無法根據原始基礎目錄決定 {os.path.basename(benchmark_dir)} 的目標分類目錄: {original_base_dir}")
        # else:
            # 如果不需要顯示找不到 logs 目錄的訊息，可以註解掉下面這行
            # print(f"  在 {os.path.basename(benchmark_dir)} 中找不到 'logs' 目錄。")

    print("\nLog 檔案收集與分類完成。")
    print("---")


# --- 主要執行邏輯 ---

print("開始執行 Benchmark 腳本...")

# tasks_to_run 現在會儲存 (benchmark_dir, prefix, original_base_dir)
tasks_to_run = []

print("正在收集需要執行的 Benchmark 任務...")
# 收集任務
for base_dir in base_dirs:
    # print(f"\n正在檢查基礎目錄: {base_dir}") # 減少輸出

    if not os.path.isdir(base_dir):
        print(f"警告：基礎目錄不存在，跳過: {base_dir}")
        continue

    try:
        for item_name in os.listdir(base_dir):
            item_path = os.path.join(base_dir, item_name)
            if os.path.isdir(item_path):
                for prefix in benchmark_num_strs:
                    if item_name.startswith(prefix):
                        # 加入原始 base_dir 資訊，方便後續分類
                        tasks_to_run.append((item_path, prefix, base_dir))
                        break
    except OSError as e:
        print(f"錯誤：無法讀取目錄 {base_dir} 的內容: {e}")


# --- 使用 ThreadPoolExecutor 執行任務 ---

print(f"\n共找到 {len(tasks_to_run)} 個 Benchmark 任務，將使用最多 {MAX_THREADS} 個執行緒同時執行。")
print("按下 Ctrl+C 可以嘗試中斷執行。")

executor = None # 將 executor 宣告在 try 外部
completed_normally = False # 標記是否正常完成

try:
    if tasks_to_run:
        with concurrent.futures.ThreadPoolExecutor(max_workers=MAX_THREADS) as executor:
            future_to_task = {executor.submit(run_single_benchmark, task[0], task[1]): task for task in tasks_to_run}

            print("\n開始執行 Benchmark...")
            # 使用 as_completed 來等待任務完成
            for future in concurrent.futures.as_completed(future_to_task):
                task_info = future_to_task[future]
                try:
                    future.result() # 檢查任務是否拋出例外
                except Exception as exc:
                     print(f'[Main] 處理任務 {task_info[1]} ({os.path.basename(task_info[0])}) 的結果時產生了一個未預期的例外: {exc}')
        # 如果 with 區塊正常結束，表示所有任務都跑完了
        print("\n所有提交的 Benchmark 任務已處理完成。")
        completed_normally = True # 標記為正常完成

    else:
        print("沒有找到任何可執行的 Benchmark 任務。")
        completed_normally = True # 沒有任務也算正常完成

except KeyboardInterrupt:
    print("\n\n偵測到 Ctrl+C！正在嘗試停止...")
    if executor:
        print("正在要求執行緒池停止...")
        if sys.version_info >= (3, 9):
             executor.shutdown(wait=False, cancel_futures=True)
        else:
             executor.shutdown(wait=False)
        print("執行緒池已收到關閉請求。注意：正在運行的 run.sh 可能會繼續執行。")
    # 即使被中斷，我們仍然可以嘗試收集已完成任務的 log

finally:
    # 無論是正常結束還是被 Ctrl+C 中斷，都嘗試執行 log 收集
    # 這樣即使腳本被中斷，也能收集到在它被中斷前已經完成的 benchmark 的 log
    if tasks_to_run: # 只有在有任務時才需要收集
        collect_and_classify_logs(tasks_to_run)

    # 根據是否正常完成來決定最終的退出訊息和狀態碼
    if completed_normally:
        print("\n腳本執行完畢。")
        sys.exit(0) # 正常退出
    else:
        print("\n腳本被中斷。")
        sys.exit(1) # 以非零狀態碼退出
    