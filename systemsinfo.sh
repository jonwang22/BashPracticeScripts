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

# Before we have any executions, we will create our functions here for each of the different options.

function check_ip () {
	
}

function check_user () {
	
}

function cpu_info () {

}

function mem_info () {

}

function top_mem_processes () {

}

function top_cpu_processes () {

}

function network_connect () {
	
}


# First we need a prompt that displays the menu of selections.

echo ""
echo ""
echo "Hi there, please select what you'd like to check on your system."
echo ""
echo "Systems Info Menu:"
echo ""
echo "1) IP Addresses"
echo "2) Current User"
echo "3) CPU Information"
echo "4) Memory Information"
echo "5) Top 5 Memory Processes"
echo "6) Top 5 CPU Processes"
echo "7) Network Connectivity"
echo ""
echo ""
read selection

# Once we have our prompt, we'll need to build a function that handles the user input. We will most like use a case statement here to handle all the different options



# For the IP Address, we will need an echo statement and two variables. These two variables for Private and Public IP Addresses. There should be a command we can run that will give this to us and we will then need to isolate that output and assign it to the variables for the output for the user.

# For the current user, we could echo the $USER variable for the user.

# For the CPU Information, there should be a command that displays how many CPUs the system has, based on that output we'll have to use a combination of grep and awk to isolate the information we want to then echo into a sentence to display to the user.

# For Memory information, we run a command that outputs our current memory statistics such as "free" or we could make it harder and more precise by diving into /proc/memstat. We'll need find and assign the unused memory and the total memory to variables and then output that in an echo statement.

# For top 5 memory, we'll need to figure out the ps aux options to use to create a table output of processes sorted by memory usage. pmem, pid, cmd. There should be a formatting solution with in the ps command with the different options. We'll pair that with head to grab the top 5.

# For top 5 cpu, we'll need to do the same as memory but sort it based on CPU usage so our columns displayed will change from pmem to pcpu most likely or some equivalent showing the cpu usage. We'll use sort and head here for top 5.

# For Network Connectivity, we grab user input for website or IP address and assign it to a variable. use that variable in ping command, grab the output which should be the last line of the ping output and just output that. Not sure if we need to use redirection or not. Will need to refamiliarize myself with the output format.
