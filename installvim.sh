#!/bin/bash

sudo apt-get remove vim
git clone https://github.com/vim/vim.git ~/vim.git
cd ~/vim.git/src
sudo apt install ncurses-dev -y

./configure --enable-pythoninterp=yes --enable-python3interp=yes 
make
sudo make install

