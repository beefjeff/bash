#!/bin/sh

echo yes | add-apt-repository ppa:certbot/certbot
echo yes |  apt install python-certbot-nginx

