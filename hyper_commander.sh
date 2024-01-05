#!/usr/bin/env bash


print_menu() {
    echo "------------------------------"
    echo "| Hyper Commander            |"
    echo "| 0: Exit                    |"
    echo "| 1: OS info                 |"
    echo "| 2: User info               |"
	echo "| 3: File and Dir operations |"
	echo "| 4: Find Executables        |"
	echo "------------------------------"
}

process_user_choice() {

	read user_choice
	
	case $user_choice in
	
		0)	
			echo "Farewell!"
			exit 0
			;;
		1)
			echo $(uname)
			;;
		2)
			echo $(whoami)
			;;
		3)
			echo "Not implemented!"
			;;
		4)
			echo "Not implemented!"
			;;
		*) 
			echo "Invalid option!"
			;;
	esac
}

echo "Hello $USER!"

while [ true ]; do
	
	
	print_menu
	process_user_choice
done


