#!/bin/bash

# Install Pcsx
# https://bbs.nextthing.co/t/pocketchip-does-psx-and-its-playable-4-4-accelerated-update/11198/3
install-pcsx() {
    sudo apt install -y build-essential libsdl-1.2-dev git --no-install-recommends
    git clone https://github.com/notaz/pcsx_rearmed.git
    cd pcsx_rearmed
    export CFLAGS="-mcpu=cortex-a8 -mtune=cortex-a8 -mfpu=neon"
    ./configure --sound-drivers="sdl"
    make

    #this will generate pcsx script
    chmod +x pcsx
    cp pcsx /home/chip

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
