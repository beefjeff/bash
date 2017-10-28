#!/bin/bash
# Author: Ethan Brace


FILE_ALIASES=~/bash/aliases.sh




remove-alias(){
	if [[ -z $1 ]]; then
		echo 'missing argument';
		echo 'Usage: remove-alias(ra) <alias-name>';
		return;
	fi


	ALIAS=$(grep "alias $1='*'" $FILE_ALIASES);
	if [[ ${#ALIAS} -eq 0 ]]; then
		echo "'$1' alias not found"; return;
	fi

	echo "deleting '$1' alias";

	sed -i "/alias $1/d" ~/bash/aliases.sh;

	reload
}
alias rma='remove-alias';



add-alias(){
	if [[ $1 ]]; then
		ALIAS_NAME=$1
	else
		if (($(in-zsh))); then
			read 'ALIAS_NAME?What would you like to call it?: ';
		else
			read 'What would you like to call it?: 'ALIAS_NAME;
		fi
	fi

	SEARCH=$(grep "alias $ALIAS_NAME='*'" $FILE_ALIASES);
	if [[ ${#SEARCH}  -gt 0 ]];then
		echo "This alias already exists. try 'change-alias(ca)' ";
		return;

	fi


	if (($(in-zsh))); then
		read 'ALIAS_BODY?Enter the command: ';
	else
		read 'Enter the command: ' ALIAS_BODY;
	fi


	echo "alias $1='$2'" >> ~/bash/aliases.sh;
	reload
}


alias aa='add-alias';



change-alias(){
	if [[ $1 ]]; then
		ALIAS_NAME=$1
	else
		if (($(in-zsh))); then
			read 'ALIAS_NAME?Which alias?: '
		else
			read 'Which alias?: 'ALIAS_NAME
		fi
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
	if (($(in-zsh))); then
		read "INPUT_NAME?New Name: "; 		
		read "INPUT_COM?New Command: "; 
	else	
		read "New Name: " INPUT_NAME; 
		read "New Command: " INPUT_COM;
	fi
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
	echo ${#$(grep -n "alias $1='*'" $FILE_ALIASES)}
}

# return 1 if using zsh 0 if not
in-zsh(){
	out=$(ps  -ef | grep $$ | grep -v grep);
	if [[ $out == *"zsh"* ]]; then
		echo 1 
	elif [[ $out == *"bash"* ]];then
		echo 0
	fi
}

reload(){
	. ~/bash/.bash_includes;
}

prompt(){ # prompt-text variable-name
		if [[ -z $1 ]]
		if (($(in-zsh))); then
			read 'ALIAS_NAME?Which alias?: '
		else
			read 'Which alias?: 'ALIAS_NAME
		fi
}
