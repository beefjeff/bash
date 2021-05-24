node(){

    if [ $# -gt 0 ]; then
        PWD=$(pwd)

        echo "working in $PWD"
        echo "args: $@"

        docker-compose \
            -f ~/bash/docker/node/docker-compose.yml \
            run --rm \
            -w /tmp \
            -v $(pwd):/tmp \
            node "$@"

        return;
    fi

    docker-compose -f ~/bash/docker/node/docker-compose.yml run --rm node
}

npm(){
    node npm $@
}
