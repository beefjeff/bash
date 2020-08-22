#!/bin/bash

if [ ! -e ~/.vim/bundle/Vundle.vim ];then
	echo "Installing Vundle..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo ""
echo "Installing Plugins..."
vim +PluginInstall +qall

echo ""
echo "installing YouCompleteMe system tools..."
sudo apt install build-essential cmake vim python3-dev
wget -c https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
shasum -a 256 go1.7.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xvzf go1.7.3.linux-amd64.tar.gz

echo ""
echo "Installing YouCompleteMe"
python3 ~/.vim/bundle/youcompleteme/install.py --all
