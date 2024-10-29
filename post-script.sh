#!/bin/bash
set -e

# Setting variables

REPS="adb bat btop duf exa gparted ncdu ripgrep timeshift tldr thefuck"
FLATPAKS="io.github.Foldex.AdwSteamGtk
net.ankiweb.Anki
com.anydesk.Anydesk
org.ardour.Ardour
org.audacityteam.Audacity
com.bitwarden.desktop
org.bleachbit.BleachBit
com.usebottles.bottles
org.gnome.Boxes
studio.kx.carla
com.gitlab.davem.ClamTk
org.cockpit_project.CockpitClient
org.darktable.Darktable
com.neatdecisions.Detwinner
com.discordapp.Discord
org.mozilla.firefox
org.flameshot.Flameshot
com.github.tchx84.Flatseal
io.github.cboxdoerfer.FSearch
it.mijorus.gearlever
org.gimp.GIMP
org.guitarix.Guitarix
com.heroicgameslauncher.hgl
org.hydrogenmusic.Hydrogen
org.inkscape.Inkscape
org.kde.kdenlive
info.febvre.Komikku
net.lutris.Lutris
net.minetest.Minetest
net.agalwood.Motrix
com.obsproject.Studio
org.kde.okular
org.onlyoffice.desktopeditors
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
ar.com.tuxguitar.TuxGuitar
org.videolan.VLC
com.rtosta.zapzap"

# Identifying the package manager and updating

# APT
if command -v apt > /dev/null 2>&1; then
  sudo apt update && sudo apt upgrade -y
  sudo apt update

# DNF, also installs Nvidia drivers
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

# Downloading PhotoGIMP, Universal Android Debloater, Bedrock Linux and NordVPN

wget https://github.com/Diolinux/PhotoGIMP/releases/download/1.1/PhotoGIMP.zip
unzip PhotoGIMP.zip
mv PhotoGIMP-master/.local ~
mv PhotoGIMP-master/.var ~
wget https://github.com/0x192/universal-android-debloater/releases/download/0.5.1/uad_gui-linux.tar.gz
tar -xzf uad_gui-linux.tar.gz
wget https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.30/bedrock-linux-0.7.30-x86_64.sh
chmod +x bedrock-linux-0.7.30-x86_64.sh
sudo sh bedrock-linux-0.7.30-x86_64.sh --hijack
rm PhotoGIMP-master bedrock-linux-0.7.30-x86_64.sh uad_gui-linux.tar.gz
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
nordvpn login

# Updating Manjaro/Arch system keys, installing pamac packages, and system updates

if command -v pacman > /dev/null 2>&1; then
  sudo pacman -Sy archlinux-keyring manjaro-keyring
  sudo pacman-key --populate archlinux manjaro
  sudo pacman-key --refresh-keys
  pamac install libreoffice-fresh teamviewer fd $REPS
  sudo pacman -Syu

# Installing TeamViewer, MegaSync, dnf packages and system updates 

elif command -v dnf > /dev/null 2>&1; then
  wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm https://mega.nz/linux/repo/Fedora_40/x86_64/megasync-Fedora_40.x86_64.rpm
  sudo dnf install teamviewer.x86_64.rpm megasync-Fedora_40.x86_64.rpm
  rm teamviewer.x86_64.rpm megasync-Fedora_40.x86_64.rpm
  sudo dnf install fd-find glibc-devel cairo-devel libX11-devel xorg-x11-proto-devel lv2-devel $REPS
  sudo dnf update
  
# Installing TeamViewer, apt packages and system updates

elif command -v apt > /dev/null 2>&1; then
  wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
  sudo apt install teamviewer_amd64.deb
  rm teamviewer_amd64.deb
  sudo apt install nala
  sudo nala install fd-find $REPS
  sudo apt update && sudo apt upgrade -y
fi

echo "Proccess finished successfully!"
