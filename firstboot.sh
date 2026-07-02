#!/bin/sh

sudo pacman -Syu
sudo cp $HOME/Documents/GitHub/arch/files/etc/pacman.d/mirrorlist.backup /etc/pacman.d/
rankmirrors /etc/pacman.d/mirrorlist.backup | sudo tee /etc/pacman.d/mirrorlist
sudo pacman -Syu

sudo cp $HOME/Documents/GitHub/arch/files/etc/snapper/configs/root /etc/snapper/configs/
sudo cp $HOME/Documents/GitHub/arch/files/etc/NetworkManager/conf.d/20-connectivity.conf /etc/NetworkManager/conf.d/
sudo mkdir /etc/samba
sudo cp $HOME/Documents/GitHub/arch/files/etc/samba/.smbcredentials /etc/samba/
