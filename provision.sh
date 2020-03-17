#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

ACCOUNT="serra"

# dropbox
pacman -Sy --needed --noconfirm htop \
                                ripgrep \
                                fzf \
                                neovim \
                                xorg \
                                xorg-xinit \
                                i3-wm \
                                dmenu \
                                alacritty \
                                ttf-dejavu \
                                bash-completion \
                                i3status \
                                firefox-developer-edition \
                                firefox-developer-edition-i18n-de \
                                dex \
                                jre-openjdk \
                                pass \
                                khard \
                                fish

pacman -S --noconfirm hugo
ln -s /usr/share/applications/dropbox.desktop /etc/xdg/autostart/dropbox.desktop

sed -i '/de_DE.UTF-8/s/^#//g' /etc/locale.gen
locale-gen
localectl set-locale de_DE.UTF-8
localectl set-keymap de
localectl set-x11-keymap de
timedatectl set-timezone Europe/Berlin

useradd --create-home --shell /bin/fish "${ACCOUNT}"
cd /vagrant/user && find . -type f -exec install -v -D -o "${ACCOUNT}" -g "${ACCOUNT}" "{}" "/home/${ACCOUNT}/{}" \;
find /home/${ACCOUNT}/.ssh/ -type f -exec chmod 600 "{}" \;
find /home/${ACCOUNT}/.ssh/ -type f -name \*.pub -exec chmod 644 "{}" \;
chown ${ACCOUNT}: /home/${ACCOUNT}/.ssh
chmod 700 /home/${ACCOUNT}/.ssh

systemctl --user --global enable urxvtd.service
#TODO WTF: works when _I_ execute it. Vagrant gives me: "error: clould not locate package 'exit'" ??!?!?
#pacinstall --debug --noconfirm --remove virtualbox-guest-utils-nox --install virtualbox-guest-utils
#The solution below works but is ugly because the package swap is not executed in a single transaction
pacman --noconfirm -Rs virtualbox-guest-utils-nox; pacman --noconfirm -S virtualbox-guest-utils

