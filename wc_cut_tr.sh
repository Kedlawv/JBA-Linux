#!/usr/bin/env bash

echo "Some text on which we get statistics" | wc

# -d delimiter, is the seperating character, -f is field, if we look a the text as set of columns 
echo "We cut text based on delimiter" | cut -d ' ' -f 3 # will return the third word in a space seperated text

#tr - transofrm
echo wawawa | tr a o # will replace all 'a' with 'o'

#-d delete
echo 'Linux Ubuntu' | tr -d 'u'
 
#keep only selected character 
echo 'Linux Ubuntu' | tr -dc 'u'

#-s remove duplicates, [:space:] is predefined pattern
echo 'Repeated  spaces in  line' | tr -s [:space:]
