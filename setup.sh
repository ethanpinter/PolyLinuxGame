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
cp -r /root/PolyLinuxGame/* /home/$userName/
#cp -r /root/PolyLinuxGame/dictionaries /home/$userName/
chown -R $userName /home/polylinuxgame

su -c "bash /home/polylinuxgame/touchLevel.sh"  $userName
su -c "bash /home/polylinuxgame/mkdirLevel.sh" $userName
su -c "bash /home/polylinuxgame/cpMvLevel.sh" $userName
su -c "bash /home/polylinuxgame/rmLevel.sh" $userName

rm -rf /home/polylinuxgame/dictionaries
rm /home/polylinuxgame/userHash.txt
rm /home/polylinuxgame/README.md
rm /home/polylinuxgame/touchLevel.sh
rm /home/polylinuxgame/mkdirLevel.sh
rm /home/polylinuxgame/cpMvLevel.sh
rm /home/polylinuxgame/rmLevel.sh

clear
su -l $userName

echo "Done!"
echo "***************************************"
echo "*   Welcome to The PolyLinux Game     *"
echo "*  Change to different directories    *"
echo "*  and use 'cat README.txt' to read   *"
echo "*   the instructions for the level    *"
echo "*             Good Luck!              *"
echo "***************************************"
#sleep 10