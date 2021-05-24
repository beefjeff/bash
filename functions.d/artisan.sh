artisan(){

    if test -f "./dev"; then
        ./dev artisan $@
    elif test -f "./vendor/bin/sail"; then
        ./vendor/bin/sail  artisan $@
    elif test -f "./artisan"; then

        docker-compose -f ~/bash/docker/php8.0/docker-compose.yml \
            run --rm \
            -v "$(pwd)/:/tmp" \
            php ./artisan $@

    elif test -f "./application"; then
        ./application $@
    fi


}
