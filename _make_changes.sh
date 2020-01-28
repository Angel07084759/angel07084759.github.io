#!/bin/bash#!/bin/bash

if [ -n "$(git status --porcelain)" ]
then
	echo "There are changes!";
	read -p "Enter a commit message: " userInput
	
	
	git add .
	git commit -m "`date '+%Y-%m-%d %H:%M:%S'` => $userInput"
	git push
	
	echo ""
	echo "Changes Date: $date"
else
	echo "There are NO changes!";
fi

read -p "Press [Enter] to continue..."

