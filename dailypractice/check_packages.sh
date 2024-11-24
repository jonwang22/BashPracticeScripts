# Write a script that loops through a list of software packages (systemd, htop, git, python3, curl, nmap, apt) and checks their current version on the system. If a package is not installed, ask to install the package. Otherwise, print the installed version.

# Output Example: 

# $ ./check_packages.sh
# Checking the version of 'systemd'...
# systemd is installed.
# Version: 245.4-4ubuntu3.11
# Checking the version of 'htop'...
# htop is not installed. Would you like to install 'htop'? (yes/no): yes
# Installing 'htop'...
# htop has been installed.
# Version: 2.2.0-2build1
# Checking the version of 'git'...
# git is installed.
# Version: 2.25.1
# Checking the version of 'python3'...
# python3 is installed.
# Version: 3.8.10
# Checking the version of 'curl'...
# curl is installed.
# Version: 7.68.0
# Checking the version of 'nmap'...
# nmap is not installed.
# Would you like to install 'nmap'? (yes/no): no
# Skipping installation of 'nmap'.
# Checking the version of 'apt'...
# apt is installed.
# Version: 2.0.6