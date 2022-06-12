#!/bin/bash

USER_ID=""
echo "Enter your PSU User ID (xyz1234): "
read USER_ID
USER_HASH=$(echo -n "$USER_ID" | md5sum)
USER_HASH=${USER_HASH:0:32}
selectedLevel=""
toZip=""

echo "1 - mkdir Level"
echo "Enter the number of the level you wish to verify (1): "
read selectedLevel

case $selectedLevel in
    1) echo "Selected level 1 - mkdir level" && levelToCheck="$HOME/PolyLinuxGame/mkdirLevel";;
    2) echo "add me later!";;
    *) echo "Invalid level. Please select again.";;
esac

preFinalHash=$((find $levelToCheck -type f -print0  | sort -z | xargs -0 md5sum;  find $levelToCheck \( -type f -o -type d \) -print0 | sort -z |    xargs -0 stat -c '%n %a') | md5sum)


echo $USER_HASH$preFinalHash > hashCheck.txt
preFinal=$(cut -c 1-64 hashCheck.txt)
echo $preFinal > final.txt
finalHash=$(md5sum final.txt)

echo "*"
echo "*"
echo "*"
echo "Take this hash and input it in the grading system. Be sure to copy it exactly!"
echo "$finalHash"
rm final.txt hashCheck.txt

### c9c23247af0fa473d488094a25e26389
# THE SOLUTION NO ZIP REQUIRED
##(find apple -type f -print0  | sort -z | xargs -0 md5sum;  find apple \( -type f -o -type d \) -print0 | sort -z |    xargs -0 stat -c '%n %a') | md5sum
