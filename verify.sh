#!/bin/bash

USER_ID=""
levelDir=""
echo "Enter your PSU User ID (xyz1234): "
read USER_ID
USER_HASH=$(echo -n "$USER_ID" | md5sum)
USER_HASH=${USER_HASH:0:32}
levelDir=$(pwd)
selectedLevel=""
toZip=""

echo "1 - mkdir Level"
echo "Enter the number of the level you wish to verify (1): "
read selectedLevel
echo "$selectedLevel"

case $selectedLevel in
    1) echo "Selected level 1 - mkdir level" && toZip="$levelDir/mkdirlevel";;
    *) echo "Invalid level. Please select again.";;
esac

tar -zcvf level.zip $toZip
userLevelHash=$(md5sum level.zip)
echo "$userLevelHash"

finalHash=$(echo "$userLevelHash" + "$USER_HASH" | bc)
echo *
echo *
echo *
echo "Take this hash and input it in the grading system. Be sure to copy it exactly!"
echo "$finalHash"  
