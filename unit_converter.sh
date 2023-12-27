#!/usr/bin/env bash

file_name="definitions.txt"
echo "Welcome to the Simple converter!"

print_menu() {
    echo "Select an option"
    echo "0. Type '0' or 'quit' to end program"
    echo "1. Convert units"
    echo "2. Add a definition"
    echo "3. Delete a definition"
}

process_user_choice() {

	read user_choice
	
	case $user_choice in
	
		0 | "quit")	
			echo "Goodbye!"
			exit 0
			;;
		1)
			echo "Not implemented!"
			;;
		2)
			add_definition
			;;
		3)
			remove_definition
			;;
		*) 
			echo "Invalid option!"
			;;
	esac
}

remove_definition(){
	if [ ! -e "$file_name" ]; then
        echo "Please add a definition first!"
        return
    fi
	
	line_count=$(wc -l < "$file_name")
	if [ "$line_count" -eq 0 ]; then
		echo "Please add a definition first!"
		return
	fi
	
	echo "Type the line number to delete or '0' to return"
	read_lines_with_numbers
	
	while [ true ]; do
		read line_number
		if [ -z "$line_number" ] || [ "$line_count" -lt "$line_number" ] || [ "$line_number" -lt 0 ]; then 
			echo "Enter a valid line number!"
			continue
		elif [ "$line_number" -eq 0 ]; then
			return
		else 
			sed -i "${line_number}d" "$file_name"
			break
		fi
	done
}

read_lines_with_numbers(){
	line_number=1

	while read -r line; do
		echo "$line_number. $line"
		((line_number++))
	done < "$file_name"
}

add_definition(){
	
	while [ true ]; do
		echo "Enter a definition:"
		read -a user_input

		arr_length="${#user_input[@]}"
		definition="${user_input[0]}"
		constant="${user_input[1]}"

		regex='^[a-zA-Z]+_to_[a-zA-Z]+$'

		if [ "$arr_length" -ne 2 ]; then
			echo "The definition is incorrect!"
			continue
		elif ! [[ $definition =~ $regex ]]; then
			echo "The definition is incorrect!"
			continue
		elif ! [[ $constant =~ ^-?[0-9]+$ || $constant =~ ^-?[0-9]+[.][0-9]+$ ]]; then
			echo "The definition is incorrect!"
			continue
		fi
		
		echo "${user_input[0]} ${user_input[1]}" >> "$file_name"
		break
	done
}

convert(){
	echo "Enter a value to convert:"

	condition=true

	while [ "$condition" == true ]; do
		
		read value_to_convert
		
		if ! [[ $value_to_convert =~ ^-?[0-9]+$ || $value_to_convert =~ ^-?[0-9]+[.][0-9]+$ ]]; then
			echo "Enter a float or integer value!"
		else
			condition=false
		fi
	done
	
	result=$(echo "scale=2; $constant * $value_to_convert" | bc -l)
	printf "Result: %s\n" "$result"
}

while [ true ]; do
	print_menu
	process_user_choice
done


