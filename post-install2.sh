#!/bin/bash
# autoexit on error
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Prompt for password
sudo echo "Starting..."
sleep 2

echo "Setting up folders"
sleep 2
rm -rf ~/Public
rm -rf ~/Templates
mkdir ~/Dev
mkdir -p ~/Dev/go/src/github.com/smaugfm
mkdir ~/Wallpapers
mkdir -p ~/Downloads/Torrents/torrents

echo "Installing Telegram"
sleep 2
cd /tmp
wget -O telegram.tar.xz https://tdesktop.com/linux
tar -xvf telegram.tar.xz
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
sudo wget -O screenfetch 'https://raw.github.com/KittyKatt/screenFetch/master/screenfetch-dev'
sudo chmod +x screenfetch

echo "Installing Teamviewer"
sleep 2
cd /tmp
wget http://download.teamviewer.com/download/teamviewer_i386.deb
sudo dpkg -i teamviewer* || sudo apt-get -fy install

echo "Installing node"
sleep 2
cd /tmp
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
. ~/.bashrc
. ~/.nvm/nvm.sh
nvm install node
npm install -g typescript ember-cli electron-prebuilt typescript-formatter js-beautify jshint bower
ln -s $NVM_BIN/node /usr/bin/node

echo "Installing dotfiles"
sleep 2
cd $DIR
shopt -s dotglob
sudo cp -r rootdir/* /
cp -r homedir/* ~
shopt -u dotglob
echo 'auth required pam_google_authenticator.so' | cat - /etc/pam.d/sshd > temp && sudo mv temp /etc/pam.d/sshd

echo "Configuring Vim"
sleep 2

# Remove old vim
sudo apt-get -y remove vim vim-runtime vim-tiny vim-common vim-gui-common gvim

# Build vim from sources
cd /tmp
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-python3interp \
            --enable-gui=auto \
            --enable-cscope
make
sudo checkinstall
sudo ln -s /usr/local/bin/vim /usr/bin/vim
vim +PlugInstall +qall
cd $DIR
yes | cp lucius.vim ~/.vim/plugins/lightline.vim/autoload/lightline/colorscheme

pip install jedi
go get -u github.com/nsf/gocode
sudo ln -s $GOPATH/bin/gocode /usr/bin/gocode
npm install tern

echo "Update alternatives"
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/terminix 1
sudo update-alternatives --set x-terminal-emulator /usr/bin/terminix

echo "Setting up settings"
sleep 2
gsettings set org.cinnamon.desktop.background.slideshow image-source 'xml:///usr/share/cinnamon-background-properties/linuxmint-sarah.xml'
gsettings set org.cinnamon.desktop.background.slideshow random-order true
gsettings set org.cinnamon.desktop.background.slideshow slideshow-enabled true
gsettings set org.cinnamon.desktop.default-applications.terminal exec 'terminix --maximize'
gsettings set org.cinnamon.desktop.interface clock-show-date true
gsettings set org.cinnamon.desktop.interface clock-show-seconds false
gsettings set org.cinnamon.desktop.interface clock-use-24h true
gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y'
gsettings set org.cinnamon.desktop.keybindings.media-keys calculator "['XF86Calculator', '<Super>F12']"
gsettings set org.cinnamon.desktop.keybindings.media-keys terminal "['<Primary>grave']"
gsettings set org.cinnamon.desktop.keybindings.media-keys volume-down "['XF86AudioLowerVolume', '<Alt><Super>Down']"
gsettings set org.cinnamon.desktop.keybindings.media-keys volume-up "['XF86AudioRaiseVolume', '<Alt><Super>Up']"
gsettings set org.cinnamon.desktop.keybindings.media-keys screenshot "['Print']"
gsettings set org.cinnamon.desktop.keybindings.media-keys screenshot-clip "[]"
gsettings set org.cinnamon.desktop.keybindings.media-keys area-screenshot "['<Primary>Print']"
gsettings set org.cinnamon.desktop.keybindings.media-keys area-screenshot-clip "[]"
gsettings set org.cinnamon.desktop.keybindings.media-keys window-screenshot "['<Primary><Shift>Print']"
gsettings set org.cinnamon.desktop.keybindings.media-keys window-screenshot-clip "[]"
gsettings set org.cinnamon.desktop.keybindings.media-keys screensaver "['<Super>l']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-left "[]"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-right "[]"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-down "['<Shift><Alt>F1']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-up "['<Alt>F1']"
gsettings set org.cinnamon.desktop.notifications display-notifications true
gsettings set org.cinnamon.desktop.notifications fade-on-mouseover true
gsettings set org.cinnamon.desktop.notifications fade-opacity 40
gsettings set org.cinnamon.desktop.notifications remove-old true
gsettings set org.cinnamon.desktop.wm.preferences theme 'Mint-Y'
gsettings set org.cinnamon.desktop.interface font-name 'Arimo 9'
gsettings set org.nemo.desktop font 'Arimo 10'
gsettings set org.nemo.desktop home-icon-visible false
gsettings set org.nemo.desktop trash-icon-visible false
gsettings set org.nemo.desktop computer-icon-visible false
gsettings set org.nemo.window-state geometry '800x550+550+241'
gsettings set org.gnome.desktop.interface document-font-name 'Arimo 10'
gsettings set org.gnome.desktop.interface monospace-font-name 'Cousine 10'
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font 'Tinos Bold 14'
gsettings set org.cinnamon.settings-daemon.peripherals.keyboard numlock-state 'on'
gsettings set org.cinnamon.settings-daemon.peripherals.mouse middle-button-enabled false
gsettings set org.cinnamon.settings-daemon.peripherals.mouse motion-acceleration 1.0
gsettings set org.cinnamon.settings-daemon.peripherals.mouse motion-threshold 8
gsettings set org.cinnamon.desktop.interface.keyboard-layout-show-flags false
gsettings set org.cinnamon.desktop.interface.keyboard-layout-prefer-variant-names true
gsettings set org.gnome.libgnomekbd.desktop default-group 0
gsettings set org.gnome.libgnomekbd.desktop group-per-window true
gsettings set org.gnome.libgnomekbd.keyboard layouts "['us', 'ru\ttypewriter']"
gsettings set org.gnome.libgnomekbd.keyboard options "['caps\tcaps:ctrl_modifier', 'grp\tgrp:win_space_toggle']"
gsettings set org.gnome.settings-daemon.plugins.xsettings active true
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'
gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order 'rgb'
gsettings set org.cinnamon.desktop.keybindings.wm toggle-recording "[]"

dconf write /org/workrave/gui/main-window/enabled "false"

# terminix
dconf write /com/gexperts/Terminix/profiles/list "['2b7c4080-0ddd-46c5-8f23-563fd3ba789d']"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/foreground-color "'#A1B0B8'"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/visible-name "'smaugfm'"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/dim-color-set "false"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/login-shell "true"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/palette "['#252525252525', '#D3D32F2F2F2F', '#0000C8C85353', '#FFFF6D6D0000', '#0000B0B0FFFF', '#FFFF40408080', '#0000ACACC1C1', '#FAFAFAFAFAFA', '#708284', '#FF5252', '#6666BBBB6A6A', '#FFC135', '#42A5F5', '#D81B60', '#00ACC1', '#F5F5F5']"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/default-size-columns "190"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/default-size-rows "55"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/scroll-on-output "false"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/cursor-colors-set "false"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/highlight-colors-set "false"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/use-system-font "false"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/exit-action "'hold'"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/terminal-bell "'icon'"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/font "'LiterationMonoPowerline Nerd Font 12'"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/use-custom-command "false"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/allow-bold "false"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/use-theme-colors "false"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/background-color "'#263238'"
dconf write /com/gexperts/Terminix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/background-transparency-percent "0"
dconf write /com/gexperts/Terminix/keybindings/session-switch-to-next-terminal "'<Primary><Alt>n'"
dconf write /com/gexperts/Terminix/keybindings/session-close "'<Primary><Shift>q'"
dconf write /com/gexperts/Terminix/keybindings/session-resize-terminal-left "'<Primary><Alt>Left'"
dconf write /com/gexperts/Terminix/keybindings/session-switch-to-terminal-down "'<Primary><Alt>j'"
dconf write /com/gexperts/Terminix/keybindings/terminal-find "'<Primary><Shift>f'"
dconf write /com/gexperts/Terminix/keybindings/session-resize-terminal-up "'<Primary><Alt>Up'"
dconf write /com/gexperts/Terminix/keybindings/session-resize-terminal-down "'<Primary><Alt>Down'"
dconf write /com/gexperts/Terminix/keybindings/win-view-session-switcher "'disabled'"
dconf write /com/gexperts/Terminix/keybindings/win-switch-to-previous-session "'disabled'"
dconf write /com/gexperts/Terminix/keybindings/win-switch-to-next-session "'disabled'"
dconf write /com/gexperts/Terminix/keybindings/session-switch-to-terminal-right "'<Primary><Alt>l'"
dconf write /com/gexperts/Terminix/keybindings/terminal-maximize "'<Primary><Alt>x'"
dconf write /com/gexperts/Terminix/keybindings/app-shortcuts "'<Primary>Page_Up'"
dconf write /com/gexperts/Terminix/keybindings/terminal-find-next "'<Primary><Shift>g'"
dconf write /com/gexperts/Terminix/keybindings/session-switch-to-terminal-up "'<Primary><Alt>k'"
dconf write /com/gexperts/Terminix/keybindings/terminal-close "'<Primary><Alt>q'"
dconf write /com/gexperts/Terminix/keybindings/session-resize-terminal-right "'<Primary><Alt>Right'"
dconf write /com/gexperts/Terminix/keybindings/session-switch-to-previous-terminal "'<Primary><Alt>p'"
dconf write /com/gexperts/Terminix/keybindings/app-preferences "'disabled'"
dconf write /com/gexperts/Terminix/keybindings/session-switch-to-terminal-left "'<Primary><Alt>h'"
dconf write /com/gexperts/Terminix/keybindings/win-view-sidebar "'disabled'"
dconf write /com/gexperts/Terminix/sidebar-on-right "false"
dconf write /com/gexperts/Terminix/terminal-title-style "'none'"
dconf write /com/gexperts/Terminix/theme-variant "'system'"
dconf write /com/gexperts/Terminix/enable-wide-handle "false"
dconf write /com/gexperts/Terminix/prompt-on-new-session "false"
dconf write /com/gexperts/Terminix/warn-vte-config-issue "false"
dconf write /com/gexperts/Terminix/focus-follow-mouse "false"
dconf write /com/gexperts/Terminix/unsafe-paste-alert "false"

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
