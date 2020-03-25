#!/bin/bash
source "$(dirname $0)/functions.sh"

filetype=jpg
DIR=$(pwd)

prompt "Would you like to set the image resoolution of all the $filetype files in this directory($DIR)? [y/n]" CONFIRM
echo $CONFIRM

if [[ $CONFIRM != Y && $CONFIRM != y ]];then
	echo "Ok. Cancelled"; exit 0;
fi

prompt "what should the resolution be?" RES
prompt "Enter the folder where the new files should be stored:" SAVE_DIR

mkdir -p ./$SAVE_DIR;

for file in ./*.$filetype; do
	
	echo "[$file]" Setting resolution to $RES;
	convert -units PixelsPerInch "$file" -resample $RES "$SAVE_DIR/$file"
	echo "[$file]" Done. Saved;


done
