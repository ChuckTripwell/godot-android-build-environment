#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "=== 1. Setting up Java 17 ==="
mkdir -p "$HOME/java"
# Downloading Eclipse Temurin Java 17
curl -L -o "$HOME/java/openjdk17.tar.gz" https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.11%2B9/OpenJDK17U-jdk_x64_linux_hotspot_17.0.11_9.tar.gz
tar -xzf "$HOME/java/openjdk17.tar.gz" -C "$HOME/java" --strip-components=1
rm "$HOME/java/openjdk17.tar.gz"

export JAVA_HOME="$HOME/java"
echo "Java installed at: $JAVA_HOME"

echo "=== 2. Setting up Android SDK Command-line Tools ==="
mkdir -p "$HOME/Android/Sdk/cmdline-tools"
curl -L -o "$HOME/Android/Sdk/cmdline-tools/cmdline-tools.zip" https://dl.google.com/android/repository/commandlinetools-linux-15859902_latest.zip
unzip -q "$HOME/Android/Sdk/cmdline-tools/cmdline-tools.zip" -d "$HOME/Android/Sdk/cmdline-tools/"
mv "$HOME/Android/Sdk/cmdline-tools/cmdline-tools" "$HOME/Android/Sdk/cmdline-tools/latest"
rm "$HOME/Android/Sdk/cmdline-tools/cmdline-tools.zip"

echo "=== 3. Accepting SDK Licenses & Installing Required Packages ==="
yes | "$HOME/Android/Sdk/cmdline-tools/latest/bin/sdkmanager" --sdk_root="$HOME/Android/Sdk" --licenses
"$HOME/Android/Sdk/cmdline-tools/latest/bin/sdkmanager" --sdk_root="$HOME/Android/Sdk" "platform-tools" "build-tools;34.0.0" "platforms;android-34"

echo "=== 4. Generating Debug Keystore ==="
"$HOME/java/bin/keytool" -genkey -v -keystore "$HOME/.android/debug.keystore" -alias androiddebugkey -keyalg RSA -keysize 2048 -validity 10000 -storepass android -keypass android -dname "CN=Android Debug, O=Android, C=US"

echo "=== Setup Complete! ==="
echo "Point Godot to the following paths in Editor Settings > Export > Android:"
echo " - Jdk Path: $HOME/java"
echo " - Android Sdk Path: $HOME/Android/Sdk"
echo " - Debug Keystore: $HOME/.android/debug.keystore"
