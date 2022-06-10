#!/bin/bash

## hash with correct files and directories created

## here's what your hash should look like based on the directories created in the mkdirLevel script




masterHash=$(echo -n "38515e80825fe27bd2d43a91f3a6abc2 -") ## change based on user hash

## might need to create a user input to ask which level is being verified

homeDir="/home/ethan/PolyLinuxGame"
## echo "Enter the level to validate: "
echo "Enter the directory path (~/PolyLinuxGame) to check validity: "
#read homeDir
#echo $homeDir
#zip -r home.zip $homeDir
zip -r home.zip $homeDir
userHomeHash=$(md5sum home.zip)
echo $userHomeHash
## generates md5 hash for entire directory
# hash each file, then sort those hashes and combine into one value through another iteration of md5 hashing
## find . -type f -exec md5sum {} + | LC_ALL=C sort | md5sum

## get all files in level6 names, convert to md5 hash and add each hash together

dirHash=$(find $homeDir -type f -exec md5sum {} + | LC_ALL=C sort | md5sum)
#echo $dirHash

# compares hashes
if [[ "${masterHash:0:32}" == "${dirHash:0:32}" ]];then
    echo "Hashes are equal."
else
    echo "Hashes are not equal."
fi

#echo ${masterHash:0:32}
#echo ${dirHash:0:32}


## verfiy output is hash, convert to base64
## 