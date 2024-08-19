#!/bin/bash

# Write a script directory_monitor.sh that:
# Asks the user for a directory they'd like to monitor and takes the name as an argument.
# Calculates the total size of the directory. Hint: du command
# Displays a message saying "Warning: Directory exceeds 100MB" if the size is greater than 100MB.
# Extra: Compress the directory (with zip)

# Take user input on directory that they want to monitor.
echo "$1"

du -ms $1 | awk '{print $1}'
