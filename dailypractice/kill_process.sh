# Write a script that lists all running processes and allows the user to kill a process by entering its PID.

# $ ./kill_process.sh
# Listing all running processes:
# PID COMMAND
# 1234 nginx 
# 5678 apache2 
# 91011 bash 
# 121314 python3 
# Enter the PID of the process you want to kill: 1234 
# Killing process with PID 1234... 
# Process 1234 (nginx) has been successfully killed.
# $ ./kill_process.sh
# Listing all running processes:
# PID COMMAND
# 1234 nginx
# 5678 apache2
# 91011 bash
# 121314 python3
# Enter the PID of the process you want to kill: 9999
# Error: No process with PID 9999 found. Please try again.

#!/bin/bash

echo "Listing all running processes: "
ps -ro pid,comm

read -p "Enter the PID of the process you want to kill: " process
echo "Killing process with PID $process...."
if kill "$process" 2>dev/null; then
    echo "Process $process has been successfully killed."
else
    echo "Error: No process with PID $process found. Please try again."