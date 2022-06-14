#!/bin/bash

USER_ID=""
echo "Enter your PSU User ID (xyz1234): "
read USER_ID
USER_HASH=$(echo -n "$USER_ID" | md5sum)
echo -n "$USER_HASH" > userHash.txt

userName="polylinuxGame"
newPass="Password1"
useradd -p $newPass -m $userName
cp -r . home/$userName
su $userName
cd ..
cd home/$userName || exit

#./touchLevel
#./mkdirLevel
#./cpMvLevel
#./rmLevel