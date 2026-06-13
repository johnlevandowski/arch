#!/bin/sh

sudo cp $HOME/Documents/GitHub/arch/files/etc/snapper/configs/root /etc/snapper/configs/
sudo cp $HOME/Documents/GitHub/arch/files/etc/NetworkManager/conf.d/20-connectivity.conf /etc/NetworkManager/conf.d/
sudo cp $HOME/Documents/GitHub/arch/files/etc/samba/.smbcredentials /etc/samba/
rate-mirrors --protocol https arch | sudo tee /etc/pacman.d/mirrorlist
