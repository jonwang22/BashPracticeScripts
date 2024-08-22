#!/bin/bash

# This is a text-based game that handles user input and creates an interactive story for the user.

# Introduction
function introduction () {
    echo -e "**************************************\n|                                    |\n|         The Golden Jewel           |\n|                                    |\n**************************************"
    buffer
    speaker "Stranger" "Hello adventurer! Welcome to the world of Texterria!"
    echo -e "You will be embarking on a simple quest to obtain the coveted Golden Jewel!"
    read -p "The King awaits adventurer! Before we go, what is your name? " player
    buffer
    speaker "Stranger"
    echo -e "Pleasure to meet you $player!\nMy name is Docsilius and I will accompany you on this quest."
    buffer
    speaker "Docsilius"
    echo -e "Where would you like to go first, $player?"
    first_choice
}

# Simple functions for formatting/displaying the text
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

# Choices will be listed under here.
# First Choice
function first_choice () {
    buffer
    echo -e "1) Castle to go speak to the King\n2) Village Tavern to hear gossip about the Jewel\n3) Nope, Nope, Nope. I'm out. (Run away)"
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
            echo -e "I don't know where that is....Please pick a place I know."
            buffer
            first_choice
            ;;
    esac
}

function castle_choice () {
    buffer
    echo -e "1) Head to the mountains, we'll figure it out from there.\n2) Learn more about the Jewel at the Tavern\n3) Nope, Nope, Nope. I'm out. (Run away)"
    read -p "Select where you want to go: " castle_choice
    buffer
    case $castle_choice in
        1) 
            mountain
            ;;
        2)
            tavern
            ;;
        3)  
            run_away
            ;;
        *)
            echo -e "I don't know where that is....Please pick a place I know."
            buffer
            castle_choice
            ;;
    esac
}

function tavern_choice () {
    buffer
    echo -e "1) Go to castle and confront King Mont \n2) Go to the mountains\n3) Nope, Nope, Nope. I'm out. (Run away)"
    read -p "Select where you want to go: " tavern_choice
    buffer
    case $tavern_choice in
        1) 
            confront
            ;;
        2)
            mountain
            ;;
        3)  
            run_away
            ;;
        *)
            echo -e "I don't know where that is....Please pick a place I know."
            buffer
            tavern_choice
            ;;
    esac

}

# All the different destination options will be under here for option selects in menu.
function castle () {
    speaker "Docsilius"
    echo -e "Okay, let's go to the castle and see the King!\nHopefully the King can give us clues on the Golden Jewel.\nLet us make haste. Onward!"
    pause
    echo -e "****   Docsilius and $player begin their journey to the castle"
    pause
    echo -e "****   A few hours later........   ****"
    pause
    speaker "Docsilius"
    echo -e "$player! We have arrived at the castle gates! Let's go see the king!"
    pause
    echo -e "****   $player and Docsilius arrive at King's Hall.\n****   The King is sitting on the throne in his majestic robe.\n****   In his right hand, he holds the Royal Greatsword in his right hand."
    pause
    echo -e "****   The King greets $player and Docsilius"
    buffer
    speaker "King Mont"
    echo -e "Welcome to my Kingdom! I am King Mont.\nYou must be the rumored adventurer here to help find the Golden Jewel for me.\nHead to the mountains, you will find a cave.\nFind the Jewel there."
    buffer
    speaker "Docsilius"
    echo -e "Well looks like we need to go to the mountains, $player.\nWe could also check the tavern and see if there are more details we can learn.\nWhat do you want to do?"
    castle_choice
}

function tavern () {
    echo -e "****   You head to the tavern. Hoping to hear any gossip surrounding the jewel.\n****   You sit down at the bar and order a drink."
    buffer
    speaker "Barkeep"
    echo -e "Welcome outsider. What can I do for you today? Drink? Food? You name it, I got it."
    buffer
    echo -e "****   You ask the barkeep about the Golden Jewel."
    pause
    speaker "Barkeep"
    echo -e "HA! You're a fool for looking for that. My sources say its in the King's Chest but it's not confirmed.\nKing Mont will tell you that it's in the mountains somewhere.\nSearch at your own risk. You may lose your life."
    tavern_choice
}

function mountain() {
    
}

function run_away () {
    echo -e "You decide to run away. You don't want any part of this world.\nYou tell yourself this is not how you want to live your life.\nWithin seconds, you feel this gut urge to turn around and walk out."
    echo "."
    sleep 1
    echo ".."
    sleep 1
    echo "..."
    sleep 1
    echo "...."
    sleep 3
    echo -e "You start screaming and running for the hills.\nYou get a good distance away and you feel freedom, then all of a sudden....\n*BAM* *WHACK* *PHWAPOOM*\nYou trip on a tree root sticking out of the ground, you fall and hit your head on a rock.\nYou perish....for running from your destiny.\n.....GAME OVER....."
}
# Main game time
introduction
