# Post-installation script

This is a bash script created to automate the post-installation process on Linux systems that uses apt, dnf, or pacman/pamac. It was designed specifically for Linux Mint, Pop!_OS, Fedora, and Manjaro.

The script identifies which package manager the system uses and applies the appropriate code to the system.

It was developed for personal use only; feel free to use it if you find it useful.

## Updates
The script handles the system keys (Manjaro) and updates before installing any packages and after the installations are complete.

## Installed packages
Flatpaks and Snaps are enabled by this script, without the need to reboot.
* **Snaps:** Authy and Multipass
* **Flatpaks:** 0ad, AdwSteamGtk, AppImmagePool, Bitwarden, Bottles, ClamTK, DejaDup, Discord, Firefox, Flameshot, Flatseal, GIMP, Gnome Boxes, Godot Engine, HedgeWars, Heroic Games, Joplin, Kdenlive, LMMS, Lutris, Manuskript, MEGAsync, MuseScore, OBS Studio, OpenTTD, PrismLauncher, RetroArch, Scribus, Spot, Spotify, Steam, StoryArchitect (Starc), Telegram, Tellico, Thunderbird, Todoist, Transmission, Tuxemon and ZapZap
* **Official Repositories:** bat, btop, duf, exa, fd-find, ncdu, ripgrep, tldr, thefuck, gparted, TeamViewer and Okular
* **DNF:** akmod-nvidia
* **APT:** nala
* **PAMAC:** LibreOffice
* **AppImage:** Mendeley Reference Manager
* **Others:** Syncthing, Bedrock Linux and NordVPN

## Patches
Applies the PhotoGIMP patch

## Uninstalled packages
No packages are currently uninstalled.

# Running the script

In order to run the script on your machine, you can use the following commands on your terminal:

    git clone https://github.com/vfalmado/Post-installation-script
    cd Post-installation-script
    chmod +x post-script.sh
    ./post-script.sh