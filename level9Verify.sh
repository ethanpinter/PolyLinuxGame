#!/bin/bash

## snip user hash for only characters, list all directories and subdirectories
USER_HASH=${USER_HASH:0:32}
checkDir=$(ls -R "$HOME/level9")

## find all files in level, add to file
find "$HOME/level7" -type f > fileList.txt

## create a new array with all names of files
declare -a list
readarray -t list <fileList.txt

## for each file, cat the outputs and append them to the value to be hashed
for i in ${list[$i]}
do
    checkDir+=$(cat "$i")
done

## combine snipped hash with all directories and file contents,
## hash that, then convert to base64
finalHash=$(echo -n "$USER_HASH$checkDir" | md5sum | base64)
echo "*"
echo "*"
echo "*"
echo "Take this string and input it in the grading system. Be sure to copy it exactly!"
## snip first ten characters for output
echo "${finalHash:0:10}"
rm fileList.txt
