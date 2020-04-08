# search aliases.sh for a name of an alias
# return 0 if not found
alias_exists(){
	
	if [ -z $1 ]; then prompt 'what alias are you looking for?' ALIAS_NAME; else  ALIAS_NAME=$1; fi

	echo ${#$(grep "alias $ALIAS_NAME='*'" $FILE_ALIASES)}

}
