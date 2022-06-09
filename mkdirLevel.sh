#!/bin/sh

## some notes
# first user enters their id which is hashed with password
# next the user enters the directory to place the files: in this case /home/ethan/PolyLinuxGame for testing
# based on the USER_HASH, 16 pseudorandom directories are created from 3 directories
# a pseudorandom integer 0-15 is created based on the USER_HASh, this selects the targetDirectory where a directory should be added
# the user is prompted to create a directory named "makeme" in the target directory
# once done, the user should run verify.sh to recieve the next level password


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

pseudoRAND=$(echo "ibase=16; ${USER_HASH:6:6}" | bc) ## returns a decimal value based on the hex value

dir1Seed=$(echo "ibase=16; ${USER_HASH:0:0}" | bc) ## can be chosen based on hash value at beginning
dir2Seed=$(echo "ibase=16; ${USER_HASH:1:1}" | bc)
dir3Seed=$(echo "ibase=16; ${USER_HASH:2:2}" | bc)
dir4Seed=$(echo "ibase=16; ${USER_HASH:3:3}" | bc)
dir5Seed=$(echo "ibase=16; ${USER_HASH:4:4}" | bc)
dir6Seed=$(echo "ibase=16; ${USER_HASH:5:5}" | bc) ## can be chosen based on hash value at beginning
dir7Seed=$(echo "ibase=16; ${USER_HASH:6:6}" | bc)
dir8Seed=$(echo "ibase=16; ${USER_HASH:7:7}" | bc)
dir9Seed=$(echo "ibase=16; ${USER_HASH:8:8}" | bc)
dir10Seed=$(echo "ibase=16; ${USER_HASH:9:9}" | bc)
dir11Seed=$(echo "ibase=16; ${USER_HASH:10:10}" | bc) ## can be chosen based on hash value at beginning
dir12Seed=$(echo "ibase=16; ${USER_HASH:11:11}" | bc)
dir13Seed=$(echo "ibase=16; ${USER_HASH:12:12}" | bc)
dir14Seed=$(echo "ibase=16; ${USER_HASH:13:13}" | bc)
dir15Seed=$(echo "ibase=16; ${USER_HASH:14:14}" | bc)
dir16Seed=$(echo "ibase=16; ${USER_HASH:15:15}" | bc)

targetDirectorySeed=$(echo "ibase=16; ${USER_HASH:4:4}" | bc) ## change based on hash value


dir1=$(sed ''$dir1Seed'!d' dictionary1.txt)
dir2=$(sed ''$dir2Seed'!d' dictionary3.txt)
dir3=$(sed ''$dir3Seed'!d' dictionary1.txt)
dir4=$(sed ''$dir4Seed'!d' dictionary3.txt)
dir5=$(sed ''$dir5Seed'!d' dictionary2.txt)
dir6=$(sed ''$dir5Seed'!d' dictionary1.txt)
dir7=$(sed ''$dir5Seed'!d' dictionary2.txt)
dir8=$(sed ''$dir1Seed'!d' dictionary1.txt)
dir9=$(sed ''$dir2Seed'!d' dictionary3.txt)
dir10=$(sed ''$dir3Seed'!d' dictionary1.txt)
dir11=$(sed ''$dir4Seed'!d' dictionary2.txt)
dir12=$(sed ''$dir5Seed'!d' dictionary3.txt)
dir13=$(sed ''$dir5Seed'!d' dictionary2.txt)
dir14=$(sed ''$dir5Seed'!d' dictionary3.txt)
dir15=$(sed ''$dir1Seed'!d' dictionary1.txt)
dir16=$(sed ''$dir2Seed'!d' dictionary3.txt)

targetDirectory=$(dir$pseudoRAND)

export $dir1
export $dir2
export $dir3
export $dir4
export $dir5
export $dir6
export $dir7
export $dir8
export $dir9
export $dir10
export $dir11
export $dir12
export $dir13
export $dir14
export $dir15
export $dir16


## create static directories
mkdir $dir1
mkdir $dir2
mkdir $dir3
mkdir $dir4
mkdir $dir5
mkdir $dir6
mkdir $dir7
mkdir $dir8
mkdir $dir9
mkdir $dir10
mkdir $dir11
mkdir $dir12
mkdir $dir13
mkdir $dir14
mkdir $dir15
mkdir $dir16

createdDirectory="makeme"

echo "Please create a new directory named $createdDirectory in the $targetDirectory location. Use verify.sh to recieve the next password once the directory is created."

echo "Done!"
export levelDir


$SHELL
