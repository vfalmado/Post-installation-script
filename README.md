# Post-installation script

This is a bash script created to automate the post-installation process on Linux systems that uses apt, dnf, or pacman/pamac. It was designed specifically for Linux Mint, Pop!_OS, Fedora, and Manjaro.

The script identifies which package manager the system uses and applies the appropriate code to the system.

It was developed for personal use only; feel free to use it if you find it useful.

## Updates
The script handles the system keys (Manjaro) and updates before installing any packages and after the installations are complete.

## Installed packages
Flatpaks and Snaps are enabled by this script, without the need to reboot.
* **Snaps:** Authy and Multipass
* **Flatpaks:** 0ad, Akregator, Bitwarden, ClamTK, Discord, EDuke32, Flameshot, GIMP, Gnome Boxes, GitHub Desktop, Heroic Games, Joplin, Kdenlive, Lutris, Manuskript, OBS Studio, Scribus, Spotify, Steam, Tellico, Todoist, Tuxemon and ZapZap
* **Repositories:** bat, btop, duf, exa, fd-find, ncdu and ripgrep
* **Official repository (Manjaro):** LibreOffice and Telegram
* **AUR:** TeamViewer
* **AppImage:** Mendeley Reference Manager

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