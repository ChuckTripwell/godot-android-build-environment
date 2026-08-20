#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
pacman -Syyuu --noconfirm archlinux-keyring cachyos-keyring
grep -v '^#' ./boxkit.packages | xargs pacman -Sy --noconfirm 

echo "cd /home/$(awk -F: '$3==1000 {print $1}' /run/host/etc/passwd)/.var/app/io.github.MakovWait.Godots/data/godot/app_userdata/Godots/versions/" >> /etc/profile
