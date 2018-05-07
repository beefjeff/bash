#!/bin/bash
# Author: Ethan Brace


FILE_ALIASES=~/bash/aliases.sh
test(){
		echo 'test'
}

say() {
	optcount=0
	style=''
	usage(){
		echo 'usage...'	
	}
	while getopts ':c:b:Bdufrh' opt; do
		case $opt in
			B)
				style="$style\e[$(eval "echo \${${DEC_BOLD}}m")"
				let optcount=optcount+1
				;;
			d)
				dim=1
				let optcount=optcount+1
				;;
			u)
				underlined=1
				let optcount=optcount+1
				;;
			f)
				flashing=1
				let optcount=optcount+1
				;;
			r)
				reversed=1
				let optcount=optcount+1
				;;
			h)
				hidden=1
				let optcount=optcount+1
				;;
			c)
				COLOR=$(echo $OPTARG | awk '{print toupper($0)}')
				COLOR=$(eval "echo \${${COLOR}}m");
				let optcount=optcount+2
