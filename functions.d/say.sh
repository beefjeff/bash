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
				;;
			b)
				BG_COLOR="BG_$OPTARG"
				BG_COLOR=$(echo $BG_COLOR | awk '{print toupper($0)}')
				BG_COLOR=$(eval "echo \${${BG_COLOR}}m");
				let optcount=optcount+2
				;;
			d)
				DECORATION="DEC_$OPTARG"
				DECORATION=$(echo $DECORATION | awk '{print toupper($0)}')
				DECORATION=$(eval "echo \${${DECORATION}}m");
				let optcount=optcount+2
				;;
			\?)
				echo "Invalid option: -$OPTARG" >&2
				let optcount=optcount+1
				;;
			:)
				echo "Option -$OPTARG requires an argument." >&2
				let optcount=optcount+1
				;;
		esac
	done
	
	# remove the options and their args
	for (( i = 0; i < $optcount; i++ )); do
		shift
	done


	# set text equal to everything after the options and their args
	for arg in $@
	do
		if [ -z $text ];then
			text=$arg;
		else
			text="$text $arg";
		fi
	done
	

	if [ -z $COLOR ];then
		output="\e[39m"
	else
		output="\e[$COLOR"
	fi

	if [ -z $BG_COLOR ];then
		output="$output\e[49m"
	else
		output="$output\e[$BG_COLOR"
	fi

	# if $bold; then
		# echo "its bold"
	# fi


	# echo -e "$style$text"
	/bin/echo -e "$output$text"
	unset output text COLOR BG_COLOR DECORATION bold dim underlined flashing reversed hidden
}
