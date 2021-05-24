composer(){

    if test -f "./dev"; then
        ./dev composer $@
    elif test -f "./dock"; then
        ./dock exec composer $@
    elif test -f "./vendor/bin/sail"; then
        ./vendor/bin/sail composer $@
    else
        docker-compose \
            -f ~/bash/docker/composer/docker-compose.yml \
            run --rm \
            composer composer "$@"
    fi


}
