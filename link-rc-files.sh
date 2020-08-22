#!/bin/bash
rc_files=(vim ideavim zsh)

remove(){
	rm $1
}

link(){
	ln -s -f $1 $2
}


for f in "${rc_files[@]}"; do 
	fileSplit=(${f//-/ })

	fileName="$HOME/bash/"${fileSplit[0]}"rc"
	symlinkName=`[[ -z ${fileSplit[1]+x} ]] && 
		echo "$HOME/."${fileSplit[0]}"rc" || 
		echo "$HOME/."${fileSplit[1]}"rc"`

	echo "$symlinkName"

	

	echo "linking $fileName -> $symlinkName"
	link $fileName $symlinkName


done
