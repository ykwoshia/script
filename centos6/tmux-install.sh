#!/bin/bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

# ncurses need install first: sudo yum install ncurses
# tmux need libevent version > 2.0, so need manual install

TMUX_VERSION=2.6
LIBEVENT_VERSION=2.1.8

# create our directories
mkdir -p $HOME/local $HOME/tmux_tmp
cd $HOME/tmux_tmp

# download source files for tmux, libevent and ncureses
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}-stable/libevent-${LIBEVENT_VERSION}-stable.tar.gz

# extract files, configure, and compile

######################
# libevent 
######################
tar xvzf libevent-${LIBEVENT_VERSION}-stable.tar.gz
cd libevent-${LIBEVENT_VERSION}-stable
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..



######################
# tmux 
######################
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I$HOME/local/include" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include"
CPPFLAGS="-I$HOME/local/include" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/lib"  make
cp tmux $HOME/local/bin
cd ..

# clean up
rm -rf $HOME/tmux_tmp

echo "$HOME/local/bin/tmux is now available. You can optionally add $HOME/local/bin to your PATH."

