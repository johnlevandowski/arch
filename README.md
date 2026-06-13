Arch Installation
=================

virt-manager setup
------------------

* Overview > Firmware = UEFI
* CPU > Topology > Manually set


archinstall
-----------

[Arch Linux ISO 2026.06.01](https://archlinux.org/download/)

```
pacman -Sy archinstall git --needed
git clone https://github.com/johnlevandowski/arch
./arch/archinstall.sh
```

* Disk configuration > Partitioning > Use a best-effort default partition layout > btrfs > compress > zstd
* Disk configuration > Btrfs Snapshots > Snapper
* Install > Yes
* Exit archinstall

```
cp -r /var/log/archinstall /mnt/home/john
reboot
```


First Boot
----------

Change default user and root password "test" with passwd  

```
git clone https://github.com/johnlevandowski/arch $HOME/Documents/GitHub/arch
sudo cp $HOME/Documents/GitHub/arch/files/etc/snapper/configs/root /etc/snapper/configs/
sudo cp $HOME/Documents/GitHub/arch/files/etc/NetworkManager/conf.d/20-connectivity.conf /etc/NetworkManager/conf.d/
rate-mirrors --protocol https arch | sudo tee /etc/pacman.d/mirrorlist
```


Paru Installation
-----------------

```
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```


Limine Snapper Sync
-------------------

```
paru -S limine-snapper-sync limine-mkinitcpio-hook
sudo micro /etc/mkinitcpio.conf
```

Add btrfs-overlayfs hook after the filesystems hook  

```
sudo cp $HOME/Documents/GitHub/arch/files/etc/default/limine /etc/default/
limine-update
```

```
sudo micro /boot/limine.conf  
```

Add //Snapshots at bottom of Arch linux block  

```
sudo snapper create
limine-snapper-sync
sudo systemctl enable --now limine-snapper-sync.service
```


Arch Update
-----------

```
paru -S arch-update
systemctl --user enable --now arch-update-tray.service
```


Firewall
--------

```
sudo ufw status verbose
sudo journalctl -k -r -g "UFW"
sudo ufw logging off
sudo ufw status verbose
```


Mounts
------

```
cd $HOME/Documents/GitHub/cachyos/mounts/
```

https://github.com/johnlevandowski/cachyos/tree/main/mounts  


Packages
--------

```
sudo /mnt/rpi5/Documents/Linux/arch/packages.sh
```

```
mkdir -p /home/john/Documents/gnucash
cp /mnt/rpi5/Documents/gnucash/finances.gnucash /home/john/Documents/gnucash/
rclone config touch
```


AUR Packages
------------

```
pacman -Qmi
```


System Settings
---------------

https://github.com/johnlevandowski/dotfiles#restore-dotfiles-from-git-repository  

Panel > Show Panel Configuration > Panel Height = 50  
Panel > Networks Icon > Enable WiFi = OFF  
Panel > Bluetooth Icon > Enable Bluetooth = OFF  

* Mouse & Touchpad > Pointer Speed = 1.00  
* Mouse & Touchpad > Enable pointer Acceleration = OFF  
* Display & Monitor > Scale = 125%  
* Display & Monitor > Refresh rate = 180hz  
* Display & Monitor > Adaptive sync = Automatic  
* Display & Monitor > Enable HDR = ON  
* Display & Monitor > AOC > Calibrate HDR Brightness > 1100,200  
* Display & Monitor > LG > Calibrate HDR Brightness > 400,200  
* Wallpaper > Set for all screens = ON  
* Wallpaper > Images > Choose  
* Color and Themes > Global Theme > Breeze Dark  
* Login Screen > Apply Plasma settings  
* Login Screen > Configure Appearance > Images > Choose  
* Screen Locking > Lock screen automatically = 1 minute  
* Screen Locking > Configure Appearance > Images > Choose  
* Power Management > Turn off screen = 1 minute, When locked: 20 seconds  
* Power Management > Switch to power profile = Performance  
* Autostart > delete steam  
* Session > Ask for confirmatin on shutdown, restart, and logout = OFF  
* Session > On login, launch apps that were open = Start with an empty session  


Printer
-------

```
sudo systemctl enable cups.socket
```

Settings > Printers > Add  
Foomatic Brother HL-2240/hl1250 driver for HL-2230  
http://localhost:631  
