#!/bin/bash

#git config core.ignorecase false
#	git ls-files
#git config core.ignorecase true
#	echo "================"
#	git ls-files #---


######################## git ls-files to array
gitFiles=$(git ls-files)
SAVEIFS=$IFS           # Save current IFS
IFS=$'\n'              # Change IFS to new line
gitFiles=($gitFiles)   # split to array $names
IFS=$SAVEIFS           # Restore IFS
######################## git ls-files to array


function checkCaseSensitive() #"$1" == "" ? "*" : "$1"/*
{
	arg="$1"
	wildcard=/*
	if [[ -z "$1" ]]; then wildcard=*; fi

	for myFile in "$arg"$wildcard
	do
		if [[ -d "$myFile" ]]
		then
			checkCaseSensitive "$myFile"
		else
			echo "=>$myFile"
		fi
	done
}


checkCaseSensitive


echo "############ gitFiles ##################"

echo "${#gitFiles[@]}" #####-----------
for f in "${gitFiles[@]}"
do
	echo "<=$f"
done
	




read -p "PRESS ENTER"


