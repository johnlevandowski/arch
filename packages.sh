#!/bin/sh

pacman -S \
7zip \
ark \
btrfs-assistant \
cups foomatic-db foomatic-db-engine print-manager system-config-printer \
distrobox podman podman-compose \
dolphin \
dust \
eza \
fastfetch \
filelight \
gimp libheif \
github-cli github-desktop \
gnome-disk-utility \
gnucash libdbi-drivers \
libreoffice-fresh \
plasma-disks \
qalculate-qt \
rclone \
ttf-hack-nerd \
--needed

pacman -Qq \
vim vim-runtime \
2>/dev/null | pacman -Rns -
