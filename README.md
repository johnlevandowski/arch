Arch Installation
=================

virt-manager setup
------------------

Overview > Firmware = UEFI  
CPU > Topology > Manually set  


archinstall Installation
------------------------

```
pacman -Sy archinstall git --needed
git clone https://github.com/johnlevandowski/arch
cd arch
./archinstall.sh
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
sudo micro /etc/default/limine
```

```
ESP_PATH="/boot"
BOOT_ORDER="*, *lts, *fallback, Snapshots"
MAX_SNAPSHOT_ENTRIES=auto
```

```
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
