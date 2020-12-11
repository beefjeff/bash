composer(){
    if test -f "./vendor/bin/sail"; then
        sail composer $@
    else
        /usr/bin/compser $@
    fi
}
