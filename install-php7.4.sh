#!/bin/bash
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

sudo apt install \
    php7.4 \
    php7.4-bcmath \
    php7.4-cli \
    php7.4-common \
    php7.4-curl \
    php7.4-fpm \
    php7.4-gd \
    php7.4-json \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-opcache \
    php7.4-readline \
    php7.4-sqlite3 \
    php7.4-xml \
    php7.4-xsl \
    php7.4-zip
