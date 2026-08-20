#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
pacman -Syyuu --noconfirm archlinux-keyring cachyos-keyring
grep -v '^#' ./boxkit.packages | xargs pacman -Sy --noconfirm 
