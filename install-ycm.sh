#!/bin/bash
echo "installing YouCompleteMe system tools..."
	sudo apt install build-essential cmake vim python3-dev

echo ""
echo "Installing mono-complete"
    sudo apt install gnupg ca-certificates
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
    sudo apt update

echo ""
echo "Downloading go"
    curl -O https://storage.googleapis.com/golang/go1.12.9.linux-amd64.tar.gz
    sha256sum go1.12.9.linux-amd64.tar.gz
    tar -xvf go1.12.9.linux-amd64.tar.gz

echo ""
echo "Installing go"
    sudo chown -R root:root ./go
    sudo rm -rf /usr/local/go
    sudo mv go /usr/local
    source .go-exports


#echo ""
#echo "Installing node/npm"

echo ""
echo "Installing YouCompleteMe"
	python3 ~/.vim/bundle/youcompleteme/install.py --all
