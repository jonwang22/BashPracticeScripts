### You have been tasked with creating a basic calculator program that can perform addition, subtraction, multiplication, and division. The calculator will take two integer inputs from the user and then ask the user which operation they would like to perform. Based on the user's choice, the script will perform the corresponding operation and display the result.

### If you finish quickly, make sure to think of ways to optimize your script.  It’s one thing for things to go right, but what happens when things go wrong ;)


#!/bin/bash

# We need to prompt the user to enter 2 integers.
# We need to prompt the user to choose an operation: +,-,*,/
# Use conditionals (if, elif, else) to perform the chosen operation.
# Display the result of the operation.
# Handle division by zero with an appropriate error message.

echo "Hi! Welcome to the Bash Calculator! I'm here to help you with simple arithmetic!"

# Function to check if integer input is a valid integer
# Using regex here to check if our user input is a valid integer
# ^ starts our string
# -? optionally begins with a negative
# [0-9]+ followed by one or more digits
# $ ends at the end of our string
function is_integer() {
    [[ "$1" =~ ^-?[0-9]+$ ]]
}

# Function to read an integer input
function read_integer() {
    local prompt="$1"
    local var_name="$2"
    
    while true; do
        echo "$prompt"
        read input
        
        if is_integer "$input"; then
            eval "$var_name=$input"
            break
        else
            echo "Invalid input. Please enter a valid integer."
        fi
    done
}

# Creating my operation functions.
# Addition function taking the two integers and getting the sum.
function addition () {
	sum=$(($first_integer+$second_integer))
	echo "$first_integer + $second_integer = $sum"
}

# Subtraction function taking the two integers and getting the difference
function subtraction () {
	diff=$(($first_integer-$second_integer))
	echo "$first_integer - $second_integer = $diff"
}

# Multiplication function taking the two integers and getting the product
function multiplication () {
        product=$(($first_integer*$second_integer))
	echo "$first_integer * $second_integer = $product"
}

# Division function taking the two integers and getting the quotient
function division () {
	if [[ $second_integer -eq 0 ]];
	then
		echo "You can't divide by 0, please choose a different number."
	else
        	quotient=$(($first_integer/$second_integer))
        	echo "$first_integer / $second_integer = $quotient"
	fi
}


# Creating a while loop to let the user perform as many calculations as needed in a single execution of the script.
while true; do
	# Read an validate user's first integer
	read_integer "Please enter your first integer: " first_integer
	
	# Read and validate user's second integer
	read_integer "Please enter your second integer: " second_integer

	echo "Please enter the operation you'd like to execute. Select from the following operands (+,-,*,/) or type out the operation you want executed.:"
	read arith_operation

	# Setting my if statements to check for what operation the user wants to perform on the 2 integers. Each condition is checking for either the operand symbol or the known names of the arithmetic operation.
	# Once the if condition is evaluated, the dedicated fucntion tying to the operation will then be executed.
 	if [[ $arith_operation == "+" || $arith_operation == "add" || $arith_operation == "addition" ]];
	then 
		addition
	elif [[ $arith_operation == "-" || $arith_operation == "minus" ||$arith_operation == "subtract" || $arith_operation == "subtraction" ]];
	then
		subtraction
	elif [[ $arith_operation == "*" || $arith_operation == "multiply" || $arith_operation == "multiplication" ]];
	then
		multiplication
	elif [[ $arith_operation == "/" || $arith_operation == "divide" || $arith_operation == "division" ]];
	then
		division
	else 
		echo "Sorry I don't recognize that operation."
	fi

	# This allows the user to continue the script and perform consecutive calculations as needed until done.
	# We will force the user to make a correct input in order to continue or exit the script.
	while true; do
		echo "Do you want to perform another calculation? (yes/no)"
		read continue_calculation
	
		if [[ $continue_calculation == "yes" || $continue_calculation == "y" ]];
		then
			break
		elif [[ $continue_calculation == "no" || $continue_calculation == "n" ]];
		then
			echo "Have a great day! Goodbye!"
			exit 0
		else
			echo "Invalid input. Please enter 'yes', 'y', 'no', or 'n'."
		fi
	done
done
