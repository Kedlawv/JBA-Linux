#!/usr/bin/env bash

# set -e: by default, bash does not halt the execution of the script. This is helpful when we work with bash shell but not when executing bash scripts. The set -e option exits bash immediately when faced with an error.
# set -u: this will cause the program to automatically exit when an undefined variable is referenced.
# set -o pipefail : When a command in a pipeline fails, it returns the code of the last executed command. To return the command that was the reason behind the failure, use set -o pipefail.
set -euo pipefail

# there is no parameter declaration fo the function. 
# $1 and $2 are the references to values that are provided as input to the function in order
function add() {
    echo $(( $1 + $2 ))
}

function subtract() {
    echo $(( $1 - $2 ))
}

case $1 in
    add )
        add $2 $3;;
    subtract )
        subtract $2 $3;;
    * )
        echo "unknown operation";;
esac