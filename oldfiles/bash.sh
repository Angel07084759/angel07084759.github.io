#!/bin/bash

#extensionArray=['jpg','png','gif']

srcdir="images"
destsrc="$srcdir.txt"
> $destsrc #truncating file = 0 bites
echo -e "SRCDIR:"$srcdir
echo -e

for file in $srcdir/* ; do

	fullPath="$file"
	pathOnly=$(dirname "${fullPath}")
	fileName=$(basename -- "$fullPath")
	fileName="${fileName%.*}"
	ext="${fullPath##*.}"
	testExt=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
	
	newFileName=$(echo "$fileName" | tr -s '[:blank:]' '_')
	newFileName=$(echo "$newFileName" | tr '[:punct:]' '_')
	
	
	if [[ "$ext" == "jpg" || "$ext" == "png" ]] ; then
		
		echo -e "FULLPATH:"$fullPath >> $destsrc
		echo -e "FILENAME:"$fileName >> $destsrc
		echo -e "EXTENSION:"$ext >> $destsrc
		echo -e "testExt:"$testExt >> $destsrc
		echo -e "newFileName:"$newFileName >> $destsrc
		echo -e
	fi
done

read -p "Press [Enter] to continue..."