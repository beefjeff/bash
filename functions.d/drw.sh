drw(){

	cd /mnt/c/users/ethan/Code/drwindows;
	restart_horizon="r"
	restart_server="r"
	restart_watcher="r"

	sudo /etc/init.d/screen-cleanup start

	if screen -list | grep -q "horizon"; then

		prompt "Horizon already running. [r]estart [k]ill [enter]ignore" restart_horizon

		if [[ $restart_horizon == "r" ]] || [[ $restart_horizon == "k" ]]; then
			echo "Killing Horizon"
			screen -S horizon -X quit
		fi


	fi	

	if screen -list | grep -q "server"; then

		prompt "Server already running. [r]estart [k]ill [enter]ignore" restart_server

		if [[ $restart_server == "r" ]] || [[ $restart_server == "k" ]]; then
			echo "Killing Active Server"
			screen -S server -X quit
		fi


	fi	

	if screen -list | grep -q "watcher"; then

		prompt "Watcher already running. [r]estart [k]ill [enter]ignore" restart_watcher

		if [[ $restart_watcher == "r" ]] || [[ $restart_watcher == "k" ]]; then

			echo "Killing Active Watcher"
			screen -S watcher -X quit

		fi

	fi	




	# restart the screens if we need to
	if ! screen -list | grep -q "horizon"; then

		if [[ $restart_horizon != "k" ]]; then

			echo "Starting Horizon"
			screen -dmS horizon
			screen -S horizon -X stuff 'cd /mnt/c/users/ethan/Code/drwindows; php artisan horizon\n'

		fi

	fi	

	if ! screen -list | grep -q "server"; then

		if [[ $restart_server != "k" ]]; then
			echo "Starting Server"
			screen -dmS server
			screen -S server -X stuff 'cd /mnt/c/users/ethan/Code/drwindows; serve\n'
		fi

	fi	

	if ! screen -list | grep -q "watcher"; then

		if [[ $restart_watcher != "k" ]]; then
			echo "Starting Watcher"
			screen -dmS watcher
			screen -S watcher  -X stuff 'cd /mnt/c/users/ethan/Code/drwindows; npm run watch\n'
		fi

	fi	


}
