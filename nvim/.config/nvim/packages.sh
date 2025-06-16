#!/bin/sh

PACKAGES=(
  neovim
  bash-language-server
  ccls
  lua-language-server
  pyright
  texlab
)

PACKAGES_AUR=(
  nvim-packer-git
  markdown-oxide-git
)

# Check if the script is running as root id -u -> 0, when running as root -ne
if [ "$(id -u)" -ne 0 ]; then
  echo "This script needs to be executed as root!"
  exit 1
fi

# Update the package database
echo "Updating package database..."
pacman -Sy --noconfirm || {
  echo "Failed to update package database!"
  exit 1
}

# Install packages
echo "Installing packages from official repos: ${PACKAGES[@]}..."
pacman -S --noconfirm --needed "${PACKAGES[@]}" || {
  echo "Failed to install some packages!"
  # continue with next package instead of exiting
  exit 1
}

# Install packages
echo "Installing packages from AUR: ${PACKAGES_AUR[@]}..."
paru -S --aur --noconfirm --needed "${PACKAGES_AUR[@]}" || {
  echo "Failed to install some packages!"
  # continue with next package instead of exiting
  exit 1
}

echo "Installation complete!"
