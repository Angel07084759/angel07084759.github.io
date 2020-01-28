#!/bin/bash

mainUrl="https://angel07084759.github.io"	#final
imageExtensions=(png jpg gif)				#tif Notsupported
videoExtensions=(mp4 webm ogg)				#
imagesDirectories=(images imagesCopy)		#directoris and names should not contain spaces
videosDirectories=(videos videos1)			#

processMediaFiles() #params: 1>srcDirectory[@] 2>fileExtensions[@]
{
	fileOutput=$1/$1".txt" #$1=srcDir
	>$fileOutput #truncating: file = 0 bytes
	echo -e "---------------------------"
	echo -e "SRC_DIR:   "$1
	echo -e "DEST_FILE: "$fileOutput
	echo -e "---------------------------"
	
	srcDirs=$1
	shift
	srcExts=($@)
	
	for file in $srcDirs/*
	do
        if [[ -d $file ]] 
        then
            echo "$file is a directory: "$file"" 
            processMediaFiles "$file" ${srcExts[@]}
        fi
        
		fullPath=$file
		pathOnly=$(dirname "${fullPath}")
		fileName=$(basename -- "$fullPath")
		fileName=${fileName%.*}
		extension=${fullPath##*.}
		newFileName=$(echo $fileName | tr -s '[:blank:]' '_')
		newFileName=$(echo $newFileName | tr '[:punct:]' '_')
		newFileName=$newFileName.$extension
		newFullPath=$pathOnly/$newFileName
		
		for ext in ${srcExts[@]}
		do
			if [[ "$ext" == "$(echo "$extension" | tr '[:upper:]' '[:lower:]')" ]]
			then
				mv "$fullPath" "$newFullPath"
				temp=$mainUrl/$pathOnly/$newFileName
				echo $temp
#				echo $temp >> $fileOutput
				break
			fi
		done
	done
}
#
for dir in ${imagesDirectories[@]} #*/ #array=(*/)
do
	processMediaFiles $dir ${imageExtensions[@]}
done

#for dir in ${videosDirectories[@]} #*/ #array=(*/)
#do
#	processMediaFiles $dir ${videoExtensions[@]}
#done

read -p "Press [Enter] to continue..."



