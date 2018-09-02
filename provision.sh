#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

pacman -Sy --needed --noconfirm htop \
                                vim \
                                xorg \
                                xorg-xinit \
                                i3-wm \
                                dmenu \
                                i3status-rust-git \
                                rxvt-unicode \
                                ttf-dejavu \
                                bash-completion
sed -i '/de_DE.UTF-8/s/^#//g' /etc/locale.gen
locale-gen
localectl set-locale de_DE.UTF-8
localectl set-keymap de
localectl set-x11-keymap de
timedatectl set-timezone Europe/Berlin

useradd --create-home --shell /bin/bash serra
systemctl --user --global enable urxvtd.service
#TODO WTF: works when _I_ execute it. Vagrant gives me: "error: clould not locate package 'exit'" ??!?!?
#pacinstall --debug --noconfirm --remove virtualbox-guest-utils-nox --install virtualbox-guest-utils
#The solution below works but is ugly because the package swap is not executed in a single transaction
pacman --noconfirm -Rs virtualbox-guest-utils-nox; pacman --noconfirm -S virtualbox-guest-utils