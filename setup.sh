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

bash /home/polylinuxgame/PolyLinuxGame/touchLevel.sh
bash /home/polylinuxgame/PolyLinuxGame/mkdirLevel.sh
bash /home/polylinuxgame/PolyLinuxGame/cpMvLevel.sh
bash /home/polylinuxgame/PolyLinuxGame/rmLevel.sh

su -l $userName -c cd home/polylinuxgame/PolyLinuxGame $userName

rm -rf /home/polylinuxgame/PolyLinuxGame/dictionaries
rm /home/polylinuxgame/PolyLinuxGame/userHash.txt
rm /home/polylinuxgame/PolyLinuxGame/README.md
rm /home/polylinuxgame/PolyLinuxGame/touchLevel.sh
rm /home/polylinuxgame/PolyLinuxGame/mkdirLevel.sh
rm /home/polylinuxgame/PolyLinuxGame/cpMvLevel.sh
rm /home/polylinuxgame/PolyLinuxGame/rmLevel.sh
#sleep 10