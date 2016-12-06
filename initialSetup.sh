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

# Install some basics
print-spacing
e_bold "Updating/Upgrading pocket chip!"
sudo apt-get update
sudo apt-get -y upgrade
