#!/bin/bash

mainUrl="https://angel07084759.github.io"	#final
imageExtensions=(png jpg gif)				#tif Notsupported
videoExtensions=(mp4 webm ogg)				#
imagesDirectories=(images)                  #directoris and names should not contain spaces
videosDirectories=(videos)                  #

#git config core.ignorecase false

processMediaFiles() #params: 1>rootDirectory[@] 2>fileExtensions[@]
{
    echo "#################################" ################
    echo $1
    
    if [[ -d $1 ]]
	then 
        temp=$(basename -- "$1")
        >"$1/${temp%.*}.txt" 
    fi
    
    currentDir=$1
    shift
    extensions=($@)
    
	for file in "$currentDir"/* #Iterates current directory
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
        
        if [[ -d $file ]]
		then
            processMediaFiles $file ${extensions[@]}
        elif [[ -f $file ]]
		then
            for ext in ${extensions[@]}
			do
                if [[ "$ext" == "$(echo "$extension" | tr '[:upper:]' '[:lower:]')" ]]
				then
                    mv "$fullPath" "$newFullPath"
                    temp=$mainUrl/$pathOnly/$newFileName
                    echo $temp
                    fileOutput=$(basename -- "$pathOnly")
                    fileOutput="$pathOnly/$fileOutput.txt"
                    echo "$temp >> $fileOutput"
                    echo $temp >> $fileOutput                    
					break
                fi
			done
        fi
    done
}

date="`date '+%b %d, %Y; %H:%M:%S; %Z'`"

if [ -n "$(git status --porcelain)" ]
then
	echo "There are changes!";
	
	for dir in ${imagesDirectories[@]} #*/ #array=(*/)
	do
		if [[ -d $dir ]]
		then
			for file in *
			do
				if [[ "$(echo "$file" | tr '[:upper:]' '[:lower:]')"  == "$(echo "$dir" | tr '[:upper:]' '[:lower:]')" ]]
				then
				dir=$file
				break
				fi
			done
		fi
		processMediaFiles $dir ${imageExtensions[@]}
	done
else
	echo "There are NO changes!";
fi

read -p "Press [Enter] to continue..."

