#!/bin/bash
# Author: Ethan Brace
### common aliases ###

alias s='sudo'
alias ls='clear; ll -a --color --group-directories-first --time-style=+"%Y-%m-%d %H:%M:%S"'
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
alias sv='sudo vim'
alias sag='sudo apt-get'
alias aliases='n ~/.bash_aliases'
alias clear-vim-swap='rm ~/.vim/swap/**'
alias lara-remigrate='php artisan migrate:refresh && php artisan db:seed'
alias q='exit'
alias lara-keygen='php artisan key:generate'
alias ping='ping -c 3'
alias suweb='sudo -u www-data'
alias mb-info='sudo dmidecode -t 2'
alias copy-envoy='cp ~/Envoy.blade.php ./'
alias envoy='~/.composer/vendor/bin/envoy'
alias push='git push; ~/.composer/vendor/bin/envoy run push'
alias lara-push-to-production='npm run production; git push; envoy run deploy; npm run dev;'
alias lara-log-watch='tail -f storage/logs/laravel.log'
alias extip='echo $EXTIP'
alias cmd='/mnt/c/Windows/System32/cmd.exe /c'
alias psh='/mnt/c/Windows/System32/cmd.exe /c powershell -command "$@"'
alias v-component='php artisan vueg:component'
alias serve='php artisan serve'
alias art='php artisan'
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
alias dfimage='docker run -v /var/run/docker.sock:/var/run/docker.sock --rm chenzj/dfimage'
alias dockerup='docker-compose up -d'
alias dockerdown='docker-compose down'
alias dc='docker-compose'
alias gamend='git commit --amend'
alias ipa='ip a'
alias ipconfig='ip a'
alias captive-portal-login="xdg-open http://$(ip route get 8.8.8.8 | awk '{print $3}')"
