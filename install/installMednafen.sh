#!/bin/bash

#Install Mednafen
#https://bbs.nextthing.co/t/mednafen-emulator-configuration-gbc-gba-snes-nes/5027
install-mednafen() {
    #Install mednafen from apt-get
    sudo apt-get install -y mednafen libsdl2-dev

    # Need to open mednafen, fo r it to make it config folder
    mednafen &
    sleep 10
    pkill mednafen

    # Start replacing lines, change video driver to sdl for performance
    find-replace-line "video.driver" "video.driver sdl" /home/chip/.mednafen/mednafen.cfg

    # Sound
    find-replace-line "sound.device" "sound.device sexyal-literal-default" /home/chip/.mednafen/mednafen.cfg

    # GBA config
    find-replace-line "gba.xscalefs" "gba.xscalefs 2.000000" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "gba.yscalefs" "gba.yscalefs 2.000000" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "gba.stretch" "gba.stretch full" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "gba.yres" "gba.yres 272" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "gba.xres" "gba.xres 480" /home/chip/.mednafen/mednafen.cfg

    # GBC config
    find-replace-line "gb.stretch" "gb.stretch aspect" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "gb.xres" "gb.xres 480" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "gb.xscalefs" "gb.xscalefs 2.000000" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "gb.yres" "gb.yres 272" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "gb.yscalefs" "gb.yscalefs 2.000000" /home/chip/.mednafen/mednafen.cfg

    # NES Config
    find-replace-line "nes.stretch" "nes.stretch aspect" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "nes.xres" "nes.xres 480" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "nes.xscalefs" "nes.xscalefs 2.000000" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "nes.yres" "nes.yres 272" /home/chip/.mednafen/mednafen.cfg
    find-replace-line "nes.yscalefs" "nes.yscalefs 2.000000" /home/chip/.mednafen/mednafen.cfg



    ##### Install the gui ####

    #Find our rom path (Depending on samba)
    rompath="/home/chip"
    if [ -d "/home/chip/chipSamba" ]; then
      rompath="/home/chip/chipSamba"
    fi

    #Make our rom folders
    mkdir $rompath/roms
    mkdir $rompath/roms/gba
    mkdir $rompath/roms/gbc
    mkdir $rompath/roms/nes

    #Install zentiy for the gui
    sudo apt-get install -y zenity

    # Copy our script to the home folder
    cp assets/mednafenGui.sh /home/chip
    chmod +x /home/chip/mednafenGui.sh
}
