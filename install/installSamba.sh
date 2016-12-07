#!/bin/bash

# Don't need to source util in here, since we are sourcing this function after util in main

#Samba Server (For Easy file transfer)
#https://bbs.nextthing.co/t/chip-nas-network-attached-storage/1685/2
install-samba() {
    sudo apt-get install -y samba

    #Edit the config
    find-replace-line "workgroup =" "workgroup = rday" /etc/samba/conf
    find-replace-line "security =" "security = share" /etc/samba/conf
    find-replace-line "share modes =" "share modes = yes" /etc/samba/conf
    find-replace-line "create mask =" "create mask = 0775" /etc/samba/conf
    find-replace-line "directory mask =" "directory mask = 0775" /etc/samba/conf

    #Make the path for the samba
    mkdir ~/sambaShare

    #Add to the bottom of the conf
    echo "[public]" >> /etc/samba/conf
    echo "path = /home/chip/sambaShare" >> /etc/samba/conf
    echo "public = yes" >> /etc/samba/conf
    echo "writable = yes" >> /etc/samba/conf
    echo "comment = smb share" >> /etc/samba/conf
    echo "printable = no" >> /etc/samba/conf
    echo "guest ok = yes" >> /etc/samba/conf

    #Restart samba
    /etc/init.d/samba restart

    #Instalation complete!
    #Go to smb://chip to see files!
}
