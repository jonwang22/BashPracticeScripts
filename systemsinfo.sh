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

# For the IP Address, we will need an echo statement and two variables. These two variables for Private and Public IP Addresses. There should be a command we can run that will give this to us and we will then need to isolate that output and assign it to the variables for the output for the user.
function check_ip () {
	private_ip=$(ifconfig | grep inet | head -1 | awk '{print $2}')
	public_ip=$(curl ifconfig.me 2>/dev/null) # Without the 2>/dev/null, we would see the stderr output when the script executes. We don't want that so we're redirecting that output into /dev/null. We can also use $(dig +short myip.opendns.com @resolver1.opendns.com) here.
	echo "Your private IP is $private_ip, and your public IP is $public_ip."
}

# For the current user, we could echo the $USER variable for the user.
function check_user () {
	echo "You are $USER."
}

# For the CPU Information, there should be a command that displays how many CPUs the system has, based on that output we'll have to use a combination of grep and awk to isolate the information we want to then echo into a sentence to display to the user.
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

# For top 5 memory, we'll need to figure out the ps aux options to use to create a table output of processes sorted by memory usage. pmem, pid, cmd. There should be a formatting solution with in the ps command with the different options. We'll pair that with head to grab the top 5.
function top_mem_processes () {
	echo "Here are the top 5 processes using memory right now."
	echo ""
	ps -eo pmem,pid,cmd --sort pmem | sort -r | head -6
}

# For top 5 cpu, we'll need to do the same as memory but sort it based on CPU usage so our columns displayed will change from pmem to pcpu most likely or some equivalent showing the cpu usage. We'll use sort and head here for top 5.
function top_cpu_processes () {
	echo "Here are the top 5 processes with the most CPU Utilization right now."
	echo " "
	ps -eo pcpu,pid,cmd --sort pcpu | sort -r | head -6
}

# For Network Connectivity, we grab user input for website or IP address and assign it to a variable. use that variable in ping command, grab the output which should be the last line of the ping output and just output that. Not sure if we need to use redirection or not. Will need to refamiliarize myself with the output format.
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

function network_connect () {
	read -p "Enter a website or IP address: " website
	echo "Checking validity of website or IP address....."
	echo ""
	if validate_website $website; then
		echo ""
		echo "Proceeding with network connectivity check..."
		echo ""
		ping_output=$(ping $website -c 10)
        	packet_loss=$(echo "$ping_output" | grep -i "packet loss" | awk -F "," '{gsub(/^ */, "", $3); print $3}')
        	time=$(echo "$ping_output" | tail -1 | awk -F "/" '{print $5}')
        	echo "It took $time ms to connect to '$website' and there was $packet_loss."
	else
		echo ""
		echo "Invalid input. Exiting network connectivity check."
	fi
}


# First we need a prompt that displays the menu of selections.
while true; do
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

# Once we have our prompt, we'll need to build a function that handles the user input. We will most like use a case statement here to handle all the different options
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
			echo "Have a great day! Goodbye!"
			exit 0;;
		*)
			echo "Sorry, I don't know that action, please select an option from the menu provided."
			continue
	esac
	echo ""
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
done
