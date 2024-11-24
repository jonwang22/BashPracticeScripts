#!/bin/bash

# Script that checks current directory and prints out how many items are found in the current directory

# Need to get contents of current directory

# provide a count somehow of items in directory. 

contents=$(ls | wc -l)
echo "You have ${contents} items in your current directory"