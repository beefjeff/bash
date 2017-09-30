remove-alias(){
	if [[ -z $1 ]]; then
		echo 'missing argument';
		echo 'Usage: remove-alias(ra) <alias-name>';
		return;
	fi

	ALIAS=$(grep $1 ~/.bash_aliases);
	if [[ ${#ALIAS} -eq 0 ]]; then
		echo "'$1' alias not found"; return;
	fi

	echo "deleting '$1' alias";

	sed -i "/alias $1/d" ~/.bash_aliases;

	. ~/.bash_aliases
}

add-alias(){
	if [[ -z $1 ]] || [[ -z $2 ]]; then
		echo 'missing arguments';
		echo 'Usage: add-alias <alias_name> <command>';
		return
	fi
	echo "alias $1='$2'" >> ~/.bash_aliases;
	. ~/.bash_aliases;
}
