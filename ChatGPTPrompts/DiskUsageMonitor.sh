#!/bin/bash

# Disk Usage Monitor: Write a script that checks the disk usage on a system and sends a warning if usage exceeds 80%. 
# Include both the current usage percentage and the total space available.

# Set threshold
THRESHOLD=80

# get usage
disk_usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')
available_space=$(df -h / | grep -v Filesystem | awk '{print $4}')
echo $disk_usage
echo $available_space

# if disk use over threshold, echo warning and total space available, else echo disk use and available space
if [[ "$disk_usage" -gt "$THRESHOLD" ]]; then
    echo "Warning: Disk use is at ${disk_usage}"
    echo "Total space available: ${available_space}"
else
    echo "Disk usage is at ${disk_usage}, which is below the threshold of ${THRESHOLD}."
    echo "Total space available: ${available_space}"
fi
