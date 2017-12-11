sudo yum install -y ruby ruby-devel lua lua-devel luajit \
    luajit-devel ctags git python python-devel \
    python3 python3-devel python34-devel tcl-devel \
    perl perl-devel perl-ExtUtils-ParseXS \
    perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
    perl-ExtUtils-Embed
sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp
cd ~
#git clone https://github.com/vim/vim
cd vim
./configure --enable-luainterp --enable-perlinterp --enable-pythoninterp --enable-python3interp --with-python-config-dir=/usr/lib64/python2.7/config --with-python3-config-dir=/usr/lib64/python3.4/config-3.4m --enable-rubyinterp --enable-multibyte --disable-gui --with-features=huge
make
sudo make install
