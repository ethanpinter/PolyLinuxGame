#!/bin/sh

## grab chars from hash
pseudoRANDcapture1=${USER_HASH:2:1}
pseudoRANDcapture2=${USER_HASH:3:1}
pseudoRANDcapture3=${USER_HASH:4:1}
pseudoRANDcapture4=${USER_HASH:5:1}
pseudoRANDcapture5=${USER_HASH:6:1}
pseudoRANDcapture6=${USER_HASH:7:1}
pseudoRANDcapture7=${USER_HASH:8:1}
pseudoRANDcapture8=${USER_HASH:9:1}
pseudoRANDcapture9=${USER_HASH:10:1}
pseudoRANDcapture10=${USER_HASH:11:1}
pseudoRANDcapture11=${USER_HASH:12:1}
pseudoRANDcapture12=${USER_HASH:13:1}
pseudoRANDcapture13=${USER_HASH:14:1}
pseudoRANDcapture14=${USER_HASH:15:1}
pseudoRANDcapture15=${USER_HASH:16:1}
pseudoRANDcapture16=${USER_HASH:17:1}

## convert hash character from hex to decimal
pseudoRAND1=$(echo "ibase=16; $pseudoRANDcapture1" | bc)
pseudoRAND2=$(echo "ibase=16; $pseudoRANDcapture2" | bc)
pseudoRAND3=$(echo "ibase=16; $pseudoRANDcapture3" | bc)
pseudoRAND4=$(echo "ibase=16; $pseudoRANDcapture4" | bc)
pseudoRAND5=$(echo "ibase=16; $pseudoRANDcapture5" | bc)
pseudoRAND6=$(echo "ibase=16; $pseudoRANDcapture6" | bc)
pseudoRAND7=$(echo "ibase=16; $pseudoRANDcapture7" | bc)
pseudoRAND8=$(echo "ibase=16; $pseudoRANDcapture8" | bc)
pseudoRAND9=$(echo "ibase=16; $pseudoRANDcapture9" | bc)
pseudoRAND10=$(echo "ibase=16; $pseudoRANDcapture10" | bc)
pseudoRAND11=$(echo "ibase=16; $pseudoRANDcapture11" | bc)
pseudoRAND12=$(echo "ibase=16; $pseudoRANDcapture12" | bc)
pseudoRAND13=$(echo "ibase=16; $pseudoRANDcapture13" | bc)
pseudoRAND14=$(echo "ibase=16; $pseudoRANDcapture14" | bc)
pseudoRAND15=$(echo "ibase=16; $pseudoRANDcapture15" | bc)
pseudoRAND16=$(echo "ibase=16; $pseudoRANDcapture16" | bc)

## add steps of 16 to each value to ensure no duplicate directory names are created
## 16 categories containing 16 items
## change the integer added to keep value in certain range while still being polymorphic
#pseudoRAND1=$((pseudoRAND1+16)) ## doesnt need changed
pseudoRAND2=$(( $pseudoRAND2 + 16 ))
pseudoRAND3=$(( $pseudoRAND3 + 32 ))
pseudoRAND4=$(( $pseudoRAND4 + 48 ))
pseudoRAND5=$(( $pseudoRAND5 + 64 ))
pseudoRAND6=$(( $pseudoRAND6 + 80 ))
pseudoRAND7=$(( $pseudoRAND7 + 96 ))
pseudoRAND8=$(( $pseudoRAND8 + 112 ))
pseudoRAND9=$(( $pseudoRAND9 + 128 ))
pseudoRAND10=$(( $pseudoRAND10 + 144 ))
pseudoRAND11=$(( $pseudoRAND11 + 160 ))
pseudoRAND12=$(( $pseudoRAND12 + 176 ))
pseudoRAND13=$(( $pseudoRAND13 + 192 ))
pseudoRAND14=$(( $pseudoRAND14 + 208 ))
pseudoRAND15=$(( $pseudoRAND15 + 224 ))
pseudoRAND16=$(( $pseudoRAND16 + 240 ))

## select target directory and name of file to be created by user
targetDirectory=$(head -n $pseudoRAND1 masterArray.txt | tail -1)
secondTargetDirectory=$(head -n $pseudoRAND12 masterArray.txt | tail -1)
createdFile=$(head -n $pseudoRAND5 masterArray.txt | tail -1)

## set directories based on pseudorands
dir1=$(head -n $pseudoRAND1 masterArray.txt | tail -1)
dir2=$(head -n $pseudoRAND2 masterArray.txt | tail -1)
dir3=$(head -n $pseudoRAND3 masterArray.txt | tail -1)
dir4=$(head -n $pseudoRAND4 masterArray.txt | tail -1)
dir5=$(head -n $pseudoRAND5 masterArray.txt | tail -1)
dir6=$(head -n $pseudoRAND6 masterArray.txt | tail -1)
dir7=$(head -n $pseudoRAND7 masterArray.txt | tail -1)
dir8=$(head -n $pseudoRAND8 masterArray.txt | tail -1)
dir9=$(head -n $pseudoRAND9 masterArray.txt | tail -1)
dir10=$(head -n $pseudoRAND10 masterArray.txt | tail -1)
dir11=$(head -n $pseudoRAND11 masterArray.txt | tail -1)
dir12=$(head -n $pseudoRAND12 masterArray.txt | tail -1)
dir13=$(head -n $pseudoRAND13 masterArray.txt | tail -1)
dir14=$(head -n $pseudoRAND14 masterArray.txt | tail -1)
dir15=$(head -n $pseudoRAND15 masterArray.txt | tail -1)
dir16=$(head -n $pseudoRAND16 masterArray.txt | tail -1)

## create level-related directories
mkdir level3/
mkdir level3/"$dir1"
mkdir level3/"$dir2"
mkdir level3/"$dir3"
mkdir level3/"$dir4"
mkdir level3/"$dir5"
mkdir level3/"$dir6"
mkdir level3/"$dir7"
mkdir level3/"$dir8"
mkdir level3/"$dir9"
mkdir level3/"$dir10"
mkdir level3/"$dir11"
mkdir level3/"$dir12"
mkdir level3/"$dir13"
mkdir level3/"$dir14"
mkdir level3/"$dir15"
mkdir level3/"$dir16"

## generate file to be moved by user
touch level3/"$targetDirectory"/"$createdFile.txt"

## gen noise data





## create instruction set
echo "*"
echo "*"
echo "*"
echo "* Level 3 ">> level3/README
echo "* Copy the file named $createdFile.txt in the $targetDirectory directory" >> level3/README
echo "* into the $secondTargetDirectory directory." >> level3/README
echo "* Once finished, run the verify.sh script." >> level3/README
rm directoryList.txt
