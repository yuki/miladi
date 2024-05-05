#!/bin/bash

locale-gen

systemctl set-default graphical.target

## install YAY
#pacman-key --init

#pacman -S --noconfirm  --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
#pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

#yay -S --needed 