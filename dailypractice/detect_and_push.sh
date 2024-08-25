#!/bin/bash

# Write a script that will detect new files made in a specific directory, and push the changes to the repository in GitHub.
# If the repository doesn't exist in GitHub, ask the user if they'd like to create one and then push to GitHub.

# Output Example:
# $ ./detect_and_push.sh /path/to/directory 
# New files detected: new_file.txt Pushing changes to the existing GitHub repository...
# Changes have been successfully pushed to GitHub.

# $ ./detect_and_push.sh /path/to/directory 
# New files detected: new_file.txt GitHub repository does not exist.
# Would you like to create a new repository on GitHub? (yes/no): yes 
# Creating a new GitHub repository... Repository created successfully.
# Pushing changes to the new GitHub repository... Changes have been successfully pushed to GitHub.

# $ ./detect_and_push.sh /path/to/directory No new files detected in /path/to/directory. No changes to push.

# The first function we need for this script to perform is identifying new files in a given directory by the user passed as an argument.
# I know I need to use git status to check if there are unstaged files, but it doesn't necessarily mean those files will be new files.
# It just shows you the files that have new changes or they are new files.
function detect_new_file () {
    
}


# Output of Git Status for future use on detecting new files.
# ubuntu@ip-172-31-55-92:~/python-practice-exercises/python_work$ git status
# On branch main
# Your branch is up to date with 'origin/main'.

# Changes to be committed:
#   (use "git restore --staged <file>..." to unstage)
#         modified:   blacklisted_ips.py

# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#         date.py

# ubuntu@ip-172-31-55-92:~/python-practice-exercises/python_work$ git status
# On branch main
# Your branch is up to date with 'origin/main'.

# Changes to be committed:
#   (use "git restore --staged <file>..." to unstage)
#         modified:   blacklisted_ips.py
#         new file:   date.py