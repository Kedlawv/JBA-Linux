#!/usr/bin/env bash

# line break for do
for i in 1 2 3 4 5 
do 
    echo $i "do break"
done

#or a semicolon after the set of values
for i in 1 2 3 4 5; do 
    echo $i "semicolon"
done

# for over range 
# {start..stop..range}
# doesn not support variables for i in {${1}..1..${2}} will not work 
# use seq for range from variables 
for i in {1..5..2}; do 
    echo $i "range"
  done

#for on a set of strings
for i in John Jack Mary; do 
    echo "Here is $i" 
  done

#for on a seq [start step stop]
# works with variables. for i in $(seq ${1} 1 ${2}) is valid
for i in $(seq 1 2 5); do 
    echo "Number: $i"
done

#seq can be combined 
for i in $(seq 1 2) $(seq 8 10); do
    echo $i "comb seq"
done


# while loop
i=1
while [ $i -le 3 ]; do 
    echo "I is $i" 
    i=$(($i+1)) 
done

#break and continue works sut like java
for i in $(seq 1 5); do 
    if [ $i -eq 4 ]; then 
        break; 
    fi
    echo "Number: $i from break" 
done

for i in $(seq 1 10); do 
    if [ $i -gt 5 ] && [ $i -lt 10 ]; then 
        continue; 
    fi; 
        echo "Number: $i from continue" 
done