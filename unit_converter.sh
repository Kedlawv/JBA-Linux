#!/usr/bin/env bash

echo "Enter a definition:"
read -a user_input

arr_length="${#user_input[@]}"
definition="${user_input[0]}"
constant="${user_input[1]}"

regex='^[a-zA-Z]+_to_[a-zA-Z]+$'

return_message="none"

if [ "$arr_length" -ne 2 ]; then
	return_message="The definition is incorrect!"
elif ! [[ $definition =~ $regex ]]; then
	return_message="The definition is incorrect!"
elif ! [[ $constant =~ ^-?[0-9]+$ || $constant =~ ^-?[0-9]+[.][0-9]+$ ]]; then
	return_message="The definition is incorrect!"
else
	return_message="The definition is correct!"
fi
	
echo "$return_message"
