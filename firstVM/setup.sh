#!/bin/sh

## get system date and psu email, create hash for directories
workingDir=$(pwd)
ourPass="supersecure"
currentDate=$(date +"%Y-%m-%d")
USER_ID=""

## need to do some validation for email input
echo "Enter your PSU email (xyz1234@psu.edu): "
read -r USER_ID

## generate user hash based on ID, date, and backend pass
USER_HASH=$(echo "$USER_ID$currentDate$ourPass" | md5sum | grep -o '^\S\+' | tr 'a-z' 'A-Z')

## export for level and verify scripts
export USER_HASH
export workingDir

## buildroot doesn't have a home directory by default, so we add one
mkdir /home/

## create new user in the home directory, set password
userName="polylinuxgame"
userPass="Password1"

mkdir /home/$userName
adduser -h /home/$userName --disabled-password $userName
passwd $userName -d $userPass

## create levels
/bin/sh $workingDir/level1.sh
/bin/sh $workingDir/level2.sh
/bin/sh $workingDir/level3.sh
/bin/sh $workingDir/level4.sh
/bin/sh $workingDir/level5.sh

## remove install scripts
rm $workingDir/level1.sh
rm $workingDir/level2.sh
rm $workingDir/level3.sh
rm $workingDir/level4.sh
rm $workingDir/level5.sh

## copy levels into new user folder
cp -r $workingDir/level1 /home/"$userName"/
cp -r $workingDir/level2 /home/"$userName"/
cp -r $workingDir/level3 /home/"$userName"/
cp -r $workingDir/level4 /home/"$userName"/
cp -r $workingDir/level5 /home/"$userName"/

## copy verify scripts into respective level directories
cp verify.sh /home/"$userName"/level1/
cp verify.sh /home/"$userName"/level2/
cp verify.sh /home/"$userName"/level3/
cp verify.sh /home/"$userName"/level4/
cp verify.sh /home/"$userName"/level5/

## change permissions of levels to new user
chown -R $userName /home/$userName

## cleanup
clear

## print welcome message
echo "Done!"
echo "***************************************"
echo "*   Welcome to The PolyLinux Game     *"
echo "*  Change to different directories    *"
echo "*  and use 'cat README.txt' to read   *"
echo "*   the instructions for the level    *"
echo "*             Good Luck!              *"
echo "*    You created this session on:     *"
echo "*            $currentDate              *"
echo "***************************************"

## drops user into new shell as new user
su -l $userName
