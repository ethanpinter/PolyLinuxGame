#!/bin/sh



COMB_PASS="pennstate" 
## read in user ID and generate hash with combined password
USER_ID=""
levelDir=""
echo "Enter your PSU User ID (xyz1234): "
read USER_ID
USER_HASH=$(echo -n $USER_ID$COMB_PASS | md5sum)
echo "Enter the directory to place files REMOVE ME: "
read levelDir
echo $USER_HASH

echo "Please create a new directory named $x in the $y location. Use verify.sh to recieve the next password once the directory is created."

dir1Seed=4
dir2Seed=12
dir3Seed=8
dir4Seed=15
dir5Seed=1

targetFile="makeme"

dir1=sed ''$dir1Seed'!d' dictionary1
dir2=sed ''$dir2Seed'!d' dictionary3
dir3=sed ''$dir3Seed'!d' dictionary1
dir4=sed ''$dir4Seed'!d' dictionary2
dir5=sed ''$dir5Seed'!d' dictionary2


x=$targetFile
y=$dir1

## create static directories
mkdir $levelDir/$dir1
mkdir $levelDir/$dir2
mkdir $levelDir/$dir3
mkdir $levelDir/$dir4
mkdir $levelDir/$dir5

echo "Done!"
export levelDir


$SHELL






## ask user to create a directory named X in Y location
## use X and Y random variables to check if user created directory in correct place with correct name. use a verify.sh file to give next password?