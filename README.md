# Post-installation script

This is a bash script created to automate the post-installation process on Linux systems that uses apt, dnf, or pacman/pamac. It was designed specifically for Linux Mint, Pop!_OS, Fedora, and Manjaro.

The script identifies which package manager the system uses and applies the appropriate code to the system.

It was developed for personal use only; feel free to use or modify it if you find it useful.

## Updates
The script handles the system keys (Manjaro) and updates before installing any packages and after the installations are complete.

## Installed packages
Flatpaks are enabled by this script, without the need to reboot; snaps are no longer used.
* **Flatpaks:** AdwSteamGtk, AnyDesk, Ardour, Audacity, Bitwarden, Blanket, BleachBit, Bottles, Boxes, Cartridges, ClamTK, Cockpit Client, Darktable, Detwinner, Discord, Firefox, Flatseal, Fluffychat, Freeplane, Fsearch, Gearlever, GIMP, Gnome Extensions, Guitarix, Heroic Games Launcher, Hidamari, Inkscape, Kdenlive, Komikku, LMMS, Lutris, MEGAsync, Motrix, Obsidian, OBS Studio, Okular, OnlyOffice, OpenAndroidInstaller, OpenTTD, Organizer, RetroArch, Spotify, Steam, Telegram, Tellico, Thunderbird, Todoist, Transmission, Tuxemon, TuxGuitar, VLC and ZapZap
* **Official Repositories:** adb, bat, btop, duf, exa, fd-find, gnome-tweaks, gparted, ncdu, ripgrep, timseshift, tldr and thefuck
* **DNF:** akmod-nvidia
* **APT:** nala
* **PAMAC:** LibreOffice
* **AppImage:** Fedistar and Mendeley Reference Manager
* **Others:** Bedrock Linux, Facilitador Linux, NordVPN, PhotoGIMP patch, Syncthing, TeamViewer and Universal Android Debloater

## Uninstalled packages
No packages are currently uninstalled.

# Running the script

In order to run the script on your machine, you can use the following commands on your terminal:

    git clone https://github.com/vfalmado/Post-installation-script
    cd Post-installation-script
    chmod +x post-script.sh
    ./post-script.sh
