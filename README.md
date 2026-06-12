Arch Installation
=================

virt-manager setup
------------------

Overview > Firmware = UEFI x86_64  


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

paru -S limine-snapper-sync limine-mkinitcpio-hook

sudo micro /etc/mkinitcpio.conf
add the sd-btrfs-overlayfs hook after the filesystems hook (btrfs-overlays in VM)

sudo micro /etc/default/limine

ESP_PATH=
BOOT_ORDER="*, *lts, *fallback, Snapshots"

limine-update

add //Snapshots at bottom of /boot/limine.conf

limine-snapper-sync
