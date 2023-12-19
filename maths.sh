#!/usr/bin/env bash

# bash arithmetic
echo $(( 10*5+15 ))
# division rounds down, no floating point 
echo $(( 40/6 ))

#Assigning value to variables
val1=$(( 10*3-15 ))
echo $val1

#Arithmetic operations using constants
echo $(( val1 *= 3 ))

#basic calculator - bc (need to be installed) sudo apt install bc
# <<< is called a 'here-string'

#Less than operator
bc <<< "10 < 1"

#Is not equal to operator
bc <<< "10 != 11"

#bc logical operators, same as java
bc <<< "5&&6"
bc <<< "5||6"
bc <<< "!5"	

# to enable math library we need to use the -l flag 

#Arithmetic operation that returns a floating-point number
bc -l <<< "(1 + 2)/7 * 2 ** 2"

#Using sine and cosine functions
bc -l <<< "s(1) + c(1)"

#Using logarithmic and exponential functions
bc -l <<< "e(1) + l(5)"

#Finding the square root of a number
bc -l <<< "sqrt(27)"

#Converting binary 10 to octal
bc -l <<< "ibase=2; obase=8; 10"

#Converting decimal 5 to binary
bc -l <<< "obase=2; 5"

#Using scale to control length of floating-point numbers
bc -l <<< "scale=3; a(30)"
