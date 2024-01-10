#!/usr/bin/env bash


print_main_menu() {
    echo "------------------------------"
    echo "| Hyper Commander            |"
    echo "| 0: Exit                    |"
    echo "| 1: OS info                 |"
    echo "| 2: User info               |"
	echo "| 3: File and Dir operations |"
	echo "| 4: Find Executables        |"
	echo "------------------------------"
}


process_user_choice_main() {

	read user_choice
	
	case $user_choice in
	
		0)	
			echo "Farewell!"
			exit 0
			;;
		1)
			echo "$(uname) $(uname -n)"
			;;
		2)
			echo $(whoami)
			;;
		3)
			file_and_dir_operations
			;;
		4)
			echo "Not implemented!"
			;;
		*) 
			echo "Invalid option!"
			;;
	esac
}


print_files() {
	echo "The list of files and directories:"
	files_array=("$@")
	
	for item in "${files_array[@]}"; do
		if [[ -f "$item" ]]; then
			echo "F $item"
		elif [[ -d "$item" ]]; then
			echo "D $item"
		fi
	done
}


print_files_menu() {
	echo "---------------------------------------------------"
	echo "| 0 Main menu | 'up' To parent | 'name' To select |"
	echo "---------------------------------------------------"
}


process_user_choice_file() {
	read user_choice
	
	files_array=("$@")
	
	name_found=false
	for element in "${files_array[@]}"; do
		if [ "$user_choice" == "$element" ]; then
			name_found=true
			break
		fi
	done
	
	if [ "$user_choice" = "0" ]; then
		return 1
	elif [ "$user_choice" = "up" ]; then
		cd ..
	elif [ "$name_found" = "true" ] && [[ -d "$user_choice" ]]; then
		cd "$user_choice"
	elif [ "$name_found" = "true" ] && [[ -f "$user_choice" ]]; then
		echo "Not implemented!"
	else
		echo "Invalid input!"
	fi
}


file_and_dir_operations() {
	while [ true ]; do
		files_array=($(read_files))
		print_files "${files_array[@]}"
		print_files_menu
		process_user_choice_file "${files_array[@]}"
		
		if [ $? -eq 1 ]; then
            break  
        fi
		
	done
}


read_files() {
	local items=()
    
    for item in $(ls); do
        items+=("$item")
    done
    
    # Return the array, actual 'return' returns only exit status
    echo "${items[@]}"
}


echo "Hello $USER!"

while [ true ]; do
	print_main_menu
	process_user_choice_main
done


