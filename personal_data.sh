# below is defining what program will run the script
#!/usr/bin/env bash

# parameters are positional $0 is always the name of the scrip and after that it's $1 $2 etc
# $# returns the total number of parameters minus the null $0 parameter 

# this is how we define a function
personal_data() {
    # this is a comment
	echo "You provided $# facts about yourself!"
    echo "Your name is $1"
    echo "Your age is $2"
}

# $* returns all parameters as one word
echo "all parameters as one word: $*"

# this is how we call a function with parameters 
personal_data $1 $2  