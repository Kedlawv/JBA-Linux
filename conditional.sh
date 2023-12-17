#!/usr/bin/env bash

echo "Enter password:"
read input 

#spaces around the expression [ ] is important
if [ $input = "pswd" ]; then
	echo "Correct password entered"
else
    echo "Incorrect password entered"
fi

echo "Enter first number"
# read creates a variable 
read num1

echo "Enter second number"
read num2

# if, else if, else
if [ "$num1" -eq "$num2" ]; then
    echo "Numbers are equal"
elif [ "$num1" -gt "$num2" ]; then
    echo "First number is greater"
else
    echo "Second number is greater"
fi