#!/bin/bash
set -e

# Setting variables

REPS="adb bat btop duf exa gparted ncdu ripgrep timeshift tldr thefuck snapd"
FLATPAKS="net.ankiweb.Anki
com.anydesk.Anydesk
org.ardour.Ardour
org.audacityteam.Audacity
com.bitwarden.desktop
org.bleachbit.BleachBit
com.usebottles.bottles
org.gnome.Boxes
studio.kx.carla
com.gitlab.davem.ClamTk
com.neatdecisions.Detwinner
com.discordapp.Discord
org.flameshot.Flameshot
com.github.tchx84.Flatseal
io.github.cboxdoerfer.FSearch
it.mijorus.gearlever
org.gimp.GIMP
org.guitarix.Guitarix
com.heroicgameslauncher.hgl
org.hydrogenmusic.Hydrogen
org.raspberrypi.rpi-imager
org.inkscape.Inkscape
org.kde.kdenlive
io.gitlab.librewolf-community
org.luanti.luanti
net.lutris.Lutris
net.agalwood.Motrix
com.nextcloud.desktopclient.nextcloud
com.obsproject.Studio
org.kde.okular
org.onlyoffice.desktopeditors
org.openandroidinstaller.OpenAndroidInstaller
org.openttd.OpenTTD
org.librehunt.Organizer
org.libretro.RetroArch
com.spotify.Client
io.github.mfat.sshpilot
com.valvesoftware.Steam
org.telegram.desktop
org.kde.tellico
org.mozilla.Thunderbird
com.transmissionbt.Transmission
ar.com.tuxguitar.TuxGuitar
org.videolan.VLC
com.rtosta.zapzap
org.zotero.Zotero"

# Identifying the package manager and updating

# APT
if command -v apt > /dev/null 2>&1; then
  sudo apt update && sudo apt upgrade -y
  sudo apt update

# DNF, also installs Nvidia drivers
elif command -v dnf > /dev/null 2>&1; then
  sudo dnf update -y
  #sudo dnf install akmod-nvidia -y
  
# PACMAN
elif command -v pacman > /dev/null 2>&1; then
  sudo pacman -Syu
  sudo pacman -S flatpak
fi

# Adding flathub, installing flatpak packages, and updating ClamTK and flatpaks

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
flatpak install flathub $FLATPAKS -y
flatpak update -y

# Downloading Moises, PhotoGIMP, Universal Android Debloater and LinuxToys

wget https://desktop.moises.ai/
wget https://github.com/Diolinux/PhotoGIMP/releases/download/1.1/PhotoGIMP.zip
unzip PhotoGIMP.zip
mv PhotoGIMP-master/.local ~
mv PhotoGIMP-master/.var ~
wget https://github.com/0x192/universal-android-debloater/releases/download/0.5.1/uad_gui-linux.tar.gz
tar -xzf uad_gui-linux.tar.gz
curl -fsSL https://linux.toys/install.sh | bash
rm PhotoGIMP-master uad_gui-linux.tar.gz

# Updating Manjaro/Arch system keys, installing pamac packages, and system updates

if command -v pacman > /dev/null 2>&1; then
  sudo pacman -Sy archlinux-keyring manjaro-keyring
  sudo pacman-key --populate archlinux manjaro
  sudo pacman-key --refresh-keys
  pamac install libreoffice-fresh teamviewer fd $REPS
  sudo pacman -Syu

# Installing TeamViewer, MegaSync, NordVPN Snap, dnf packages and system updates 

elif command -v dnf > /dev/null 2>&1; then
  wget https://mega.nz/linux/repo/Fedora_43/x86_64/megasync-Fedora_43.x86_64.rpm
  sudo dnf install "$PWD/megasync-Fedora_43.x86_64.rpm" -y
  rm megasync-Fedora_43.x86_64.rpm
  sudo dnf install fd-find glibc-devel cairo-devel libX11-devel xorg-x11-proto-devel lv2-devel $REPS -y
  sudo dnf update -y
  
# Installing TeamViewer, apt packages and system updates

elif command -v apt > /dev/null 2>&1; then
  sudo apt install nala -y
  sudo nala install fd-find $REPS -y
  sudo apt update && sudo apt upgrade -y
fi

echo "Proccess finished successfully!"
