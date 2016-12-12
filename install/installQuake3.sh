#!/bin/bash

#Install Quake III
#http://blog.nextthing.co/accelerate-your-3d-gaming-with-quake-iii-on-pocketc-h-i-p/
install-quake-3() {

    #NEED to run as chip user to allow permissions
    su -c "git clone https://github.com/NextThingCo/ioquake3-gles.git" -s /bin/sh chip
    cd ioquake3-gles
    su -c "./build.sh" -s /bin/sh chip

    #Return to pocket chip scripts folder
    cd ..

    # Enable full screen mode for quake 3
    find-replace-line "+set r_fullscreen 0 \\" "+set r_fullscreen 1 \\" $mednafen_config_file
}

#Open with the command: openarena
