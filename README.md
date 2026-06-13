Arch Installation
=================

virt-manager setup
------------------

* Overview > Firmware = UEFI
* CPU > Topology > Manually set


archinstall
-----------

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
rate-mirrors --protocol https arch | sudo tee /etc/pacman.d/mirrorlist
```


Paru Installation
-----------------

```
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```


Limine Snapper
--------------

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
---
