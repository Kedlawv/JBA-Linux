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
			find_executables
			;;
		*) 
			echo "Invalid option!"
			;;
	esac
}

find_executables() {
	echo "Enter an executable name:"
	
	read exec_name
	
	path=$(which "$exec_name")
	
	if [ -z "$path" ]; then
		echo "The executable with that name does not exist!"
	else
		echo "Located in: $path"
		echo "Enter arguments:"
		read arguments
		"$path" "$arguments"
	fi
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


print_files_dir_menu() {
	echo "---------------------------------------------------"
	echo "| 0 Main menu | 'up' To parent | 'name' To select |"
	echo "---------------------------------------------------"
}

print_file_menu() {
	echo "---------------------------------------------------------------------"
	echo "| 0 Back | 1 Delete | 2 Rename | 3 Make writable | 4 Make read-only |"
	echo "---------------------------------------------------------------------"
}


process_user_choice_file_dir() {
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
		file_operations $user_choice
	else
		echo "Invalid input!"
	fi
}

file_operations() {
	
	while [ true ]; do
		print_file_menu
		process_user_choice_file $1
		
		if [ $? -eq 1 ]; then
            break  
        fi
		
	done
}

process_user_choice_file() {
	file_name=$1
	
	read user_choice
	
	case $user_choice in
	
		0)	
			return 1
			;;
		1)
			rm $file_name
			echo "$file_name has been deleted."
			return 1
			;;
		2)
			echo "Enter the new file name:"
			read new_file_name
			mv $file_name $new_file_name
			echo "$file_name has been renamed as $new_file_name"
			return 1
			;;
		3)
			chmod 666 $file_name
			echo "Permissions have been updated."
			ls -l $file_name
			return 1
			;;
		4)
			chmod 664 $file_name
			echo "Permissions have been updated."
			ls -l $file_name
			return 1
			;;
		*) 
			;;
	esac
}



file_and_dir_operations() {
	while [ true ]; do
		files_array=($(read_files))
		print_files "${files_array[@]}"
		print_files_dir_menu
		process_user_choice_file_dir "${files_array[@]}"
		
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


