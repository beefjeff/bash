remove-alias(){
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

	. ~/.bash_includes
}

add-alias(){
	if [[ -z $1 ]] || [[ -z $2 ]]; then
		echo 'missing arguments';
		echo 'Usage: add-alias <alias_name> <command>';
		return
	fi
	echo "alias $1='$2'" >> ~/bash/aliases.sh;
	. ~/.bash_incldues;
}
