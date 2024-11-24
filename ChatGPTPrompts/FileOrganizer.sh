#!/bin/bash

# File Organizer: Write a script that organizes files in a directory into subfolders based on file extensions
# (e.g., .txt files go into a "Text" folder, .jpg files go into an "Images" folder, etc.).

# grab contents of directory
read -p "What directory do you want to look at? " directory
echo $directory
# put contents into an array to iterate through?
contents=()
for item in $(ls -l $directory | tail -n +2 | awk '{print $9}'); do
    contents+="$item"
done
# while IFS= read -r line; do
#     contents+=("$line")
# done < <(ls $directory)

echo $contents

# for loop to iterate through list
for item in "${contents[@]}"; do
    echo "File found: $item"

    # if [[ "$item" == *.txt ]]; then
    #     echo "Found $item"
    # else
    #     echo "Not found"
    # fi
done
# conditional check for each individual file extension
# if condition true, move file to folder