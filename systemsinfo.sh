#!/bin/bash

# I want to create a user-friendly script that can be ran from the terminal shell to allow users to easily obtain system information

# I want to prompt the user into selecting an option from a menu provided when they run this script.
# The options are:
# 1. IP Addresses - Output ex: "Your private IP is $PRIV_IP_ADDRESS, and your public IP is $PUB_IP_ADDRESS."
# 2. Current User - Output ex: "You are $USER."
# 3. CPU Information - Output ex: "The system has 1 CPU."
# 4. Memory Information - Output ex: "There is $UNUSED_MEM_VALUE Mebibyte unused memory of total $MEM_TOTAL Mebibyte."
# 5. Top 5 Memory Processes - Can be a table produced by command
# 6. Top 5 CPU Processes - Same as memory
# 7. Network Connectivity - Ask the user for a website or IP address to connect to first then produce a statement regarding the network connection. Output ex: "It took 7ms to connect to www.google.com and there was 0% data packet loss"

##################################################################################################################

# Before we have any executions, we will create our functions here for each of the different options.

# Creating menu select function
function display_menu () {
        echo "##################################################################"
        echo "|                                                                |"
        echo "|Hi there, please select what you'd like to check on your system.|"
        echo "|                                                                |"
        echo "##################################################################"
        echo "Systems Info Menu:"
        echo ""
        echo "1) IP Addresses"
        echo "2) Current User"
        echo "3) CPU Information"
        echo "4) Memory Information"
        echo "5) Top 5 Memory Processes"
        echo "6) Top 5 CPU Processes"
        echo "7) Network Connectivity"
        echo "8) EXIT"
        read selection
        echo ""
}

# Creating menu select case function that runs the designated function when valid option is selected.
function menu_selection () {
	case $selection in
                1)
                        check_ip;;
                2)
                        check_user;;
                3)
                        cpu_info;;
                4)
                        mem_info;;
                5)
                        top_mem_processes;;
                6)
                        top_cpu_processes;;
                7)
                        network_connect;;
                8 | "EXIT" | "Exit" | "exit" | "e" | "QUIT" | "Quit" | "quit" | "q")
                        echo ""
			echo "Have a great day! Goodbye!"
			echo ""
                        exit 0;;
                *)
                        echo "Sorry, I don't know that action, please select an option from the menu provided."
			echo ""
                        return 1
        esac
	return 0
}

# Creating function for checking with user if they want to continue checking their system
function system_recheck () {
	while true; do
                echo "Do you want to check another system resource? (yes/no)"
                read check_again

                case $check_again in
                        YES|Yes|yes|y)
                                echo ""
                                break;;
                        NO|No|no|n)
                                echo ""
                                echo "Have a great day! Goodbye!"
                                echo ""
                                exit 0;;
                        *)
                                echo "Invalid input. Please enter yes/y or no/n."
                                echo ""
                                ;;
                esac
        done
}

# Checking IP, grabbing Private and Public IP and storing them into variables. ifconfig command will give us the private IP, for public IP we will need to query an external dns. There's multiple ways to grab public IP. 
function check_ip () {
	private_ip=$(ifconfig | grep inet | head -1 | awk '{print $2}')
	public_ip=$(curl ifconfig.me 2>/dev/null) # Without the 2>/dev/null, we would see the stderr output when the script executes. We don't want that so we're redirecting that output into /dev/null. We can also use $(dig +short myip.opendns.com @resolver1.opendns.com) here.
	echo "Your private IP is $private_ip, and your public IP is $public_ip."
}

# For the current user, we could echo the $USER variable for the user.
function check_user () {
	echo "You are $USER."
}

# For CPU we're going to check the information found in /proc/cpuinfo. Searching for cores and awking the output to grab the number of CPU cores the system has.
function cpu_info () {
	cpu_core=$(cat /proc/cpuinfo | grep cores | awk '{print $4}') #This lets us find how many cpu cores are in our system.
	echo "The system has $cpu_core CPU(s)."
}

# For Memory information, we run a command that outputs our current memory statistics such as "free" or we could make it harder and more precise by diving into /proc/memstat. We'll need find and assign the unused memory and the total memory to variables and then output that in an echo statement.
function mem_info () {
	mem_unused=$(free -m | grep Mem | awk '{print $4}')
	mem_total=$(free -m | grep Mem | awk '{print $2}')
	echo "There is $mem_unused Mebibytes of unused memory of out of the total $mem_total Mebibytes of memory on your system."
}

# For top 5 memory processes, we'll use ps with -eo flags. 'e' checks every process, 'o' allows for formatting.
# Here we're formatting our output to show process memory used, process id, and the command that resource is tied to.
# We sort it through via pmem, then we sort the output to get the processes in descending order and we take the top 5 processes. We use head -6 to account for the header in the output.
function top_mem_processes () {
	echo "Here are the top 5 processes using memory right now."
	echo ""
	ps -eo pmem,pid,cmd --sort pmem | sort -r | head -6
}

# For top 5 cpu processes, we'll use ps with -eo flags. Same as Memory above.
# Here we're formatting our output to show process cpu used, process id, and the command that resource is tied to.
# We sort it through via pcpu, then we sort the output to get the processes in descending order and we take the top 5 processes. We use head -6 to account for the header in the output.
function top_cpu_processes () {
	echo "Here are the top 5 processes with the most CPU Utilization right now."
	echo " "
	ps -eo pcpu,pid,cmd --sort pcpu | sort -r | head -6
}

# For network connectivity, it's a bit more involved. We'll need to validate the user input is a valid website url or ip address.
# We have a function validating that user input and then we have a function performing the logical check on the input to make sure we have connection.
function validate_website () {
	local input=$1
	
	# Regex for IP Address and Domain address
	# IP Octet regex is specifying the specific range that is possible for the octet. Min is 0 and max is 255.
	# IP regex takes the IP Octet pattern and replicates that as the pattern we're looking for in the user input to validate if its a valid IP or not.
	local ip_octet="([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])"
	local ip_regex="^$ip_octet\.$ip_octet\.$ip_octet\.$ip_octet$"
	local domain_regex="^([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$"
	# Check if input is a valid IP address or website
	if [[ $input =~ $ip_regex ]]; then
		# Check if IP is pingable
		if ping -c 1 -W 1 $input &> /dev/null; then
			echo "Valid IP address and reachable."
			return 0
		else
			echo "IP address is unreachable."
			return 1
		fi
	elif [[ $input =~ $domain_regex ]]; then
		# Check if domain is valid
		if nslookup $input &> /dev/null; then
			echo "Valid domain name and is resolveable."
			return 0
		else
			echo "Invalid domain name. Unable to resolve."
			return 1
		fi
	else 
		echo "Invalid input. Please enter a valid IP address or valid domain URL."
		return 1
	fi
}

# Here is where our logic happens after we've validated the user input.
function network_connect () {
	read -p "Enter a website or IP address: " website
	echo "Checking validity of website or IP address....."
	echo ""
	if validate_website $website; then
		echo ""
		echo "Proceeding with network connectivity check..."
		echo ""
		ping_output=$(ping $website -c 10) # Pinging website to check what our RoundTrip Time looks like
        	packet_loss=$(echo "$ping_output" | grep -i "packet loss" | awk -F "," '{gsub(/^ */, "", $3); print $3}') # We then grep for packet loss line to isolate that value into a variable for our echo output for the user. gsub is being used to remove the leading whitespace after awk.
        	time=$(echo "$ping_output" | tail -1 | awk -F "/" '{print $5}') # Here we're grabbing the average time metric for each ping found within the RTT stat
        	echo "It took $time ms to connect to '$website' and there was $packet_loss."
	else
		echo ""
		echo "Invalid input. Exiting network connectivity check."
	fi
}


# Main Script Loop
while true; do
	display_menu
	if ! menu_selection; then
		continue
	fi
	echo ""
	system_recheck
done
