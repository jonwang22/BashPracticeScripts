#!/bin/bash

# This script will check if a file is readable, writeable, and executable.

echo "Hi there, I can check your file permissions for you"
echo "What file would you like to check? Please enter the absolute filepath: "
read absolute_path_file

if [[ -f "$absolute_path_file" ]]; then
	echo "File exists"
	ls -al $absolute_path_file
else
	echo "File does not exist. Please try again."
fi
