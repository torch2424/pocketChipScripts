#!/bin/bash

#Install Marshamallow, a much better home screen replacement
#https://bbs.nextthing.co/t/pocket-home-marshmallow-edition/6579
#Keep this script up-to-date with their installation instructions
install-pocket-home() {
    #Install xinput calibrator, or pocket home will complain
    sudo apt-get install -y xinput-calibrator
    wget -O install-pockethome http://bit.ly/29uWueR
    chmod +x install-pockethome
    ./install-pockethome
    rm install-pockethome
}
