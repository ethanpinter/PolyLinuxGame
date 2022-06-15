#!/bin/bash

USER_ID=$(head -n 1 userID.txt)
currentDate=$(head -n 1 currentDate.txt)
USER_HASH=${USER_HASH:0:32}
levelToCheck=$HOME/level4
checkDir=$(ls -la $levelToCheck)
finalHash=$($USER_ID$checkDir$currentDate | md5sum)
echo $finalHash > finalHash.txt
finalHash=$(cut -c 1-32 finalHash.txt)
echo "*"
echo "*"
echo "*"
echo "Take this hash and input it in the grading system. Be sure to copy it exactly!"
echo "${finalHash:0:10}"
rm finalHash.txt
