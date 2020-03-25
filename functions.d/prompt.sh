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
