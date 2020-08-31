#!/bin/bash

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y exfat-utils fuse-exfat
sudo dnf copr enable dawid/better_fonts
sudo dnf copr enable zawertun/kde
sudo dnf update --refresh -y
sudo dnf install -y fontconfig-enhanced-defaults fontconfig-font-replacements libva libva-utils ffmpeg intel-media-driver alsa-tools patch git
wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/materia-kde/master/install.sh | sh
wget -qO- https://git.io/papirus-folders-install | sh


