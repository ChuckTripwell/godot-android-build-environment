#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
apk update && apk upgrade
grep -v '^#' ./boxkit.packages | xargs apk add

echo "cd /home/$USER/.var/app/io.github.MakovWait.Godots/data/godot/app_userdata/Godots/versions/" >> /etc/profile
