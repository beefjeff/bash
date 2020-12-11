npm(){
    if test -f "./vendor/bin/sail"; then
        sail npm $@
    else
        /usr/bin/npm $@
    fi


}
