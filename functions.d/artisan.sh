artisan(){
    if test -f "./artisan"; then
        ./artisan $@
    elif test -f "./application"; then
        ./application $@
    fi


}
