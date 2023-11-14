#!/bin/bash
set -e

# Setting variables

REPS="bat btop duf exa gnome-tweaks gparted ncdu ripgrep tldr thefuck"
FLATPAKS="io.github.Foldex.AdwSteamGtk
org.audacityteam.Audacity
com.bitwarden.desktop
com.rafaelmardojai.Blanket
com.usebottles.bottles
org.gnome.Boxes
hu.kramo.Cartridges
com.gitlab.davem.ClamTk
org.cockpit_project.CockpitClient
org.gnome.DejaDup
com.neatdecisions.Detwinner
com.discordapp.Discord
org.mozilla.firefox
com.github.tchx84.Flatseal
im.fluffychat.Fluffychat
org.freeplane.App
io.github.cboxdoerfer.FSearch
it.mijorus.gearlever
org.gimp.GIMP
org.gnome.Extensions
org.guitarix.Guitarix
com.heroicgameslauncher.hgl
io.github.jeffshee.Hidamari
org.inkscape.Inkscape
org.kde.kdenlive
info.febvre.Komikku
io.lmms.LMMS
net.lutris.Lutris
nz.mega.MEGAsync
net.agalwood.Motrix
md.obsidian.Obsidian
com.obsproject.Studio
org.kde.okular
org.openandroidinstaller.OpenAndroidInstaller
org.openttd.OpenTTD
org.librehunt.Organizer
org.libretro.RetroArch
com.spotify.Client
com.valvesoftware.Steam
org.telegram.desktop
org.kde.tellico
org.mozilla.Thunderbird
com.todoist.Todoist
com.transmissionbt.Transmission
org.tuxemon.Tuxemon
ar.com.tuxguitar.TuxGuitar
org.videolan.VLC
com.rtosta.zapzap"

# Identifying the package manager, updating, and enabling snaps

# APT
if command -v apt > /dev/null 2>&1; then
  sudo apt update && sudo apt upgrade -y
  sudo apt update

# DNF
elif command -v dnf > /dev/null 2>&1; then
  sudo dnf update -y
  sudo dnf install akmod-nvidia -y
  
# PACMAN
elif command -v pacman > /dev/null 2>&1; then
  sudo pacman -Syu
  sudo pacman -S flatpak
fi

# Adding flathub, installing flatpak packages, and updating ClamTK and flatpaks

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub $FLATPAKS
flatpak update -y
sudo freshclam

# Downloading PhotoGIMP, Fedistar, Syncthing, Bedrock Linux, Mendeley and NordVPN

curl -s https://raw.githubusercontent.com/projetus-ti/facilitador-linux/master/install.sh | sudo bash
wget https://github.com/Diolinux/PhotoGIMP/releases/download/1.1/PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip
unzip PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip
mv PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak/.local ~
mv PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak/.var ~
wget https://github.com/h3poteto/fedistar/releases/download/v1.7.3/fedistar_1.7.3_amd64.AppImage
wget https://github.com/syncthing/syncthing/releases/download/v1.26.0/syncthing-linux-amd64-v1.26.0.tar.gz
tar -xzf syncthing-linux-amd64-v1.26.0.tar.gz
wget https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.28/bedrock-linux-0.7.28-x86_64.sh
chmod +x bedrock-linux-0.7.28-x86_64.sh
sudo sh bedrock-linux-0.7.28-x86_64.sh --hijack
wget https://static.mendeley.com/bin/desktop/mendeley-reference-manager-2.103.0-x86_64.AppImage
rm PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip syncthing-linux-amd64-v1.26.0.tar.gz bedrock-linux-0.7.28-x86_64.sh
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
nordvpn login

# Updating Manjaro/Arch system keys, installing pamac packages, and system updates

if command -v pacman > /dev/null 2>&1; then
  sudo pacman -Sy archlinux-keyring manjaro-keyring
  sudo pacman-key --populate archlinux manjaro
  sudo pacman-key --refresh-keys
  pamac install libreoffice-fresh teamviewer fd $REPS
  sudo pacman -Syu

# Installing TeamViewer, dnf packages and system updates 

elif command -v dnf > /dev/null 2>&1; then
  wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm #https://mega.nz/linux/repo/Fedora_37/x86_64/megasync-Fedora_37.x86_64.rpm
  sudo dnf install teamviewer.x86_64.rpm #megasync-Fedora_37.x86_64.rpm
  rm teamviewer.x86_64.rpm #megasync-Fedora_37.x86_64.rpm
  sudo dnf install fd-find gnome-tweaks $REPS
  sudo dnf update
  
# Installing TeamViewer, apt packages and system updates

elif command -v apt > /dev/null 2>&1; then
  wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
  sudo apt install teamviewer_amd64.deb
  rm teamviewer_amd64.deb
  sudo apt install nala
  sudo nala install fd-find $REPS
  sudo apt update && sudo apt upgrade -y

echo Proccess finished successfully!
