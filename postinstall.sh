#!/bin/bash

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y exfat-utils fuse-exfat
sudo dnf copr enable dawid/better_fonts
dnf copr enable gloriouseggroll/kernel 
sudo dnf update --refresh -y
sudo dnf distro-sync
sudo dnf install -y fontconfig-enhanced-defaults fontconfig-font-replacements ffmpeg alsa-tools patch git wget htop gnome-tweaks evolution xrdp openssh
wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://git.io/papirus-folders-install | sh
systemctl enable xrdp sshd
