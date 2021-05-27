laravel(){

    docker-compose -f ~/bash/docker/laravel/docker-compose.yml \
        run --rm \
        -w "/app" \
        -v "$(pwd):/app" \
        laravel laravel "$@"


}
