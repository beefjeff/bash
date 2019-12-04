#!/bin/bash
# Author: Ethan Brace
### common aliases ###

alias s='sudo'
alias n='nano'
alias sn='sudo nano'
alias ls='clear; ll -a --color --group-directories-first'
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
alias d-ethan.braceyourself='cd /mnt/c/users/ethan/Code/ethan.braceyourself.solutions'
alias d-leagueasy='cd ~/Code/leagueasy.braceyourself.solutions'
alias d-drw='cd /mnt/c/users/ethan/Code/drwindows'
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
alias watch='npm run watch'
alias mb-info='sudo dmidecode -t 2'
alias copy-envoy='cp ~/Envoy.blade.php ./'
alias envoy='~/.composer/vendor/bin/envoy'
alias deploy='git push; ~/.composer/vendor/bin/envoy run deploy'
alias push='git push; ~/.composer/vendor/bin/envoy run push'
alias lara-push-to-production='npm run production; git push; envoy run deploy; npm run dev;'
alias lara-log-watch='tail -f storage/logs/laravel.log'
alias d-windows.braceyourself='cd /mnt/c/users/ethan/Code/windows.braceyourself.solutions'
alias extip='echo $EXTIP'
alias cmd='/mnt/c/Windows/System32/cmd.exe /c'
alias psh='/mnt/c/Windows/System32/cmd.exe /c powershell -command "$@"'
alias v-component='php artisan vueg:component'
alias npm='/usr/bin/npm'
alias serve='php artisan serve'

alias screens='screen -ls'

alias g--='git checkout --'


# Supervisor Helpers
alias superv-enable-horizon='sudo mv /etc/supervisord.d/horizon.ini.disabled /etc/supervisord.d/horizon.ini && sudo systemctl restart supervisord.service && sudo systemctl status supervisord.service'
alias superv-disable-horizon='sudo mv /etc/supervisord.d/horizon.ini /etc/supervisord.d/horizon.ini.disabled && sudo systemctl restart supervisord.service && sudo systemctl status supervisord.service'
alias superv-disable-queue-worker='sudo mv /etc/supervisord.d/worker-queue.ini /etc/supervisord.d/worker-queue.ini.disabled && sudo systemctl restart supervisord.service && sudo systemctl status supervisord.service'
alias superv-enable-queue-worker='sudo mv /etc/supervisord.d/worker-queue.ini.disabled /etc/supervisord.d/worker-queue.ini && sudo systemctl restart supervisord.service && sudo systemctl status supervisord.service'
alias :q='exit'
alias yum='sudo yum -y'
alias migrate='php artisan migrate'
alias rollback='php artisan migrate:rollback'
alias seed='php artisan db:seed'
