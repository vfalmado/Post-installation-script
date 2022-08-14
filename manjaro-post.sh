#!/bin/bash

# Script de pós instalação para Manjaro

# System update

sudo pacman -Syu

# Installing Snap packages

sudo snap install authy multipass

# Installing flatpak packages

flatpak install flathub com.spotify.Client -y
flatpak install flathub net.cozic.joplin_desktop -y
flatpak install flathub com.elsevier.MendeleyDesktop -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub org.kde.tellico -y
flatpak install flathub org.kde.kdenlive -y
flatpak install flathub org.kde.akregator -y
flatpak install flathub com.gitlab.davem.ClamTk -y
sudo freshclam

# Downloading PhotoGIMP

wget https://github.com/Diolinux/PhotoGIMP/releases/download/1.1/PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip

# Updating system keys

# sudo pacman -Sy archlinux-keyring manjaro-keyring
# sudo pacman-key --populate archlinux manjaro
# sudo pacman-key --refresh-keys

# Installing Pamac packages

pamac install telegram-desktop libreoffice-fresh lutris firefox-developer-edition gparted teamviewer

# Updating system keys

# sudo pacman -Sy archlinux-keyring manjaro-keyring
# sudo pacman-key --populate archlinux manjaro
# sudo pacman-key --refresh-keys

#System update

sudo pacman -Syu

echo Pós-instalação finalizada com sucesso!
