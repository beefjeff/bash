#!/bin/sh

cd $HOME/bash;


git fetch


if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]; then

	echo "updating local braceyourself/bash"
	git pull

fi

cd $HOME
