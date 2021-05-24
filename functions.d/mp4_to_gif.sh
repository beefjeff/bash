#!/bin/bash

function mp4_to_gif(){
	ffmpeg -i $1 -r 15 -vf scale=512:-1 $1".gif";
}
