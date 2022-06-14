#!/bin/bash
#trap ' ' 2 20
USER_ID=""
echo "Enter your PSU User ID (xyz1234): "
read USER_ID
USER_HASH=$(echo -n "$USER_ID" | md5sum)
echo -n "$USER_HASH" > userHash.txt

userName="polylinuxgame"
newPass="Password1"
useradd -p $newPass -m $userName
cp -r /root/PolyLinuxGame /home/$userName/PolyLinuxGame
su -l $userName
cd ..
cd ~/PolyLinuxGame || exit

./touchLevel
./mkdirLevel
./cpMvLevel
./rmLevel

rm touchLevel mkdirLevel cpMvLevel rmLevel userHash.txt README.md touchLevel.sh mkdirLevel.sh cpMvLevel.sh rmLevel.sh
rm -rf dictionaries
#sleep 10