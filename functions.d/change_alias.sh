change_alias(){
	prompt 'Which alias?:' ALIAS_NAME


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
