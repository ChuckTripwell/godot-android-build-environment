#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
#apk update && apk upgrade
#grep -v '^#' ./boxkit.packages | xargs apk add

cd / && wget -c --tries=0 --read-timeout=30 https://raw.githubusercontent.com/ChuckTripwell/godot-android-build-environment/refs/heads/main/build_files/setup..sh
chmod +x ./setup.sh
