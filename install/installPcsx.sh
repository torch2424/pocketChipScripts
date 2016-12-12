#!/bin/bash

# Install Pcsx
# https://bbs.nextthing.co/t/pocketchip-does-psx-and-its-playable-4-4-accelerated-update/11198/3
install-pcsx() {
    # Save our current directory
    SCRIPT_DIR=$(pwd)

    sudo apt-get install -y git build-essential libsdl1.2-dev
    git clone https://github.com/notaz/pcsx_rearmed.git /home/chip/pcsx_rearmed
    cd /home/chip/pcsx_rearmed

    #Fix for huge fonts
    #https://github.com/notaz/pcsx_rearmed/issues/76
    #P.s could also use this to change the default bios path :D
    find-replace-line "#define MENU_X2" "#define MENU_X2 0" frontend/menu.c

    git submodule update --init
    export CFLAGS="-mcpu=cortex-a8 -mtune=cortex-a8 -mfpu=neon"
    ./configure --sound-drivers="sdl"
    make

    #this will generate pcsx script, make it executable
    chmod +x pcsx

    #Return back to our directory
    cd $SCRIPT_DIR

    # Make appropriate rom folder
    # Find our rom path (Depending on samba)
    rompath="/home/chip"
    if [ -d "/home/chip/chipSamba" ]; then
      rompath="/home/chip/chipSamba"
    fi

    #Make our rom folders
    mkdir $rompath/roms
    mkdir $rompath/roms/psx

    # Chmod the roms folder
    chmod 777 -R $rompath/roms
    chown chip:chip -R $rompath/roms
}
