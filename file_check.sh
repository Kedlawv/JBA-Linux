#!/usr/bin/env bash

file_path=$1

    if [ -e "$file_path" ]; then
        if [ -s "$file_path" ]; then
            echo "File exists and is not empty"
        else
            echo "File exists but is empty"
        fi
    else
        echo "File does not exist"
    fi