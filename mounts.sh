#!/bin/sh

sudo chmod 600 /etc/samba/.smbcredentials

sudo mkdir -p /mnt/rpi5
sudo cp $HOME/Documents/GitHub/arch/files/etc/systemd/system/mnt-rpi5.mount /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now mnt-rpi5.mount
sudo chown -R $USER:$USER /mnt/rpi5

sudo mkdir -p /mnt/games
sudo cp $HOME/Documents/GitHub/arch/files/etc/systemd/system/mnt-games.mount /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now mnt-games.mount
sudo chown -R $USER:$USER /mnt/games
