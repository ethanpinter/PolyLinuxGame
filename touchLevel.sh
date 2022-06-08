#!/bin/sh

levelDir="/home/ethan/level5"

COMB_PASS="pennstate" 
## read in user ID and generate hash with combined password
USER_ID=""
echo "Enter your PSU User ID (xyz1234): "
read USER_ID
USER_HASH=$(echo -n $USER_ID$COMB_PASS | md5sum)
echo $USER_HASH

## ask user to create a file named X in the Y directory
x="makeme"
y="dir2"

echo "Please create a new file named $x in the $y location. Use verify.sh to recieve the next password once the file is created."

mkdir $levelDir/dir1
mkdir $levelDir/dir2
mkdir $levelDir/dir3
mkdir $levelDir/dir4
mkdir $levelDir/dir5


echo "Setup Complete!"



$SHELL






