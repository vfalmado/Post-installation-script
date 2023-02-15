#!/bin/bash

# Identifying the package manager, updating, and enabling snaps

if command -v apt > /dev/null 2>&1; then
  sudo apt update && sudo apt upgrade -y
  sudo rm /etc/apt/preferences.d/nosnap.pref
  sudo apt update
  sudo apt install snapd -y

elif command -v dnf > /dev/null 2>&1; then
  sudo dnf update -y
  sudo dnf install snapd

elif command -v pacman > /dev/null 2>&1; then
  sudo pacman -Syu
  sudo pacman -S flatpak
  sudo pacman -S snapd
fi

# Installing Snap packages

sudo snap install authy multipass

# Adding flathub and installing flatpak packages

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.play0ad.zeroad -y
flatpak install flathub io.github.Foldex.AdwSteamGtk -y
flatpak install flathub io.github.prateekmedia.appimagepool -y
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub com.gitlab.davem.ClamTk -y
flatpak install flathub org.gnome.DejaDup -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.eduke32.EDuke32 -y
flatpak install flathub org.mozilla.firefox -y
flatpak install flathub org.flameshot.Flameshot -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.gnome.Boxes -y
# flatpak install flathub io.github.shiftey.Desktop -y
flatpak install flathub org.godotengine.Godot -y
flatpak install flathub org.hedgewars.Hedgewars -y
flatpak install flathub com.heroicgameslauncher.hgl -y
flatpak install flathub net.cozic.joplin_desktop -y
flatpak install flathub org.kde.kdenlive -y
flatpak install flathub io.lmms.LMMS -y
flatpak install flathub net.lutris.Lutris -y
flatpak install flathub ch.theologeek.Manuskript -y
flatpak install flathub org.musescore.MuseScore -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub org.openttd.OpenTTD -y
flatpak install flathub org.prismlauncher.PrismLauncher -y
flatpak install flathub org.libretro.RetroArch -y
flatpak install flathub net.scribus.Scribus -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub com.vscodium.codium -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub org.kde.tellico -y
flatpak install flathub org.mozilla.Thunderbird -y
flatpak install flathub com.todoist.Todoist -y
flatpak install flathub com.transmissionbt.Transmission -y
flatpak install flathub org.tuxemon.Tuxemon -y
flatpak install flathub com.rtosta.zapzap -y
sudo freshclam

# Downloading PhotoGIMP, Syncthing, Bedrock Linux and Mendeley

wget https://github.com/Diolinux/PhotoGIMP/releases/download/1.1/PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip
unzip PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip
mv PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak/.local ~
mv PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak/.var ~
wget https://github.com/syncthing/syncthing/releases/download/v1.23.1/syncthing-linux-amd64-v1.23.1.tar.gz
tar -xzf syncthing-linux-amd64-v1.23.1.tar.gz
wget https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.28/bedrock-linux-0.7.28-x86_64.sh
chmod +x bedrock-linux-0.7.28-x86_64.sh
sh bedrock-linux-0.7.28-x86_64.sh --hijack
wget https://static.mendeley.com/bin/desktop/mendeley-reference-manager-2.75.0-x86_64.AppImage

# Updating Manjaro/Arch system keys, installing pamac packages, and system updates

if command -v pacman > /dev/null 2>&1; then
  sudo pacman -Sy archlinux-keyring manjaro-keyring
  sudo pacman-key --populate archlinux manjaro
  sudo pacman-key --refresh-keys
  pamac install gparted libreoffice-fresh teamviewer btop exa ncdu fd-find duf rg bat
  sudo pacman -Syu

# Installing dnf packages and system updates 

elif command -v dnf > /dev/null 2>&1; then
  sudo dnf install btop exa ncdu fd duf rg bat
  sudo dnf update
  
elif command -v apt > /dev/null 2>&1; then
  sudo apt install btop exa ncdu fd duf rg bat
  sudo apt update && sudo apt upgrade -y

echo Pós-instalação finalizada com sucesso!