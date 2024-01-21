#!/bin/bash
sudo pacman -Syu

if command -v git &>/dev/null; then
  echo "Git v$(git -v | awk '{print $3}') is already installed in your system"
else
  sudo pacman -S git base-devel -y
fi

if command -v paru &>/dev/null; then
  echo "Paru $(paru -V | awk '{print $2}') is already installed in your system"
else
  if command -v yay &>/dev/null; then
    echo "Yay $(yay -V | awk '{print $2}') is installed in your system"
  else
    echo "Neither Paru nor Yay is present in your system."
    echo "Installing Paru..."
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd ..
  fi
fi

# Installing Essential Programs
yay -S hyprland waybar rofi dunst kitty swaybg swaylock swayidle pamixer pavucontrol light brillo ttf-font-awesome ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-bitstream-vera ttf-carlito ttf-croscore ttf-dejavu ttf-droid ttf-ibm-plex ttf-iosevka-nerd ttf-liberation ttf-meslo-nerd ttf-ms-fonts ttf-opensans noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra flatpak wl-clipboard grimblast librewolf-bin brave-bin epiphany blueman openvpn networkmanager-openvpn papirus-icon-theme firefox jetbrains-toolbox vim vi neovim git zsh storageexplorer gnome-keyring dbeaver zoom filezilla transmission-gtk putty postman-bin evince loupe visual-studio-code-bin figma-linux-bin spotify telegram-desktop nautilus bluez bluez-utils cava --noconfirm

mkdir -p ~/.config
mkdir -p ~/.local
mkdir -p ~/.local/share

# Move config files
cp -R config/* ~/.config/
cp -R local/* ~/.local/
sudo cp -R sddm/themes/* /usr/share/sddm/themes/

# Update fonts cache
fc-cache -vf