#!/bin/sh

levelDir="C:\Users\Ethan\OneDrive - The Pennsylvania State University\Documents\GitHub\PolyLinuxGame"

COMB_PASS="pennstate" 
## read in user ID and generate hash with combined password
USER_ID=""
echo "Enter your PSU User ID (xyz1234): "
read USER_ID
USER_HASH=$(echo -n $USER_ID$COMB_PASS | md5sum)
echo $USER_HASH

x="makeme"
y="dir2"

echo "Please create a new directory named $x in the $y location. Use verify.sh to recieve the next password once the directory is created."

## create static directories
mkdir $levelDir"\dir1"
mkdir $levelDir"\dir2"
mkdir $levelDir"\dir3"
mkdir $levelDir"\dir4"
mkdir $levelDir"\dir5"

echo "Done!"



$SHELL






## ask user to create a directory named X in Y location
## use X and Y random variables to check if user created directory in correct place with correct name. use a verify.sh file to give next password?