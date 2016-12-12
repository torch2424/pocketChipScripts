#!/bin/bash

#Install Mednafen
#https://bbs.nextthing.co/t/mednafen-emulator-configuration-gbc-gba-snes-nes/5027
install-mednafen() {
    #Install mednafen from apt-get
    sudo apt-get install -y mednafen libsdl2-dev

    # Need to open mednafen, for it to make it config folder
    # also need to run as user to get working
    su -c "mednafen" -s /bin/sh chip
    sleep 1
    su -c "pkill mednafen" -s /bin/sh chip

    mednafen_config_file="/home/chip/.mednafen/mednafen-09x.cfg"

    # Start replacing lines, change video driver to sdl for performance
    find-replace-line "video.driver" "video.driver sdl" $mednafen_config_file

    # Sound
    find-replace-line "sound.device" "sound.device sexyal-literal-default" $mednafen_config_file
    find-replace-line "sound.period_time" "sound.period_time 500" $mednafen_config_file

    #Auto Save
    find-replace-line "autosave" "autosave 1" $mednafen_config_file

    # Some certain config such as saving states
    # http://mednafen.fobby.net/documentation/#Section_security_savestates
    # Fix using this: https://bbs.nextthing.co/t/mednafen-emulator-configuration-gbc-gba-snes-nes/5027/348
    find-replace-line "command.save_state keyboard" "command.save_state keyboard 53+alt" $mednafen_config_file
    find-replace-line "command.load_state keyboard" "command.load_state keyboard 55+alt" $mednafen_config_file


    # GBA config
    find-replace-line "gba.xscalefs" "gba.xscalefs 2.000000" $mednafen_config_file
    find-replace-line "gba.yscalefs" "gba.yscalefs 2.000000" $mednafen_config_file
    find-replace-line "gba.stretch" "gba.stretch full" $mednafen_config_file
    find-replace-line "gba.yres" "gba.yres 272" $mednafen_config_file
    find-replace-line "gba.xres" "gba.xres 480" $mednafen_config_file

    # GBC config
    find-replace-line "gb.stretch" "gb.stretch aspect" $mednafen_config_file
    find-replace-line "gb.xres" "gb.xres 480" $mednafen_config_file
    find-replace-line "gb.xscalefs" "gb.xscalefs 2.000000" $mednafen_config_file
    find-replace-line "gb.yres" "gb.yres 272" $mednafen_config_file
    find-replace-line "gb.yscalefs" "gb.yscalefs 2.000000" $mednafen_config_file

    # NES Config
    find-replace-line "nes.stretch" "nes.stretch aspect" $mednafen_config_file
    find-replace-line "nes.xres" "nes.xres 480" $mednafen_config_file
    find-replace-line "nes.xscalefs" "nes.xscalefs 2.000000" $mednafen_config_file
    find-replace-line "nes.yres" "nes.yres 272" $mednafen_config_file
    find-replace-line "nes.yscalefs" "nes.yscalefs 2.000000" $mednafen_config_file

    # Megadrive/Sega Genesis Config
    find-replace-line "md.stretch" "md.stretch 0" $mednafen_config_file
    find-replace-line "md.xres" "md.xres 320" $mednafen_config_file
    find-replace-line "md.xscalefs" "md.xscalefs 1.000000" $mednafen_config_file
    find-replace-line "md.yres" "md.yres 240" $mednafen_config_file
    find-replace-line "md.yscalefs" "md.yscalefs 1.000000" $mednafen_config_file

    # PSX Config, Not Playable
    # Snes Config, Crashes



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
    mkdir $rompath/roms/megadrive-genesis

    # Chmod the roms folder
    chmod 777 -R $rompath/roms
    chown chip:chip -R $rompath/roms

    #Install zentiy for the gui
    sudo apt-get install -y zenity

    # Copy our script to the home folder
    cp assets/mednafenGui.sh /home/chip
    chmod +x /home/chip/mednafenGui.sh
}
