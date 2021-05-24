statamic(){

    if [ $# -gt 0 ]; then
        PWD=$(pwd)

        echo "working in $PWD"
        echo "args: $@"

        docker-compose -f ~/bash/docker/statamic/docker-compose.yml run --rm \
            -v $(pwd):/app \
            statamic "$@"

        return;
    fi

    docker-compose -f ~/bash/docker/statamic/docker-compose.yml run --rm statamic
}
