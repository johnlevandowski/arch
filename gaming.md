Gaming
======

```
sudo pacman -S steam lib32-vulkan-radeon lact --needed
paru -S curseforge --needed
flatpak install com.vysp3r.ProtonPlus
```


Battle.net in steam launcher
----------------------------

https://download.battle.net/en-us/desktop  

https://support.tradeskillmaster.com/tsm-desktop-application/how-do-i-set-up-the-tsm-desktop-application  

* Add a Game > Add a Non-Steam Game > Browse and select installer
* Installer > Right-click Properties > Compatibility > Force the use of a specific Steam Play compability tool > Select Proton version
* Installer > Click Play > Complete installation (exit at login prompt)
* Installer > Right-click Properties > Target = "/home/[USER]/.local/share/Steam/steamapps/compatdata/[PREFIX_ID]/pfx/drive_c/Program Files (x86)/Battle.net/Battle.net Launcher.exe" (quotes required)
* Installer > Right-click Properties > Start In = /home/[USER]/.local/share/Steam/steamapps/compatdata/[PREFIX_ID]/pfx/drive_c/Program Files (x86)/Battle.net/
* Installer > Click Play


Performance Optimizations
-------------------------

https://wiki.archlinux.org/title/GameMode  

https://github.com/ilya-zlobintsev/LACT - power profile 3D_FULL_SCREEN  
