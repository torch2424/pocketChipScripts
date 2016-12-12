#!/bin/bash

#Install Pocket Snes
#https://bbs.nextthing.co/t/fast-snes-emulation-on-the-pocketc-h-i-p/9325/91
install-pocket-snes() {
    # Save our current directory
    SCRIPT_DIR=$(pwd)

    sudo apt install libsdl1.2-dev build-essential  git --no-install-recommends
    https://github.com/rmbq/PocketSNES.git /home/chip/pocketSNES
    cd /home/chip/pocketSNES
    wget -O snes.patch http://paste.lisp.org/display/325373/raw
    patch -p1 < snes.patch
    make

    #Copy executable script to home
    cp PocketSNES /home/chip/PocketSNES

    #Return back to our directory
    cd $SCRIPT_DIR
}

#Open with the command: ./PocketSNES
