#!/bin/bash
# autoexit on error
set -e
# set umask
eval $(cat rootdir/etc/profile.d/umask.sh)

#Prompt for password
sudo echo "Enter password"

# Repos and ppas
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:n-muench/burg

# Update and upgrage
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Install packages
sudo apt-get -y install konsole mc git gparted openssh-server \
    silversearcher-ag thunderbird grub-customizer kdiff3 keepass2 wine checkinstall \
    gnome-calculator audacity audacious htop hardinfo pinta conky libpam-google-authenticator \
    transmission goldendict gufw leafpad virtualbox virtualbox-qt

# Install dev
sudo apt-get -y install python-dev python3-dev mono-complete fsharp golang-go\
    build-essential cmake exfat-utils exfat-fuse dkms linux-headers-generic dconf-tools ctags \
    dh-autoreconf autotools-dev debhelper ffmpeg

#Install File Compression Libs
sudo apt-get -y install unace rar unrar zip unzip lzip lunzip xz-utils p7zip-full p7zip-rar sharutils uudeview mpack arj cabextract

#Clean-up System
sudo apt-get -y autoremove
sudo apt-get -y autoclean

#**********************************
#**********************************
echo "Installing Telegram"
sleep 2
cd /tmp
wget https://tdesktop.com/linux
tar -xzvf telegram*
sudo mv Telegram /opt
sudo ln -sf /opt/Telegram/Telegram /usr/bin/telegram

echo "Installing Google Chrome"
sleep 2
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome* || sudo apt-get -fy install

echo "Installing Screenfetch"
sleep 2
cd /usr/local/bin
wget -O screenfetch 'https://raw.github.com/KittyKatt/screenFetch/master/screenfetch-dev'
chmod +x screenfetch

echo "Installing Teamviewer"
sleep 2
cd /tmp
wget http://download.teamviewer.com/download/teamviewer_i386.deb
sudo dpkg -i teamviewer* || sudo apt-get -fy install

echo "Installing node and typescript"
sleep 2
cd /tmp
sudo curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
npm install -g typescript

echo "Installing dotfiles"
sleep 2
cp -r rootdir/* /
echo 'auth required pam_google_authenticator.so' | cat - /etc/pam.d/sshd > temp && sudo mv temp /etc/pam.d/sshd

echo "Configuring Vim"
sleep 2

# Remove old vim and install custom-built
sudo apt-get -y remove vim*
yes | sudo dpkg -i vim_20160830-1_amd64.deb

yes | git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/vimproc.vim && make

# Build YouCompleteMe
cd /tmp
wget http://llvm.org/releases/3.8.1/clang+llvm-3.8.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz
cd ~ && mkdir ycm_temp && cd ycm_temp
tar -C . -xvf /tmp/clang*.tar.xz
mv -v clang* llvm_root_dir
cd ~ && mkdir ycm_build && cd ycm_build
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/ycm_temp/llvm_root_dir . ~/.vim/bundle/youcompleteme/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release
#cd ~/.vim/bundle/youcompleteme/third_party/ycmd/third_party/OmniSharpServer
#xbuild
cd ~/.vim/bundle/youcompleteme/third_party/ycmd/third_party/gocode
go build
cd ~/.vim/bundle/youcompleteme/third_party/ycmd/third_party/tern_runtime
npm install --production

echo "Setting up folders"
sleep 2
rm -rf ~/Public
rm -rf ~/Templates
mkdir ~/Dev
mkdir ~/Wallpapers

echo "Setting up settings"
sleep 2
gsettings set org.cinnamon.desktop.background.slideshow image-source 'xml:///usr/share/cinnamon-background-properties/linuxmint-sarah.xml'
gsettings set org.cinnamon.desktop.background.slideshow random-order true
gsettings set org.cinnamon.desktop.background.slideshow slideshow-enabled true
gsettings set org.cinnamon.desktop.default-applications.terminal exec 'konsole'
gsettings set org.cinnamon.desktop.interface clock-show-date true
gsettings set org.cinnamon.desktop.interface clock-show-seconds false
gsettings set org.cinnamon.desktop.interface clock-use-24h true
gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y'
gsettings set org.cinnamon.desktop.keybindings.media-keys calculator "['XF86Calculator', '<Super>F12']"
gsettings set org.cinnamon.desktop.keybindings.media-keys terminal "['<Primary><Alt>t', '<Primary>grave']"
gsettings set org.cinnamon.desktop.keybindings.media-keys volume-down "['XF86AudioLowerVolume', '<Alt><Super>Down']"
gsettings set org.cinnamon.desktop.keybindings.media-keys volume-up "['XF86AudioRaiseVolume', '<Alt><Super>Up']"
gsettings set org.cinnamon.desktop.keybindings.media-keys screenshot "['Print']"
gsettings set org.cinnamon.desktop.keybindings.media-keys screenshot-clip "['<Primary><Shift>Print']"
gsettings set org.cinnamon.desktop.keybindings.media-keys area-screenshot "['<Shift>Print']"
gsettings set org.cinnamon.desktop.keybindings.media-keys area-screenshot-clip "['<Primary>Print']"
gsettings set org.cinnamon.desktop.keybindings.media-keys screensaver "['XF86ScreenSaver']"
gsettings set org.cinnamon.desktop.notifications display-notifications true
gsettings set org.cinnamon.desktop.notifications fade-on-mouseover true
gsettings set org.cinnamon.desktop.notifications fade-opacity 40
gsettings set org.cinnamon.desktop.notifications remove-old true
gsettings set org.cinnamon.desktop.wm.preferences theme 'Mint-Y'
gsettings set org.cinnamon.desktop.interface font-name 'Arimo 9'
gsettings set org.nemo.desktop font 'Arimo 10'
gsettings set org.nemo.desktop home-icon-visible false
gsettings set org.nemo.desktop trash-icon-visible true
gsettings set org.nemo.window-state geometry '800x550+550+241'
gsettings set org.gnome.desktop.interface document-font-name 'Arimo 10'
gsettings set org.gnome.desktop.interface monospace-font-name 'Cousine 10'
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font 'Tinos Bold 14'
gsettings set org.cinnamon.settings-daemon.peripherals.keyboard numlock-state 'on'
gsettings set org.cinnamon.settings-daemon.peripherals.mouse middle-button-enabled false
gsettings set org.cinnamon.settings-daemon.peripherals.mouse motion-acceleration 1.0
gsettings set org.cinnamon.settings-daemon.peripherals.mouse motion-threshold 8
gsettings set org.gnome.libgnomekbd.desktop default-group 0
gsettings set org.gnome.libgnomekbd.desktop group-per-window true
gsettings set org.gnome.libgnomekbd.keyboard layouts "['us', 'ru\ttypewriter']"
gsettings set org.gnome.libgnomekbd.keyboard options "['caps\tcaps:ctrl_modifier', 'grp\tgrp:win_space_toggle']"
gsettings set org.gnome.mutter attach-modal-dialogs false
gsettings set org.gnome.mutter auto-maximize true
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.mutter draggable-border-width 10
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.mutter edge-tiling false
gsettings set org.gnome.mutter focus-change-on-pointer-rest false
gsettings set org.gnome.mutter no-tab-popup false
gsettings set org.gnome.mutter overlay-key 'Super_L'
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Primary><Super>Left', '<Super>Left']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Primary><Super>Right', '<Super>Right']"
gsettings set org.gnome.settings-daemon.plugins.xsettings active true
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'
gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order 'rgb'

dconf write /org/cinnamon/desktop/keybindings/custom-list "['custom0']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/name 'Screen off'
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/command '${HOME}/bin/screenoff'
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/binding "['<Super>l']"

echo "Final steps. Require user action"
echo "Installing Dropbox"
sleep 2
sudo apt-get install dropbox python-gpgme
dropbox start -i

echo "Configure Google-Authenticator"
google-authenticator

#Check if inside virtual environment
cat /proc/cpuinfo | grep hypervisor
if [ $? != 0 ]; then
    echo "Install BURG"
    sudo apt-get install burg burg-themes
    sudo update-burg

    echo "Ubuntu restricted extras"
    sleep 2
    sudo apt-get install -y ubuntu-restricted-extras
    sudo apt-get dist-upgrade
fi
reboot
