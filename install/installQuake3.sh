#!/bin/bash

#Install Quake III
#http://blog.nextthing.co/accelerate-your-3d-gaming-with-quake-iii-on-pocketc-h-i-p/
install-quake() {
    http://blog.nextthing.co/accelerate-your-3d-gaming-with-quake-iii-on-pocketc-h-i-p/
    git clone https://github.com/NextThingCo/ioquake3-gles
    cd ioquake3-gles
    ./build.sh
}

#Open with the command: openarena