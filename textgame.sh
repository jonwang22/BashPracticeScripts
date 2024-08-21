#!/bin/bash

# This is a text based game that handles user input and creates an interactive story for the user.

# Introduction
function introduction () {
	echo "**************************************"
	echo "|                                    |"
	echo "|         The Golden Jewel           |"
	echo "|                                    |"
	echo "**************************************"
	echo
	echo "---Stranger---"
	echo "Hello adventurer! Welcome to the world of Texterria!"
	echo "You will be embarking on a simple quest to obtain the coveted Golden Jewel!"
	read -p "The King awaits adventurer! Before we go, what is your name? " player
	echo
	echo
	echo "Stranger: Pleasure to meet you $player! "
	echo "Docsilius: My name is Docsilius and I will accompany you on this quest."
	echo "Docsilius: Where would you like to go first?"
}

# First Choice
function first_choice () {
	echo
	echo "1) Castle to go speak to the King"
	echo "2) Village Tavern to hear gossip about the Jewel"
	read -p "Select where you want to go [1-2]: " first_choice
	echo
	echo

	case $first_choice in
		1) 
			castle
			;;
		2)
			tavern
			;;
		*)
			echo "I don't know where that is....Please pick a place I know."
			echo ""
			echo ""
			
			first_choice
			;;
	esac
}

# Castle Scenario
function castle () {
	echo "Okay, let's go to the castle and see the King. Hopefully the King has some insight into where this Golden Jewel is or at least was rumored to be! Onward!"
	echo ""
	sleep 1
	echo "****   Docsilius and $player begin their journey to the castle   ****"
	echo ""
	sleep 2
	echo "****   A few hours later........   ****"
	echo "" 
	sleep 3
	echo ""
	echo "$player! We have arrived at the castle gates! Let's go see the king!"
	echo ""
	sleep 1
	echo "($player and Docsilius arrive at King's Hall. The King is sitting on the throne in his majestic robe and royal greatsword in his right hand.)"
	echo ""
	sleep 1
	echo "(The King greets $player) Welcome to my Kingdom! You must be the rumored adventurer here to help find the Golden Jewel for me." 
}

# Main game time

introduction
first_choice
