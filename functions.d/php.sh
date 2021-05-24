php(){

    if test -f "./vendor/bin/sail"; then
        ./vendor/bin/sail php $@
    else
        docker run -it --rm php php $@
    fi

}
