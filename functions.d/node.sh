node(){
    if test -f "./vendor/bin/sail"; then
        sail node $@
    else
        /usr/bin/node $@
    fi


}
