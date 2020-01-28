#!/bin/bash

mainUrl="https://angel07084759.github.io"	#final
imageExtensions=(png jpg gif)				#tif Notsupported
videoExtensions=(mp4 webm ogg)				#
imagesDirectories=(images media)		#directoris and names should not contain spaces
videosDirectories=(videos videos1)			#

processMediaFiles() #params: 1>rootDirectory[@] 2>fileExtensions[@]
{
    cd "$1"
    read -p "PWD: $PWD ########### X1: $1" #####################################
    fileOutput="$1.txt"
	shift
	extensions=($@)
    >"$fileOutput" #truncates text file = 0 bytes
    
    #read -p "PWD: $PWD ########### fileOutput: $fileOutput" #####################################
    
	for file in */ #Iterates current directory
	do
    #read -p "PWD: $PWD ########### file: $file" #####################################
        
		fullPath=$file
		pathOnly=$(dirname "${fullPath}")
		fileName=$(basename -- "$fullPath")
		fileName=${fileName%.*}
		extension=${fullPath##*.}
		newFileName=$(echo $fileName | tr -s '[:blank:]' '_')
		newFileName=$(echo $newFileName | tr '[:punct:]' '_')
		newFileName=$newFileName.$extension
		newFullPath=$pathOnly/$newFileName
        
        read -p "file: $file ...Press [Enter]..." #######################
        
        if [[ -d $file ]] 
        then
        
            #echo "      PWD: $PWD..." #######################
            #cd "$fileName"
            
            echo "$file is a directory...Press [Enter]..." #######################
            read -p "      PWD: $PWD..." #######################result=${PWD##*/}
            processMediaFiles "$file" ${extensions[@]}
            
            #fileOutput=${PWD##*/}
            #echo "      PWD: $PWD..." #######################
            #read -p "      file: $file...${PWD##*/}......" #######################
            #cd ..
            #fileOutput="$fileOutput.txt"
            read -p "......PWD: $PWD..." #######################
            
        fi
		
		for ext in ${extensions[@]}
		do
			if [[ "$ext" == "$(echo "$extension" | tr '[:upper:]' '[:lower:]')" ]]
			then
				mv "$fullPath" "$newFullPath"
				temp=$mainUrl/$pathOnly/$newFileName
				echo "$fileOutput ==> $temp"
                #read -p "Press [Enter]... $temp"
				echo $temp >> $fileOutput
                
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



