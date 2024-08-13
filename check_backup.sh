#!/bin/bash

# Checking if a directory named "backup" exists in the current directory.
# If it doesn't exist, then create it.

DIR="backup"

if [[ -d "$DIR" ]]; then
      echo "Directory $DIR exists in the current directory."
else
      echo "$DIR does not exist. Creating 'backup' directory in current directory."
      mkdir backup
fi      
