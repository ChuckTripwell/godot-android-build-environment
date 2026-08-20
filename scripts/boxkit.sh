#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
#apk update && apk upgrade
#grep -v '^#' ./boxkit.packages | xargs apk add

cd /
cp -r build_files/setup.sh /
chmod +x ./setup.sh
