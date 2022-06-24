#!/bin/bash

## reset system clock
rc-update delete hwclock boot
rc-service hwclock restart

## get system date and psu email, create hash for directories
currentDate=$(date +"%Y-%m-%d")
USER_ID=""
echo "Enter your PSU email (xyz1234@psu.edu): "
read -r USER_ID
USER_HASH=$(echo -n "$USER_ID$currentDate" | md5sum)

## export for level and verify scripts
export currentDate
export USER_ID
export USER_HASH

## create new user with home directory (-m) and password
userName="polylinuxgame"
newPass="Password1"
useradd -p $newPass -m $userName

## create levels
bash level1.sh
bash level2.sh
bash level3.sh
bash level4.sh
bash level5.sh
bash level6.sh
bash level7.sh
bash level8.sh
bash level9.sh
bash level10.sh

## remove install scripts
rm level1.sh
rm level2.sh
rm level3.sh
rm level4.sh
rm level5.sh
rm level6.sh
rm level7.sh
rm level8.sh
rm level9.sh
rm level10.sh
rm -rf dictionaries
rm README.md

## copy create levels into new user folder
cp -r /root/PolyLinuxGame/* /home/"$userName"/

## remove install scripts from home directory
rm /home/polylinuxgame/level1Verify.sh
rm /home/polylinuxgame/level2Verify.sh
rm /home/polylinuxgame/level3Verify.sh
rm /home/polylinuxgame/level4Verify.sh
rm /home/polylinuxgame/level5Verify.sh
rm /home/polylinuxgame/level6Verify.sh
rm /home/polylinuxgame/level7Verify.sh
rm /home/polylinuxgame/level8Verify.sh
rm /home/polylinuxgame/level9Verify.sh
rm /home/polylinuxgame/level10Verify.sh

## remove root clone of game
rm -rf /root/PolyLinuxGame
## change permissions of levels to new user
chown -R $userName /home/polylinuxgame

clear


echo "Done!" 
echo "***************************************"
echo "*   Welcome to The PolyLinux Game     *"
echo "*  Change to different directories    *"
echo "*  and use 'cat README.txt' to read   *"
echo "*   the instructions for the level    *"
echo "*             Good Luck!              *"
echo "*    You created this session on:     *"
echo "*             $currentDate              *"
echo "***************************************"
## drops user into new shell as new user
su -l $userName
