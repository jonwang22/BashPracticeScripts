#!/bin/bash

# This script is going to work with nested loops.

# We are going to take all the files that are in our $HOME directory and put them into a backup file. I also want to make sure that all the files are normal/regular files

# Let's move files from a specific directory and move them into a backup file. Take this put it there.

# Declare where and what we want to backup.
# Make sure our backup directory exists.
# Grab all the files in the $HOME directory and put them into the backup directory.
# Check if it's a regular file, and say "Copying $filename"
# If it is not then we can write, "Skipping $filename"

source_directory="/home/ubuntu"
destination_directory="/home/ubuntu/backup"


mkdir -p "$destination_directory"

for file in "$source_directory"/*;
do
	if [[ -f "$file" ]];
	then
		cp $file $destination_directory
		echo "$file has been copied."
	else
		echo "$file is not a file. Skipping $file"
	fi
done
	

