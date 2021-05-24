studio(){

    if test -f "./dev"; then
        ./dev studio $@
    elif test -f "./vendor/bin/sail"; then
        ./vendor/bin/sail studio $@
    fi


}
