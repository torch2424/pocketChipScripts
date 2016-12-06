#!/bin/bash

# Import our functions
source utilFunctions.sh

# This will be the initial set up script for pocket chip

# Welcome the user, Possibly put a cool banner here one day
print-spacing
e_header "Hello! Welcome to the torch2424 pocket chip setup script!!!"
print-spacing

# Ask for sudo (To install packages and update)
e_warning "This script will need superuser access to run things like apt-get."
get-sudo

# Update/Upgrade the chip
print-spacing
e_arrow "Updating/Upgrading pocket chip!"
sudo apt-get update
sudo apt-get -y upgrade

# Install somebasic extras, taken from alot of blog posts
print-spacing
e_arrow "Installing some extras (ssh, git, etc...)"
sudo apt-get install -y ssh git

#Inform of swtiching to user input
print-spacing
e_warning "Now prompting for optional packages. These can be installed individually with the scripts in this repo."

#Install Marshamallow, a much better home screen replacement
#https://bbs.nextthing.co/t/pocket-home-marshmallow-edition/6579
print-spacing
e_arrow "Pocket Home (Marshmallow Edition)"
e_note "This is highly suggested. It will greatly expand your homescreen functionality."
e_note "Pocket Home Marshmallow Edition can be found at: https://bbs.nextthing.co/t/pocket-home-marshmallow-edition/6579"
seek_confirmation "Would you like to install Pocket Home (Marshmallow Edition)?"
if is_confirmed; then
    chmod +x installPocketHome
    sh installPocketHome
else
  e_bold "Installation skipped"
fi

#Install Doom
#http://blog.nextthing.co/customize-the-hell-out-of-your-pocketc-h-i-p-install-doom-give-it-an-icon-on-the-home-screen/
print-spacing
e_arrow "Doom"
e_note "Next Thing Co. Doom Install found at: https://bbs.nextthing.co/t/pocket-home-marshmallow-edition/6579"
seek_confirmation "Would you like to install Doom?"
if is_confirmed; then
    chmod +x installDoom
    sh installDoom
else
  e_bold "Installation skipped"
fi

#Install playstation
#http://blog.nextthing.co/community-project-emulate-the-playstation-on-your-pocketc-h-i-p/
#Coming soon!
