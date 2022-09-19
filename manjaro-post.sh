#!/bin/bash

# Script de pós instalação para Manjaro

# System update

sudo pacman -Syu

# Installing Snap packages

sudo snap install authy multipass

# Installing flatpak packages

flatpak install flathub com.play0ad.zeroad -y
flatpak install flathub org.kde.akregator -y
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub com.gitlab.davem.ClamTk -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.eduke32.EDuke32 -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.gnome.Boxes -y
# flatpak install flathub io.github.shiftey.Desktop -y
flatpak install flathub com.heroicgameslauncher.hgl -y
flatpak install flathub net.cozic.joplin_desktop -y
flatpak install flathub org.kde.kdenlive -y
flatpak install flathub net.lutris.Lutris -y
flatpak install flathub ch.theologeek.Manuskript -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub net.scribus.Scribus -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub org.kde.tellico -y
flatpak install flathub com.todoist.Todoist -y
flatpak install flathub org.tuxemon.Tuxemon -y
flatpak install flathub com.rtosta.zapzap -y
sudo freshclam

# Downloading PhotoGIMP and Mendeley

wget https://github.com/Diolinux/PhotoGIMP/releases/download/1.1/PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip
unzip PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak.zip
mv PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak/.local ~
mv PhotoGIMP.by.Diolinux.v2020.1.for.Flatpak/.var ~
wget https://static.mendeley.com/bin/desktop/mendeley-reference-manager-2.75.0-x86_64.AppImage

# Updating system keys

# sudo pacman -Sy archlinux-keyring manjaro-keyring
# sudo pacman-key --populate archlinux manjaro
# sudo pacman-key --refresh-keys

# Installing Pamac packages

pamac install firefox-developer-edition gparted libreoffice-fresh teamviewer telegram-desktop

# Updating system keys

# sudo pacman -Sy archlinux-keyring manjaro-keyring
# sudo pacman-key --populate archlinux manjaro
# sudo pacman-key --refresh-keys

#System update

sudo pacman -Syu

echo Pós-instalação finalizada com sucesso!
