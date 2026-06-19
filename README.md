# Post-installation script

This is a bash script created to automate the post-installation process on Linux systems that uses apt, dnf, or pacman/pamac. It was designed specifically for Linux Mint, Pop!_OS, Fedora, and Manjaro.

The script identifies which package manager the system uses and applies the appropriate code to the system.

It was developed for personal use only; feel free to use or modify it if you find it useful.

## Updates
The script handles the system keys (Manjaro) and updates before installing any packages and after the installations are complete.

## Installed packages
Flatpaks and Snaps are enabled by this script, without the need to reboot.
* **Flatpaks:** AnyDesk, Ardour, Bitwarden, Bottles, Boxes, Carla, ClamUI, Detwinner, Discord, Flameshot, Flatseal, Freeplane, Fsearch, Gearlever, GIMP, Guitarix, Heroic Games Launcher, Hydrogen, Imager (Rpi), Inkscape, Kdenlive, LibreWolf, Luanti, Lutris, Motrix, Nextcloud Client, OBS Studio, Okular, OnlyOffice, OpenAndroidInstaller, OpenTTD, Organizer, RetroArch, Spotify, SSHPilot, Steam, Telegram, Tellico, Thunderbird, Transmission, TuxGuitar, VLC, ZapZap and Zotero.
* **Official Repositories:** adb, bat, btop, duf, exa, fd-find, gnome-tweaks, gparted, ncdu, ripgrep, timseshift, tldr and thefuck
* **DNF:** akmod-nvidia, glibc-devel, cairo-devel, libX11-devel, xorg-x11-proto-devel and lv2-devel
* **APT:** nala
* **PAMAC:** LibreOffice
* **Others:** PhotoGIMP patch, Universal Android Debloater, and LinuxToys

## Uninstalled packages
No packages are currently uninstalled.

# Running the script

In order to run the script on your machine, you can use the following commands on your terminal:

    git clone https://github.com/vfalmado/Post-installation-script
    cd Post-installation-script
    chmod +x post-script.sh
    ./post-script.sh
