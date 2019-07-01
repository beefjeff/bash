#!/bin/sh
current_dir=$(pwd)

cd $HOME/bash;


git fetch


if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]; then

	echo "updating local braceyourself/bash"
	git pull

fi

cd $current_dir
