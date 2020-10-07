#!/bin/bash

echo "Installing node version $1"
curl -sL https://deb.nodesource.com/setup_$1.x | sudo -E bash -
sudo apt-get install -y nodejs
