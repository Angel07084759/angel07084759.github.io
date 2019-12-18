#!/bin/bash

extensions=(jpg png gif) #final

mainUrl="http://angel07084759.github.io" #final

srcDir="images" #final
srcDirs=(images imagesCopy) #directoris should not contain spaces

processImages() #params: 1>srcDir 2>mailUrl 
{
	fileOutput=$1/$1".txt" #$1=srcDir
	>$fileOutput #truncating: file = 0 bytes
	echo -e "---------------------------"
	echo -e "SRC_DIR:   "$1
	echo -e "DEST_FILE: "$fileOutput
	echo -e "---------------------------"

	for file in $1/*
	do
		fullPath=$file
		pathOnly=$(dirname "${fullPath}")
		fileName=$(basename -- "$fullPath")
		fileName=${fileName%.*}
		extension=${fullPath##*.}
		newFileName=$(echo $fileName | tr -s '[:blank:]' '_')
		newFileName=$(echo $newFileName | tr '[:punct:]' '_')
		newFileName=$newFileName.$extension
		newFullPath=$pathOnly/$newFileName
		
		for ext in ${extensions[@]}
		do
			if [[ "$ext" == "$(echo "$extension" | tr '[:upper:]' '[:lower:]')" ]]
			then
				mv "$fullPath" "$newFullPath"
				temp=$2/$pathOnly/$newFileName
				echo $temp
				echo $temp >> $fileOutput
				break
			fi
		done
	done
}
#
for dir in ${srcDirs[@]} #*/ #array=(*/)
do
	processImages $dir $mainUrl
done

read -p "Press [Enter] to continue..."



