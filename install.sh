#!/bin/bash

set -e  # Exit on any error

echo "=== Sway Debian Rice Installer ==="
echo "This will install packages and copy configs. Run on a fresh Debian install."
echo

# Update system
sudo apt update && sudo apt upgrade -y

# Install core tools
sudo apt install -y curl wget git

# Install packages from list
echo "Installing packages from manual_packages.txt..."
xargs sudo apt install -y < manual_packages.txt

# Copy configs to ~/.config/
echo "Installing config files..."
mkdir -p ~/.config

mv config/fastfetch ~/.config/
mv config/foot ~/.config/
mv config/sway ~/.config/
mv config/waybar ~/.config/
mv config/wofi ~/.config/

# Copy .bashrc
mv home/.bashrc ~/

# Copy wallpapers
echo "Copying wallpapers..."
mkdir -p ~/Pictures
mv Wallpapers ~/Pictures

# Optional: Set a default wallpaper (using swaybg)
# You can change this later with feh, swaybg, or your preferred tool
# Example: mkdir -p ~/.config/sway && echo "output * bg ~/Wallpapers/wallpaper1.jpg fill" >> ~/.config/sway/config

# Fonts cache (in case you have custom fonts later)
fc-cache -fv

echo
echo "========================================="
echo "Installation complete!"
echo "Log out and select 'Sway' at the login screen."
echo "If Sway isn't available, you may need to reboot."
echo "Wallpapers are in ~/Wallpapers"
echo "Enjoy your rice! 🚀"
echo "========================================="