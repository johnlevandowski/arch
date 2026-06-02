Arch Installation
=================

```
pacman -S archinstall git
git clone https://github.com/johnlevandowski/arch
cd arch
./archinstall.sh
```

* Disk configuration > Partitioning > Use a best-effort default partition layout > btrfs > compress > zstd
* Disk configuration > Snapshots > Snapper
* Install > Yes
* Exit archinstall

```
cp -r /var/log/archinstall /mnt/home/john
reboot
```

Change default user and root password "test" with passwd  
