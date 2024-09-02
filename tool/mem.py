import subprocess
import time
def get_pid(process_name):
    try:
        # 使用 pidof 命令获取进程 ID
        pid = subprocess.check_output(['pidof', process_name])
        return [int(p) for p in pid.decode().strip().split()]
    except subprocess.CalledProcessError:
        return []  # 如果没有找到进程，返回空列表
def get_memory_usage(pid):
    try:
        # 从 /proc/<pid>/status 文件读取内存使用信息
        with open(f'/proc/{pid}/status') as f:
            for line in f:
                if 'VmSize' in line:  # 获取虚拟内存大小
                    return line.strip()
    except FileNotFoundError:
        return None  # 如果进程不存在，返回 None
if __name__ == "__main__":
    process_name = "mach_decoder_intel"  # 
    pids = get_pid(process_name)
    
    if not pids:
        print(f"No process found with name '{process_name}'.")
    else:
        print(f"Monitoring memory usage for PID(s): {pids}")
        try:
            while True:
                for pid in pids:
                    mem_usage = get_memory_usage(pid)
                    if mem_usage:
                        print(f"PID: {pid}, Memory Usage: {mem_usage}")
                    else:
                        print(f"PID: {pid} no longer exists.")
                time.sleep(1)  # 每秒输出一次
        except KeyboardInterrupt:
            print("Monitoring stopped.")
