#!/bin/bash
# autoexit on error
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e

#Prompt for password
sudo echo "Starting..."
sleep 2

# Repos and ppas
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:n-muench/burg

# Update and upgrage
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Install packages
sudo apt-get -y install konsole mc git gparted openssh-server \
    silversearcher-ag thunderbird grub-customizer kdiff3 keepass2 checkinstall \
    gnome-calculator audacity audacious htop hardinfo pinta conky libpam-google-authenticator \
    transmission goldendict virtualbox virtualbox-qt

# Install dev
sudo apt-get -y install python-dev python3-dev mono-complete fsharp \
    build-essential cmake exfat-utils exfat-fuse dkms linux-headers-generic dconf-tools ctags \
    dh-autoreconf autotools-dev debhelper ffmpeg

# Install vim build dependecies
sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev

#Install File Compression Libs
sudo apt-get -y install unace rar unrar zip unzip lzip lunzip xz-utils p7zip-full p7zip-rar sharutils uudeview mpack arj cabextract

#Clean-up System
sudo apt-get -y autoremove
sudo apt-get -y autoclean

echo "Installing node"
sleep 2
cd /tmp
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash

read -n 1 -s -p "Close this terminal, open a new one, run post-install2.sh"
