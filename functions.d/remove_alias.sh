remove_alias(){
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
