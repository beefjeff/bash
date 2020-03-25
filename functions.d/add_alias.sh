add_alias(){
	prompt 'What would you like to call the alias?' ALIAS_NAME	

	SEARCH_FOR_MATCHING=$(grep "alias $ALIAS_NAME='*'" $FILE_ALIASES);
	if [[ ${#SEARCH_FOR_MATCHING}  -gt 0 ]];then
		prompt 'This alias already exists. Would you like to change it? [y/n] ' yn;

		if echo "$yn" | grep -iq "^y" ;then
			change-alias $ALIAS_NAME
		fi

		return;


	fi

	prompt 'Enter the command:' ALIAS_BODY

	prompt 'Is this private? [y/n] (wont be tracked w/git)' PRIVATE_ALIAS

	if echo "$PRIVATE_ALIAS" | grep  -iq "^y" ;then
		echo "adding to $PRIVATE_ALIASES"
		echo "alias $ALIAS_NAME='$ALIAS_BODY'" >> $PRIVATE_ALIASES;


	else

		echo "adding to $FILE_ALIASES"
		echo "alias $ALIAS_NAME='$ALIAS_BODY'" >> $FILE_ALIASES;
	fi




	echo "Alias added. Sourcing files..."
	reload
}
