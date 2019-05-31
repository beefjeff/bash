#!/bin/bash
# Author: Ethan Brace
### common aliases ###
#export $(grep -v '^#' .env | xargs)

alias s='sudo'
alias n='nano'
alias sn='sudo nano'
alias mysql='mysql -u root'
alias ls='clear; ls -la --color --group-directories-first'
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
alias phpunit='clear && vendor/bin/phpunit'
alias sv='sudo vim'
alias sag='sudo apt-get'
alias aliases='vim ~/.bash_aliases'
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
alias envoy='~/.composer/vendor/bin/envoy'
alias deploy='gaa && gs && prompt "Commit Message: " message && gc $message && git push && ~/.composer/vendor/bin/envoy run deploy'
alias lara-push-to-production='npm run production; git push; envoy run deploy; npm run dev;'
alias lara-log-watch='tail -f storage/logs/laravel.log'
alias extip='echo $EXTIP'
alias cmd='/mnt/c/Windows/System32/cmd.exe /c'
alias psh='/mnt/c/Windows/System32/cmd.exe /c powershell -command "$@"'
alias d-cdc='cd $WSL_HOME/Code/cdc'
alias rsync='rsync --exclude-from "$WSL_HOME/rsync-exclude"'
alias d-braceyourself.solutions='cd $WSL_HOME/Code/braceyourself.solutions'
alias v-component='php artisan vueg:component'
alias npm='/usr/bin/npm'
alias serve='php artisan serve'

alias config='/usr/bin/git --git-dir=/var/git/.cfg.git --work-tree=$HOME'

alias g--='git checkout --'
alias popular-commands='awk \"{print $1 \" \" $2}\" ~/.zsh_history | sort | uniq -c | sort -nr | head -n 10'
