artisan(){

    if test -f "./vendor/bin/sail"; then
        sail artisan $@
    elif test -f "./artisan"; then
        ./artisan $@
    elif test -f "./application"; then
        ./application $@
    fi


}
