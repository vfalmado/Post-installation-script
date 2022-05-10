#!/bin/bash

#Script de pós instalação para Manjaro

# System update

sudo pacman -Syu -s

# Installing Snap packages

sudo snap install superproductivity
sudo snap install authy

# Installing flatpak packages

flatpak install flathub com.spotify.Client -y
flatpak install flathub net.cozic.joplin_desktop -y
flatpak install flathub com.elsevier.MendeleyDesktop -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub org.kde.tellico -y
flatpak install flathub org.chromium.Chromium -y
flatpak install flathub org.kde.kdenlive -y
flatpak install flathub org.kde.akregator -y

# Updating system keys

sudo pacman -Sy archlinux-keyring manjaro-keyring -s
sudo pacman-key --populate archlinux manjaro
sudo pacman-key --refresh-keys

# Installing Pamac packages

pamac install telegram-desktop -s
pamac install Libreoffice-fresh -s
pamac install lutris -s

# Updating system keys

sudo pacman -Sy archlinux-keyring manjaro-keyring -s
sudo pacman-key --populate archlinux manjaro
sudo pacman-key --refresh-keys

#System update

sudo pacman -Syu -s

echo Pós-instalação finalizada com sucesso!
