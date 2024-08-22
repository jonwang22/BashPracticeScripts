#!/bin/bash

# This is a text based game that handles user input and creates an interactive story for the user.

# Introduction
function introduction () {
    echo "**************************************"
    echo "|                                    |"
    echo "|         The Golden Jewel           |"
    echo "|                                    |"
    echo "**************************************"
    buffer
    speaker "Stranger" "Hello adventurer! Welcome to the world of Texterria!"
    echo "You will be embarking on a simple quest to obtain the coveted Golden Jewel!"
    read -p "The King awaits adventurer! Before we go, what is your name? " player
    buffer
    speaker "Stranger"
    echo "Pleasure to meet you $player! "
    echo "My name is Docsilius and I will accompany you on this quest."
    buffer
    speaker "Docsilius"
    echo "Where would you like to go first, $player?"
}

# Simple functions for me to use for formatting/displaying the text
function buffer () {
    echo -e "\n\n"
}

function pause () {
    echo
    sleep 2
}

function speaker () {
    echo "  $1:   "
    echo "---------------------" 
    echo "$2"
}

# First Choice
function first_choice () {
    buffer
    echo "1) Castle to go speak to the King"
    echo "2) Village Tavern to hear gossip about the Jewel"
    echo "3) Nope, Nope, Nope. I'm out. (Run away)"
    read -p "Select where you want to go: " first_choice
    buffer

    case $first_choice in
        1) 
            castle
            ;;
        2)
            tavern
            ;;
        3)  
            run_away
            ;;
        *)
            echo "I don't know where that is....Please pick a place I know."
            buffer
            
            first_choice
            ;;
    esac
}

function run_away () {
    echo "You decide to run away. You don't want any part of this world."
    echo "You tell yourself this is not how you want to live your life."
    echo "Within seconds, you feel this gut urge to turn around and walk out."
    echo "."
    sleep 1
    echo ".."
    sleep 1
    echo "..."
    sleep 1
    echo "...."
    sleep 3
    echo "You start screaming and running for the hills."
    echo "You get a good distance away and you feel freedom, then all of a sudden...."
    echo "*BAM* *WHACK* *PHWAPOOM*"
    echo "You trip on a tree root sticking out of the ground, you fall and hit your head on a rock."
    echo "You perish....for running from your destiny."
    echo ".....GAME OVER....."
}

# Castle Scenario
function castle#!/bin/bash

# This is a text based game that handles user input and creates an interactive story for the user.

# Introduction
function introduction () {
    echo "**************************************"
    echo "|                                    |"
    echo "|         The Golden Jewel           |"
    echo "|                                    |"
    echo "**************************************"
    buffer
    speaker "Stranger" "Hello adventurer! Welcome to the world of Texterria!"
    echo "You will be embarking on a simple quest to obtain the coveted Golden Jewel!"
    read -p "The King awaits adventurer! Before we go, what is your name? " player
    buffer
    speaker "Stranger"
    echo "Pleasure to meet you $player! "
    echo "My name is Docsilius and I will accompany you on this quest."
    buffer
    speaker "Docsilius"
    echo "Where would you like to go first, $player?"
}

# Simple functions for me to use for formatting/displaying the text
function buffer () {
    echo -e "\n\n"
}

function pause () {
    echo
    sleep 2
}

function speaker () {
    echo "  $1:   "
    echo "---------------------" 
    echo "$2"
}

# First Choice
function first_choice () {
    buffer
    echo "1) Castle to go speak to the King"
    echo "2) Village Tavern to hear gossip about the Jewel"
    echo "3) Nope, Nope, Nope. I'm out. (Run away)"
    read -p "Select where you want to go: " first_choice
    buffer

    case $first_choice in
        1) 
            castle
            ;;
        2)
            tavern
            ;;
        3)  
            run_away
            ;;
        *)
            echo "I don't know where that is....Please pick a place I know."
            buffer
            
            first_choice
            ;;
    esac
}

function run_away () {
    echo "You decide to run away. You don't want any part of this world."
    echo "You tell yourself this is not how you want to live your life."
    echo "Within seconds, you feel this gut urge to turn around and walk out."
    echo "."
    sleep 1
    echo ".."
    sleep 1
    echo "..."
    sleep 1
    echo "...."
    sleep 3
    echo "You start screaming and running for the hills."
    echo "You get a good distance away and you feel freedom, then all of a sudden...."
    echo "*BAM* *WHACK* *PHWAPOOM*"
    echo "You trip on a tree root sticking out of the ground, you fall and hit your head on a rock."
    echo "You perish....for running from your destiny."
    echo ".....GAME OVER....."
}

# Castle Scenario
function castle () {
    speaker "Docsilius"
    echo "Okay, let's go to the castle and see the King!"
    echo "Hopefully the King can give us clues on the Golden Jewel."
    echo "Let us make haste. Onward!"
    pause
    echo "****   Docsilius and $player begin their journey to the castle"
    pause
    echo "****   A few hours later........   ****"
    pause
    speaker "Docsilius"
    echo "$player! We have arrived at the castle gates! Let's go see the king!"
    pause
    echo "****   $player and Docsilius arrive at King's Hall."
    echo "****   The King is sitting on the throne in his majestic robe." 
    echo "****   In his right hand, he holds the Royal Greatsword in his right hand."
    pause
    echo "****   The King greets $player and Docsilius"
    buffer
    speaker "King Mont"
    echo "Welcome to my Kingdom! I am King Mont."
    echo "You must be the rumored adventurer here to help find the Golden Jewel for me." 
}

# Main game time

introduction
first_choice

 () {
    speaker "Docsilius"
    echo "Okay, let's go to the castle and see the King!"
    echo "Hopefully the King can give us clues on the Golden Jewel."
    echo "Let us make haste. Onward!"
    pause
    echo "****   Docsilius and $player begin their journey to the castle"
    pause
    echo "****   A few hours later........   ****"
    pause
    speaker "Docsilius"
    echo "$player! We have arrived at the castle gates! Let's go see the king!"
    pause
    echo "****   $player and Docsilius arrive at King's Hall."
    echo "****   The King is sitting on the throne in his majestic robe." 
    echo "****   In his right hand, he holds the Royal Greatsword in his right hand."
    pause
    echo "****   The King greets $player and Docsilius"
    buffer
    speaker "King Mont"
    echo "Welcome to my Kingdom! I am King Mont."
    echo "You must be the rumored adventurer here to help find the Golden Jewel for me." 
}

# Main game time

introduction
first_choice

