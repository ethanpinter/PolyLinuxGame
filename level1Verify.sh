#!/bin/bash

## snip user hash for only characters, list all directories and subdirectories
USER_HASH=${USER_HASH:0:32}
checkDir=$(ls -R "/home/polylinux/level1")

## find all files in level, add to file; adds file path per line
## this DOES NOT account for contents of file, need to cat each file in a for loop?
## but no append....+= does not exist in shell
fileList=$(find "/home/polylinuxgame/level1" -type f)
checkDir=$checkDir$fileList

## for each file, cat the outputs and append them to the value to be hashed
# for loop here
#
#

## concatenate USER_HASH with all files and directories, hash it, then convert to
## base64 characters for human-readable output
finalHash=$(echo -n "$USER_HASH$checkDir" | md5sum | base64)
echo "*"
echo "*"
echo "*"
echo "Take this string and input it in the grading system. Be sure to copy it exactly!"
## snip first ten characters for output
echo "${finalHash:0:10}"
rm fileList.txt
