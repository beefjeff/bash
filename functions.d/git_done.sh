. ./prompt.sh

git_done(){

	if [ -z $1 ]; then prompt "Commit Message[blank to ammend]:" COMMIT_MESSAGE;  fi

		if [ -z $COMMIT_MESSAGE ];then
			git commit --amend -a
		else

		git commit -m "$COMMIT_MESSAGE" -a

	fi
	echo 'added everything and committed'; echo;


	res=$(git push 2>&1);

	if [[ $? -ne 0 ]]; then
		echo
		echo $res
		echo

		echo 'looks like push failed'
		ask=1

		while ($($ask)); do

			prompt 'asking:' test

			if [ $test == 'y' ];then ask=0; fi

		done

		prompt 'use -f?' yn

		if [ echo "$yn" | grep -iq "^y" ];then
			res=$(git push -f 2>&1)

			if [[ $? -ne 0 ]]; then
				echo
				echo $res
				echo
				echo 'still failing.. something is wrong..'; return 1;
			fi

			echo 'great.  worked that time.'; return 0;
		fi

	fi


	if [[ $? -eq 0 ]];then
		echo 'pushed to origin'; echo;
	fi

}

alias done='git-done'
