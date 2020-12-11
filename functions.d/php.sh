php(){

    if test -f "./vendor/bin/sail"; then
        sail php $@
    else
        php $@
    fi

}
