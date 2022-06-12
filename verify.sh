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
    1) echo "Selected level 1 - mkdir level" && toZip="$levelDir/mkdirLevel";;
    *) echo "Invalid level. Please select again.";;
esac

tar -zcvf level.zip $toZip
userLevelHash=$(md5sum level.zip)
echo "$userLevelHash"

echo $USER_HASH$userLevelHash > hashCheck.txt
preFinal=$(cut -c 0-64 hashCheck.txt)
echo $preFinal > final.txt
preFinal=$(md5sum final.txt)

finalHash=$(echo "ibase=16;obase=A;${preFinal}" | bc)
echo "*"
echo "*"
echo "*"
echo "Take this hash and input it in the grading system. Be sure to copy it exactly!"
echo "$finalHash"  
