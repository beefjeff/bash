#!/bin/bash
# Author: Ethan Brace


FILE_ALIASES=~/bash/aliases.sh


. ~/bash/helpers.sh


remov-alias(){
	if [[ -z $1 ]]; then
		echo 'missing argument';
		echo 'Usage: remove-alias(ra) <alias-name>';
		return;
	fi


	ALIAS=$(grep $1 ~/bash/aliases.sh);
	if [[ ${#ALIAS} -eq 0 ]]; then
		echo "'$1' alias not found"; return;
	fi

	echo "deleting '$1' alias";

	sed -i "/alias $1/d" ~/bash/aliases.sh;

	. ~/bash/.bash_includes
}
alias ra='remove-alias';



add-alias(){
	ALIAS_NAME=$1;
	ALIAS_BODY=$2; if [[ -z $1 ]] || [[ -z $2 ]]; then echo 'missing arguments'; echo 'Usage: add-alias <alias_name> <command>';
		return
	fi


	echo "alias $1='$2'" >> ~/bash/aliases.sh;

	. ~/bash/.bash_includes;
}
alias aa='add-alias';



change-alias(){
	if [[ $1 ]]; then
		#statements
		ALIAS_NAME=$1
	else
		read 'ALIAS_NAME?Which alias?: ' 
	fi
	old_name=$ALIAS_NAME;
	# check that the alias exists
	ALIAS=$(grep -n "alias $ALIAS_NAME='*'" ~/bash/aliases.sh);
	if [[ ${#ALIAS} -eq 0 ]]; then
		echo "$ALIAS_NAME not found";
		return;
	fi


	#get body of alias from $ALIAS
	ALIAS_BODY=$(echo $ALIAS | cut -d "'" -f 2)
	old_body=$ALIAS_BODY

	# get user input for new alias 
	# and keep current if input is blank
	read "INPUT?New Name[$ALIAS_NAME]: "; if [[ ${#INPUT} -gt 0 ]]; then ALIAS_NAME=$INPUT; fi
	read "INPUT?New Command[$ALIAS_BODY]: "; if [[ ${#INPUT} -gt 0 ]]; then ALIAS_BODY=$INPUT; fi
	
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



	. ~/bash/.bash_includes;
	# show the alias as is	
	grep -n "alias $ALIAS_NAME='*'" $FILE_ALIASES 
	

} 
alias ca='change-alias'; 


