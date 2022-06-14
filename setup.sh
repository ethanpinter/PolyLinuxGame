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

bash touchLevel.sh
bash mkdirLevel.sh
bash cpMvLevel.sh
bash rmLevel.sh

rm touchLevel.sh
rm mkdirLevel.sh
rm cpMvLevel.sh
rm rmLevel.sh
rm -rf dictionaries
rm README.md
rm userHash.txt directoryList.txt
cp -r /root/PolyLinuxGame/* /home/$userName/

rm -rf /root/PolyLinuxGame
#cp -r /root/PolyLinuxGame/dictionaries /home/$userName/
#chown -R $userName /home/polylinuxgame

clear

rm setup.sh
echo "Done!"
echo "***************************************"
echo "*   Welcome to The PolyLinux Game     *"
echo "*  Change to different directories    *"
echo "*  and use 'cat README.txt' to read   *"
echo "*   the instructions for the level    *"
echo "*             Good Luck!              *"
echo "***************************************"
su -l $userName
#sleep 10