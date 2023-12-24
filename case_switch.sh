#!/usr/bin/env bash

answers=("a" "d" "c" "a" "a")
total_score=0

for (( i = 0; i < 5; i++));
do
    case "${1}" in					# switch(${1})

        ${answers[i]})                   # case answers[i]:
            ((total_score++))				# total_score++
            ;;                              # break
        "-"|"--")
            ;;
        *)                               # default:
            ((total_score--))
            ;;

    esac
	
	# shifts script argument to the left removing left most argument
	#   this way we can use ${1} for every argument as it's shifted on every iteration of the loop
    shift 1
done

echo "Total score is: $total_score"

# case aka switch. Two options conditions with the use of 'or' '|'
case "${1}" in

    "")       
        echo "No option was selected." 
        ;;
    1 | 'a')     
        echo "You either selected '1' or 'a'." 
        ;;
    2 | 'b')     
        echo "You either selected '2' or 'b'." 
        ;;
    3 | 'c')     
        echo "You either selected '3' or 'c'." 
        ;;
    *)     
        echo "Unknown character '${1}'." 
        ;;

esac