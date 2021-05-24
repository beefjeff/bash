dep(){

    docker-compose -f ~/bash/docker/php8.0/docker-compose.yml \
        run --rm \
        -v "$(pwd)/:/tmp" \
        -w "/tmp" \
        php vendor/bin/dep $@


}
