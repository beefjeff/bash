#!/bin/bash

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt update

sudo apt install -y php8.0 php8.0-dev php8.0-bcmath php8.0-cli php8.0-common php8.0-curl php8.0-fpm php8.0-gd php8.0-mbstring php8.0-mysql php8.0-opcache php8.0-readline php8.0-sqlite3 php8.0-xml php8.0-xsl php8.0-zip


sudo apt upgrade

sudo pecl -d php_suffix=8.0 install oci8

php --version
