#!/usr/bin/env bash

echo "Enter a definition:"
read -a user_input

arr_length="${#user_input[@]}"
definition="${user_input[0]}"
constant="${user_input[1]}"

regex='^[a-zA-Z]+_to_[a-zA-Z]+$'

if [ "$arr_length" -ne 2 ]; then
	echo "The definition is incorrect!"
    exit 1
elif ! [[ $definition =~ $regex ]]; then
	echo "The definition is incorrect!"
	exit 1
elif ! [[ $constant =~ ^-?[0-9]+$ || $constant =~ ^-?[0-9]+[.][0-9]+$ ]]; then
	echo "The definition is incorrect!"
	exit 1
fi
	

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