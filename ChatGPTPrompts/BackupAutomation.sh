#!/bin/bash

# Backup Automation: Create a script that backs up a specific directory, compresses the backup, and appends the current date to the backup file's name.

# Ask for directory
# Test directory

directory=/home/ubuntu/test-backup
# read -p "What directory do you want to backup? " directory

# Need to create something that checks if directory before proceeding

# Backup means copy, copy directory
#echo $directory $directory.bkp

# cp $directory $directory.bkp


# compress copy, maybe tar?
tar -czvf $directory.tar $directory

# rename .tar or .zip folder with mv

