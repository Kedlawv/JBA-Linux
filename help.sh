#!/usr/bin/env bash

# manual for a command 
# Q to quit
man ls

#tldr is short version of the manual 
#it needs to be installed 
sudo apt install tldr

#it seems like there are no entries for tldr for the simple commands like ls
#it needs to be updated first
tldr --update

#whatis give a short message on the purpose of the command
whatis ls

#there is also a --help flag 
ls -- help