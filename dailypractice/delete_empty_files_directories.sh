# Write a script that looks for empty files and directories and deletes them. The user should be given the names and locations of these files and directories and approve of their deletion beforehand. 

# Output Example: 

# $ ./delete_empty.sh Empty files and directories found: 1. Empty file: /path/to/empty_file.txt 2. Empty directory: /path/to/empty_directory Do you want to delete these files and directories? (yes/no): yes Deleting... File '/path/to/empty_file.txt' has been deleted. Directory '/path/to/empty_directory' has been deleted.
# $ ./delete_empty.sh Empty files and directories found: 1. Empty file: /path/to/empty_file.txt 2. Empty directory: /path/to/empty_directory Do you want to delete these files and directories? (yes/no): no No files or directories were deleted.
# $ ./delete_empty.sh No empty files or directories found.