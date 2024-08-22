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

function confront_choice () {
    buffer
    echo -e "1) Call the guards for help \n2) Attack Docsilius\n3) Give up"
    read -p "Select where you want to go: " confront_choice
    buffer
    case $confront_choice in
        1) 
            guards
            ;;
        2)
            attack
            ;;
        3)  
            give_up
            ;;
        *)
            echo -e "You're kinda stuck here....so call for help, fight, or give up...."
            buffer
            confront_choice
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

function mountain () {
    echo -e "****   You head to the mountain. It's a dangerous trek to get there.\n****   You're almost at the base and you see a cave."
    buffer
    speaker "Docsilius"
    echo -e "This doesn't bode well for us $player....Do we go in to the cave? The jewel might be there?"
    pause
    echo -e "****   You decide to go in the cave"
    pause
    speaker "Docsilius"
    echo -e "Watch out $player!!!!"
    pause
    echo -e "****   All of a sudden the mountain starts to shake, you hear a roar in the distance.\n****   The rumbling gets louder and louder and you see a titan emerge.\n****   The titan is very angry and proceeds to swing his club at you.\n****   You do what you can to survive but you have so many injuries.\n****   You see Docsilius laying down in a pool of red liquid.\n****   He's gone...You look up and as soon as your head lifts up, your vision goes dark.\n****   You hit the ground hard....you died....\n.....GAME OVER....."
}

function confront () {
    echo -e "****   You head to the Castle to confront King Mont.\n****   The Jewel was with him all along but he's the one asking for adventurers to find it.\n****   You barge in demanding to see the Golden Jewel in the King's Chest.\n****   King Mont looks stunned."
    buffer
    speaker "King Mont"
    echo -e "What is the meaning of this?! What do you think you're doing!\nThis is the King's Hall! How dare you barge in with this behavior! GUARDS!"
    buffer
    echo -e "****   The Royal Guards swarm you and take you to the dungeon.\n****   Days pass....You don't know how long you've been imprisoned.\n****   All of a sudden you see Docsilius pull out jewel from his sleeve.\n****   He chuckles while holding it, staring at you."
    pause
    speaker "Docsilius"
    echo -e "You fool. I've had the jewel this whole time. Now that I have this in my possession...I AM THE NEW RULER OF TEXTERRIA! BOW DOWN BEFORE ME!!!!"
    confront_choice
}

function guards () {
    echo -e "You decide to call the guards. You're screaming for help.\nDocsilius walks behind you as your screaming and knocks you out.\nYou wake up and you're in your room.\nIt was all a dream but you look down and find the Golden Jewel in your hand.\nWas it a dream?\n.....GAME OVER....."
}

function attack () {
    echo -e "You decide to fight. You swing at Docsilius and he dodges your attack.\nHe's quicker than you thought. You attack again.\nAs you attack your hand hits the wall.\nDocsilius swings at you but you barely avoid his punch.\nYou try kicking him one last time with all your might.\nYou land a blow, Docsilius flies back and hits the wall.\nAs he hits the wall, his head hits a rock on the wall that's jutted out.\nDocsilius falls down gasping, holding the back of his head.\nThen he falls limp.....\nYou take the Golden Jewel from him.\nGuards finally arrive after hearing all the ruckus.\nThey see you've killed Docsilius for the Jewel.\nYou're imprisoned forever.....\nYou go to sleep and you wake up. You notice you're in your bedroom.\nIt was all a dream...or was it?\nYou look down in your hand and you have the Golden Jewel...\n.....GAME OVER....."
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

function give_up () {
    echo -e "You decide to give up. You don't care anymore about the journey.\nYou look at Docsilius and just go to sleep.\nYou awake and you find yourself in your room. It was all just a bad dream.\n.....GAME OVER....."
}
# Main game time
introduction
