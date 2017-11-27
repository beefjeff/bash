#!/bin/bash
# Author: Ethan Brace
### common aliases ###

alias s='sudo'
alias n='nano'
alias sn='sudo nano'
alias mysql='mysql -p'
alias ls='clear; ls -la --color'
alias cl='clear'
alias aa='add-alias'

### composer ###

alias comre='composer require'

### git aliases ###

alias nah='git reset --hard;git clean -df;'
alias gs='git status'
alias gi='git init'
alias gc='git commit -m'
alias gaa='git add .'

### laravel ###

alias lara-setup='cp .env.example .env; php artisan key:generate'
alias tinker='php artisan tinker'

### phpstorm ###

alias pstorm-help='composer require --dev barryvdh/laravel-ide-helper;composer require doctrine/dbal --dev;php artisan ide-helper:generate; php artisan ide-helper:meta;'



### added from terminal with add-alias() ###
alias python='python3'
alias d-ethan.braceyourself='cd ~/Code/ethan.braceyourself.solutions'
alias d-leagueasy='cd ~/Code/leagueasy.braceyourself.solutions'
alias phpunit='clear && vendor/bin/phpunit'
alias sv='sudo vim'
alias sag='sudo apt-get'
alias aliases='n ~/.bash_aliases'
alias clear-vim-swap='rm ~/.vim/swap/**'
alias art='php artisan'
alias lara-remigrate='php artisan migrate:refresh && php artisan db:seed'
alias q='exit'
alias lara-keygen='php artisan key:generate'
alias ping='ping -c 3'
alias suweb='sudo -u www-data'
alias arti='php artisan'
alias watch='npm run watch'
alias mb-info='sudo dmidecode -t 2'
alias copy-envoy='cp ~/Envoy.blade.php ./'
alias deploy='envoy run deploy'
alias lara-push-to-production='npm run production; git push; envoy run deploy; npm run dev;'
alias lara-log-watch='tail -f storage/logs/laravel.log'
alias d-windows.braceyourself='cd ~/Code/windows.braceyourself.solutions'
alias extip='echo $EXTIP'
