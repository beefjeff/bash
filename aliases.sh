
### common aliases ###

alias s='sudo'
alias n='nano'
alias sn='sudo nano'
alias mysql='mysql -p'
alias ls='clear; ls -la --color'
alias cl='clear'
alias aliases='n ~/.bash_aliases'
alias aa='add-alias'
alias ra='remove-alias'
alias rebash='gnome-terminal; exit;'

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
alias part='php artisan'

### phpstorm ###

alias pstorm-help='composer require --dev barryvdh/laravel-ide-helper;composer require doctrine/dbal --dev;php artisan ide-helper:generate; php artisan ide-helper:meta;'



### added from terminal with add-alias() ###
alias art='part'
