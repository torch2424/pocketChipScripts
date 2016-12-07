#!/bin/bash

# Don't need to source util in here, since we are sourcing this function after util in main

#Samba Server (For Easy file transfer)
#https://bbs.nextthing.co/t/chip-nas-network-attached-storage/1685/2
#https://www.theurbanpenguin.com/setting-up-a-samba-server-on-raspberry-pi/
#Pass in the home directory for the sambashare mkdir
install-samba() {
    sudo apt-get install -y samba

    #Edit the config
    find-replace-line "workgroup =" "workgroup = rday" /etc/samba/smb.conf
    find-replace-line "security =" "security = share" /etc/samba/smb.conf
    find-replace-line "share modes =" "share modes = yes" /etc/samba/smb.conf
    find-replace-line "create mask =" "create mask = 0775" /etc/samba/smb.conf
    find-replace-line "directory mask =" "directory mask = 0775" /etc/samba/smb.conf

    #Make the path for the samba
    mkdir ${1}/sambaShare

    #Add to the bottom of the conf
    echo "[chipSamba]" >> /etc/samba/smb.conf
    echo "path = /home/chip/sambaShare" >> /etc/samba/smb.conf
    echo "public = yes" >> /etc/samba/smb.conf
    echo "writable = yes" >> /etc/samba/smb.conf
    echo "comment = smb share" >> /etc/samba/smb.conf
    echo "printable = no" >> /etc/samba/smb.conf
    echo "guest ok = yes" >> /etc/samba/smb.conf

    #Restart samba
    /etc/init.d/samba restart

    #Instalation complete!
    #Go to smb://chip to see files!
}
