#!/bin/bash

## some notes
# first user enters their id which is hashed with password
# next the user enters the directory to place the files: in this case /home/ethan/PolyLinuxGame for testing
# based on the USER_HASH, 16 pseudorandom directories are created from 3 directories
# a pseudorandom integer 0-15 is created based on the USER_HASh, this selects the targetDirectory where a directory should be added
# the user is prompted to create a directory named "makeme" in the target directory
# once done, the user should run verify.sh to recieve the next level password

declare -a dict1
declare -a dict2
declare -a dict3
declare -a dict4
declare -a dict5
declare -a dict6
declare -a dict7
declare -a dict8
declare -a dict9
declare -a dict10
declare -a dict11
declare -a dict12
declare -a dict13
declare -a dict14
declare -a dict15
declare -a dict16
declare -a dict17

readarray -t dict1 <airlines.txt
readarray -t dict2 <appliances.txt
readarray -t dict3 <beerBrands.txt
readarray -t dict4 <candy.txt
readarray -t dict5 <carBrands.txt
readarray -t dict6 <cheese.txt
readarray -t dict7 <cities.txt
readarray -t dict8 <clothingBrands.txt
readarray -t dict9 <instruments.txt
readarray -t dict10 <countries.txt
readarray -t dict11 <dogBreeds.txt
readarray -t dict12 <fruits.txt
readarray -t dict13 <operatingSystems.txt
readarray -t dict14 <seasonings.txt
readarray -t dict15 <sports.txt
readarray -t dict16 <fastFood.txt
readarray -t dict17 <createdDirectoryDictionary.txt

# https://stackoverflow.com/questions/22466704/assign-each-line-of-file-to-be-a-variable
# Thereafter, you can refer to the lines by number. The first line is "${lines[0]}" and the second is "${lines[1]}", etc.

COMB_PASS="pennstate" 
## read in user ID and generate hash with combined password
USER_ID=""
levelDir=""
echo "Enter your PSU User ID (xyz1234): "
read USER_ID
USER_HASH=$(echo -n $USER_ID$COMB_PASS | md5sum)
## write user hash to file
#processedHash=''
#for (( i=0; i<${#USER_HASH}; i++ )); do
#  echo "${USER_HASH:$i:1}"
#  if [[ $processedHash != *$i* ]]; then
#    processedHash=$processedHash$i
#  fi
#done


#echo -n $processedHash > userHash.txt
echo -n $USER_HASH > userHash.txt

#echo "Enter the directory to place files REMOVE ME: "
#read levelDir
levelDir=$(pwd)
echo "$USER_HASH"




pseudoRANDcapture=$(cut -c 5 userHash.txt)
pseudoRAND=$(echo "ibase=16; $pseudoRANDcapture" | bc) ## returns a decimal value based on the hex value
echo "$pseudoRAND"

## cut must read from a file
## use cut instead of offset:length 
loc1=$(cut -c 1 userHash.txt)
loc2=$(cut -c 2 userHash.txt)
loc3=$(cut -c 3 userHash.txt)
loc4=$(cut -c 4 userHash.txt)
loc5=$(cut -c 5 userHash.txt)
loc6=$(cut -c 6 userHash.txt)
loc7=$(cut -c 7 userHash.txt)
loc8=$(cut -c 8 userHash.txt)
loc9=$(cut -c 9 userHash.txt)
loc10=$(cut -c 10 userHash.txt)
loc11=$(cut -c 11 userHash.txt)
loc12=$(cut -c 12 userHash.txt)
loc13=$(cut -c 13 userHash.txt)
loc14=$(cut -c 14 userHash.txt)
loc15=$(cut -c 15 userHash.txt)
loc16=$(cut -c 16 userHash.txt)
loc17=$(cut -c 17 userHash.txt)



dir1Seed=$(echo "ibase=16; $loc1" | bc) ## can be chosen based on hash value at beginning
dir2Seed=$(echo "ibase=16; $loc2" | bc)
dir3Seed=$(echo "ibase=16; $loc3" | bc)
dir4Seed=$(echo "ibase=16; $loc4" | bc)
dir5Seed=$(echo "ibase=16; $loc5" | bc)
dir6Seed=$(echo "ibase=16; $loc6" | bc) ## can be chosen based on hash value at beginning
dir7Seed=$(echo "ibase=16; $loc7" | bc)
dir8Seed=$(echo "ibase=16; $loc8" | bc)
dir9Seed=$(echo "ibase=16; $loc9" | bc)
dir10Seed=$(echo "ibase=16; $loc10" | bc)
dir11Seed=$(echo "ibase=16; $loc11" | bc) ## can be chosen based on hash value at beginning
dir12Seed=$(echo "ibase=16; $loc12" | bc)
dir13Seed=$(echo "ibase=16; $loc13" | bc)
dir14Seed=$(echo "ibase=16; $loc14" | bc)
dir15Seed=$(echo "ibase=16; $loc15" | bc)
dir16Seed=$(echo "ibase=16; $loc16" | bc)
createdDirectorySeed=$(echo "ibase=16; $loc17" | bc)
#targetDirectorySeed=$(echo "ibase=16; ${USER_HASH:4:4}" | bc) ## change based on hash value

## selects words from dictionaries to name directories; variables are strings
## sed must be replaced
dir1=$(echo -n "${dict1[$dir1Seed]}")
dir2=$(echo -n "${dict2[$dir2Seed]}")
dir3=$(echo -n "${dict3[$dir3Seed]}")
dir4=$(echo -n "${dict4[$dir4Seed]}")
dir5=$(echo -n "${dict5[$dir5Seed]}")
dir6=$(echo -n "${dict6[$dir6Seed]}")
dir7=$(echo -n "${dict7[$dir7Seed]}")
dir8=$(echo -n "${dict8[$dir8Seed]}")
dir9=$(echo -n "${dict9[$dir9Seed]}")
dir10=$(echo -n "${dict10[$dir10Seed]}")
dir11=$(echo -n "${dict11[$dir11Seed]}")
dir12=$(echo -n "${dict12[$dir12Seed]}")
dir13=$(echo -n "${dict13[$dir13Seed]}")
dir14=$(echo -n "${dict14[$dir14Seed]}")
dir15=$(echo -n "${dict15[$dir15Seed]}")
dir16=$(echo -n "${dict16[$dir16Seed]}")

targetDirectory=$(dir$pseudoRAND)

#export $dir1
#export $dir2
#export $dir3
#export $dir4
#export $dir5
#export $dir6
#export $dir7
#export $dir8
#export $dir9
#export $dir10
#export $dir11
#export $dir12
#export $dir13
#export $dir14
#export $dir15
#export $dir16


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

createdDirectory=$(echo -n "${dict17[$createdDirectorySeed]}")

echo "Please create a new directory named $createdDirectory in the $targetDirectory directory"
echo "Done!"
export levelDir


$SHELL
