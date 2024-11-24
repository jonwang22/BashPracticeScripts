# Write a script to read a list of usernames from a file, if a given user exists on the system, print their home directory and shell. If the user does not exist, create them and print their home directory and shell. (Include the file of usernames in your repository).

# Output Example:

# $ ./manage_users.sh usernames.txt
# Reading usernames from 'usernames.txt'...
# Checking user 'alice'...
# User 'alice' exists.
# Home directory: /home/alice
# Shell: /bin/bash
# Checking user 'carol'...
# User 'carol' does not exist.
# Creating user 'carol'...
# User 'carol' created.
# Home directory: /home/carol
# Shell: /bin/bash