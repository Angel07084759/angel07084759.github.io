#!/bin/bash

mainUrl="https://angel07084759.github.io"	#final
imageExtensions=(png jpg gif)				#tif Notsupported
videoExtensions=(mp4 webm ogg)				#
imagesDirectories=(images)                  #directoris and names should not contain spaces
videosDirectories=(videos)                  #

processMediaFiles() #params: 1>rootDirectory[@] 2>fileExtensions[@]
{
    echo "#################################" ################
    echo $1
    
    if [[ -d $1 ]]
	then 
        temp=$(basename -- "$1")
        >"$1/${temp%.*}.txt"; 
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

for dir in ${imagesDirectories[@]} #*/ #array=(*/)
do
	processMediaFiles $dir ${imageExtensions[@]}
done

for dir in ${videosDirectories[@]} #*/ #array=(*/)
do
	processMediaFiles $dir ${videoExtensions[@]}
done
read -p "Press [Enter] to continue..."



