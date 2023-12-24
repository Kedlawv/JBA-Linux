#!/usr/bin/env bash


while [ true ]; do
	case "${1}" in

		1 | 2 | 3)
			echo "${1}"
			shift "${1}"
			;;
		
		0)
			exit 0
			;;
		*)
			exit 1
			;;
	esac
done