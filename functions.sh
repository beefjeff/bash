#!/bin/bash
# Author: Ethan Brace


FILE_ALIASES=~/bash/aliases.sh


drw(){

	cd /mnt/c/users/ethan/Code/drwindows;
	restart_horizon="r"
	restart_server="r"
	restart_watcher="r"

	sudo /etc/init.d/screen-cleanup start

	if screen -list | grep -q "horizon"; then

		prompt "Horizon already running. [r]estart [k]ill [enter]ignore" restart_horizon

		if [[ $restart_horizon == "r" ]] || [[ $restart_horizon == "k" ]]; then
			echo "Killing Horizon"
			screen -S horizon -X quit
		fi


	fi	

	if screen -list | grep -q "server"; then

		prompt "Server already running. [r]estart [k]ill [enter]ignore" restart_server

		if [[ $restart_server == "r" ]] || [[ $restart_server == "k" ]]; then
			echo "Killing Active Server"
			screen -S server -X quit
		fi


	fi	

	if screen -list | grep -q "watcher"; then

		prompt "Watcher already running. [r]estart [k]ill [enter]ignore" restart_watcher

		if [[ $restart_watcher == "r" ]] || [[ $restart_watcher == "k" ]]; then

			echo "Killing Active Watcher"
			screen -S watcher -X quit

		fi

	fi	




	# restart the screens if we need to
	if ! screen -list | grep -q "horizon"; then

		if [[ $restart_horizon != "k" ]]; then

			echo "Starting Horizon"
			screen -dmS horizon
			screen -S horizon -X stuff 'cd /mnt/c/users/ethan/Code/drwindows; php artisan horizon\n'

		fi

	fi	

	if ! screen -list | grep -q "server"; then

		if [[ $restart_server != "k" ]]; then
			echo "Starting Server"
			screen -dmS server
			screen -S server -X stuff 'cd /mnt/c/users/ethan/Code/drwindows; serve\n'
		fi

	fi	

	if ! screen -list | grep -q "watcher"; then

		if [[ $restart_watcher != "k" ]]; then
			echo "Starting Watcher"
			screen -dmS watcher
			screen -S watcher  -X stuff 'cd /mnt/c/users/ethan/Code/drwindows; npm run watch\n'
		fi

	fi	


}

nova(){
	php artisan nova:$@
}

horizon(){
	php artisan horizon:$@
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

string_to_upper(){
	if [ -z $1 ];then
		echo 'string needed';
		return;
	elif [ -z $2 ];then
		echo 'variable needed';
		return;

	fi
	


}

remove-alias(){
	if [ -z $1 ]; then prompt 'What alias would you like to delete?:' ALIAS_NAME;	fi


	if ((!$(alias-exists $ALIAS_NAME))); then
		echo "'$ALIAS_NAME' not found"; 
		return;
	fi


	sed -i "/alias $ALIAS_NAME='*'/d" $FILE_ALIASES;

	unalias $ALIAS_NAME
	reload

	if ((!$(alias-exists $ALIAS_NAME))); then
		echo "$ALIAS_NAME deleted"; 
	fi
}
alias rma='remove-alias';



add-alias(){
	if [[ $1 ]]; then
		ALIAS_NAME=$1
	else
		prompt 'What would you like to call the alias?' ALIAS_NAME	
	fi

	SEARCH_FOR_MATCHING=$(grep "alias $ALIAS_NAME='*'" $FILE_ALIASES);
	if [[ ${#SEARCH_FOR_MATCHING}  -gt 0 ]];then
		prompt 'This alias already exists. Would you like to change it? [y/n] ' yn;

		if echo "$yn" | grep -iq "^y" ;then
			change-alias $ALIAS_NAME
		fi

		return;


	fi

	prompt 'Enter the command:' ALIAS_BODY

	echo "alias $ALIAS_NAME='$ALIAS_BODY'" >> $FILE_ALIASES;
	reload
}


alias aa='add-alias';



change-alias(){
	if [[ $1 ]]; then
		ALIAS_NAME=$1
	else
		prompt 'Which alias?:' ALIAS_NAME
	fi


	old_name=$ALIAS_NAME;
	# check that the alias exists
	ALIAS=$(grep -n "alias $ALIAS_NAME='*'" $FILE_ALIASES);
	if [[ ${#ALIAS} -eq 0 ]]; then
		echo "$ALIAS_NAME not found";
		return;
	fi


	#get body of alias from $ALIAS
	ALIAS_BODY=$(echo $ALIAS | cut -d "'" -f 2)
	old_body=$ALIAS_BODY

	# get user input for new alias 
	# and keep current if input is blank

	grep -n "alias $ALIAS_NAME='*'" $FILE_ALIASES
	prompt 'New Name[leave blank to keep the same]:' INPUT_NAME;
	prompt 'New Command:' INPUT_COM;

	if [[ ${#INPUT_NAME} -gt 0 ]]; then ALIAS_NAME=$INPUT_NAME; fi
	if [[ ${#INPUT_COM} -gt 0 ]]; then ALIAS_BODY=$INPUT_COM; fi

	
	# set up the new alias info
	INPUT_LINE="alias $ALIAS_NAME='$ALIAS_BODY'"

	# let the user know that they're removing an old alias
	if [[ $old_name != $ALIAS_NAME ]]; then
		echo "Replacing $old_name with $ALIAS_NAME";
	fi

	# replace old line with new line
	sed -i "s/alias $old_name='$old_body'/$INPUT_LINE/g" $FILE_ALIASES;
	# echo $INPUT_LINE >> $FILE_ALIASES;
	echo 'done';



	reload
	# show the alias as is	
	grep -n "alias $ALIAS_NAME='*'" $FILE_ALIASES 
	

}
alias ca='change-alias'; 

# search aliases.sh for a name of an alias
# return 0 if not found
alias-exists(){
	
	if [ -z $1 ]; then prompt 'what alias are you looking for?' ALIAS_NAME; else  ALIAS_NAME=$1; fi

	echo ${#$(grep "alias $ALIAS_NAME='*'" $FILE_ALIASES)}

}


reload(){
	. ~/bash/.bash_includes;
}




prompt(){ 
	# prompt-text variable-name
	# check bash type

	in-zsh(){
		out=$(ps  -ef | grep $$ | grep -v grep);
		if [[ $out == *"zsh"* ]]; then
			echo 1 
		elif [[ $out == *"bash"* ]];then
			echo 0
		fi
	}

	# show error if user misses an arg
	if [ $# -ne 2 ];then
		echo 'error using prompt - need a prompt and variable to store input';
		return;
	else
		declare -A input
		input[text]=$1
		input[var]=$2
	fi

	if (($(in-zsh))); then
		read "${input[var]}?${input[text]} ";
	else
		read -p "${input[text]} " ${input[var]};
	fi



}


# function git-done(){
	#
	# if [ -z $1 ]; then prompt "Commit Message[blank to ammend]:" COMMIT_MESSAGE;  fi
#
	# if [ -z $COMMIT_MESSAGE ];then
		# git commit --amend -a
	# else
#
		# git commit -m "$COMMIT_MESSAGE" -a
	# fi
	# echo 'added everything and committed'; echo;
		#
	# res=$(git push 2>&1);
	#
	# if [[ $? -ne 0 ]]; then
		# echo
		# echo $res
		# echo
#
		# echo 'looks like push failed'
		# ask=1
		# while (($($ask))); do
			# prompt 'asking:' test
			# if [ $test == 'y' ];then ask=0; fi
#
		# done
		# prompt 'use -f?' yn
		# if [ echo "$yn" | grep -iq "^y" ];then
			# res=$(git push -f 2>&1)
#
			# if [[ $? -ne 0 ]]; then
				# echo
				# echo $res
				# echo
				# echo 'still failing.. something is wrong..'; return 1;
			# fi
#
			# echo 'great.  worked that time.'; return 0;
		# fi
#
	# fi
#
	# if [[ $? -eq 0 ]];then
		# echo 'pushed to origin'; echo;
	# fi
# }
# alias done='git-done'


# yes_or_no(){
	# while true; do
		# prompt "[y/n]:" yn
#
		# case $yn in
			# [Yy]*) return 0  ;;
#
			# [Nn]*) echo "Aborted" ; return  1 ;;
		# esac
	# done
# }
