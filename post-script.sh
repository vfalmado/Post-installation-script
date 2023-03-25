#!/bin/bash
set -e

# Setting variables

REPS="btop exa ncdu duf bat tldr thefuck gparted ripgrep okular"
FLATPAKS="com.play0ad.zeroad -y
io.github.Foldex.AdwSteamGtk -y
io.github.prateekmedia.appimagepool -y
com.bitwarden.desktop -y
com.usebottles.bottles -y
com.gitlab.davem.ClamTk -y
org.gnome.DejaDup -y
com.discordapp.Discord -y
org.mozilla.firefox -y
org.flameshot.Flameshot -y
com.github.tchx84.Flatseal -y
org.gimp.GIMP -y
org.gnome.Boxes -y
org.godotengine.Godot -y
org.hedgewars.Hedgewars -y
com.heroicgameslauncher.hgl -y
net.cozic.joplin_desktop -y
org.kde.kdenlive -y
io.lmms.LMMS -y
net.lutris.Lutris -y
ch.theologeek.Manuskript -y
org.musescore.MuseScore -y
com.obsproject.Studio -y
org.openttd.OpenTTD -y
org.prismlauncher.PrismLauncher -y
org.libretro.RetroArch -y
net.scribus.Scribus -y
dev.alextren.Spot -y
com.spotify.Client -y
com.valvesoftware.Steam -y
flathub dev.storyapps.starc -y
org.telegram.desktop -y
org.kde.tellico -y
org.mozilla.Thunderbird -y
com.todoist.Todoist -y
com.transmissionbt.Transmission -y
org.tuxemon.Tuxemon -y
com.rtosta.zapzap -y"
SNAPS="authy multipass"


# Identifying the package manager, updating, and enabling snaps

if command -v apt > /dev/null 2>&1; then
  sudo apt update && sudo apt upgrade -y
  sudo rm /etc/apt/preferences.d/nosnap.pref
  sudo apt update
  sudo apt install snapd -y

elif command -v dnf > /dev/null 2>&1; then
  sudo dnf update -y
  sudo dnf install snapd akmod-nvidia -y

elif command -v pacman > /dev/null 2>&1; then
  sudo pacman -Syu
  sudo pacman -S flatpak snapd
fi

# Enabling Snaps

sudo systemctl enable --now snapd.socket

# Adding flathub, installing flatpak packages, and updating ClamTK and flatpaks

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub $FLATPAKS
flatpak update -y
sudo freshclam

# Installing Snaps

sudo snap install $SNAPS

# Downloading PhotoGIMP, Syncthing, Bedrock Linux and Mendeley

wget https://github.com/Diolinux/PhotoGIMP/releases/download/1.1/PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip
unzip PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip
mv PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak/.local ~
mv PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak/.var ~
wget https://github.com/syncthing/syncthing/releases/download/v1.23.1/syncthing-linux-amd64-v1.23.1.tar.gz
tar -xzf syncthing-linux-amd64-v1.23.1.tar.gz
wget https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.28/bedrock-linux-0.7.28-x86_64.sh
chmod +x bedrock-linux-0.7.28-x86_64.sh
sudo sh bedrock-linux-0.7.28-x86_64.sh --hijack
wget https://static.mendeley.com/bin/desktop/mendeley-reference-manager-2.75.0-x86_64.AppImage

# Updating Manjaro/Arch system keys, installing Mega, pamac packages, and system updates

if command -v pacman > /dev/null 2>&1; then
  sudo pacman -Sy archlinux-keyring manjaro-keyring
  sudo pacman-key --populate archlinux manjaro
  sudo pacman-key --refresh-keys
  wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-x86_64.pkg.tar.zst
  sudo pacman -U megasync-x86_64.pkg.tar.zst
  pamac install libreoffice-fresh teamviewer fd $REPS
  sudo pacman -Syu

# Installing Mega, TeamViewer, dnf packages and system updates 

elif command -v dnf > /dev/null 2>&1; then
  wget https://mega.nz/linux/repo/Fedora_37/x86_64/megasync-Fedora_37.x86_64.rpm
  sudo dnf install megasync-Fedora_37.x86_64.rpm
  wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
  sudo dnf install teamviewer.x86_64.rpm
  rm megasync-Fedora_37.x86_64.rpm teamviewer.x86_64.rpm
  sudo dnf install fd-find $REPS
  sudo dnf update
  
# Installing Mega, TeamViewer, apt packages and system updates

elif command -v apt > /dev/null 2>&1; then
  wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb
  sudo apt install megasync-xUbuntu_22.04_amd64.deb
  wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
  sudo apt install teamviewer_amd64.deb
  rm megasync-xUbuntu_22.04_amd64.deb teamviewer_amd64.deb
  sudo apt install nala
  sudo nala install fd-find $REPS
  sudo apt update && sudo apt upgrade -y

echo Proccess finished successfully!