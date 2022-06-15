#!/bin/bash

USER_ID=""
currentDate=$(head -n 1 currentDate.txt)
USER_HASH=${USER_HASH:0:32}
levelToCheck=$HOME/level3
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
