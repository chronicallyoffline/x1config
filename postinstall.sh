#!/bin/bash

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y exfat-utils fuse-exfat
sudo dnf copr enable dawid/better_fonts
sudo dnf update --refresh -y
sudo dnf distro-sync
sudo dnf install -y fontconfig-enhanced-defaults fontconfig-font-replacements ffmpeg tilix alsa-tools patch git wget htop gnome-tweaks thunderbird xrdp openssh
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl enable xrdp sshd
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code
sudo flatpak install flathub com.jetbrains.PyCharm-Community com.discordapp.Discord com.valvesoftware.Steam com.spotify.Client
