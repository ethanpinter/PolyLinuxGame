#!/bin/bash

## single username. multipole levels in that users home folder 4 to 5 easy level,
## 10 levels of fun/harder
## userpassOurPasswordLevelPassword
## take todays date and inject it in the hash value yyyy/mm/dd

USER_ID=""
currentDate=""
echo "Enter your PSU email (xyz1234@psu.edu): "
read USER_ID
echo "Enter the date you created the game (YYYY-MM-DD):"
read currentDate
USER_HASH=$(echo -n $USER_ID$currentDate | md5sum)
USER_HASH=${USER_HASH:0:32}

levelToCheck=$HOME/level1
preFinalHash=$((find $levelToCheck -type f -print0  | sort -z | xargs -0 md5sum;  find $levelToCheck \( -type f -o -type d \) -print0 | sort -z |    xargs -0 stat -c '%n %a') | md5sum)

echo $USER_HASH$preFinalHash > hashCheck.txt
preFinal=$(cut -c 1-64 hashCheck.txt)
echo $preFinal > final.txt
finalHash=$(md5sum final.txt | cut -c 1-32 | base64)
echo "*"
echo "*"
echo "*"
echo "Take this hash and input it in the grading system. Be sure to copy it exactly!"
echo "${finalHash:0:10}"
rm final.txt hashCheck.txt
