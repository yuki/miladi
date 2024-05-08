#!/bin/bash

locale-gen

systemctl set-default graphical.target

## install YAY
#pacman-key --init
#pacman-key --refresh-keys
#pacman-key --populate archlinux
#
#su -c 'yay -Sy --noconfirm calamares archiso-calamares-config visual-studio-code-bin ' liveuser