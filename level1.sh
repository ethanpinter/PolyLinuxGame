#!/bin/sh
echo "$USER_HASH"

noDupsHash=$(echo "$USER_HASH" | sed 's/\([A-Za-z]\)\1\+/\1/g')

echo "$noDupsHash"

pseudoRANDcapture1=${noDupsHash:2:1}
pseudoRANDcapture2=${noDupsHash:3:1} ## LIAR IT WORKS
pseudoRANDcapture3=${noDupsHash:4:1}
pseudoRANDcapture4=${noDupsHash:5:1}
pseudoRANDcapture5=${noDupsHash:6:1}
pseudoRANDcapture6=${noDupsHash:7:1}
pseudoRANDcapture7=${noDupsHash:8:1}
pseudoRANDcapture8=${noDupsHash:9:1}
pseudoRANDcapture9=${noDupsHash:10:1}
pseudoRANDcapture10=${noDupsHash:11:1}
pseudoRANDcapture11=${noDupsHash:12:1}
pseudoRANDcapture12=${noDupsHash:13:1}
pseudoRANDcapture13=${noDupsHash:14:1}
pseudoRANDcapture14=${noDupsHash:15:1}
pseudoRANDcapture15=${noDupsHash:16:1}
pseudoRANDcapture16=${noDupsHash:17:1}

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


targetDirectory=$(sed "${pseudoRAND1}q;" masterArray.txt)
createdFile=$(sed "${pseudoRAND2}q;" masterArray.txt)

## set directories based on user hash
dir1=$(sed "${pseudoRAND1}q;" masterArray.txt)
dir2=$(sed "${pseudoRAND2}q;" masterArray.txt)
dir3=$(sed "${pseudoRAND3}q;" masterArray.txt)
dir4=$(sed "${pseudoRAND4}q;" masterArray.txt)
dir5=$(sed "${pseudoRAND5}q;" masterArray.txt)
dir6=$(sed "${pseudoRAND6}q;" masterArray.txt)
dir7=$(sed "${pseudoRAND7}q;" masterArray.txt)
dir8=$(sed "${pseudoRAND8}q;" masterArray.txt)
dir9=$(sed "${pseudoRAND9}q;" masterArray.txt)
dir10=$(sed "${pseudoRAND10}q;" masterArray.txt)
dir11=$(sed "${pseudoRAND11}q;" masterArray.txt)
dir12=$(sed "${pseudoRAND12}q;" masterArray.txt)
dir13=$(sed "${pseudoRAND13}q;" masterArray.txt)
dir14=$(sed "${pseudoRAND14}q;" masterArray.txt)
dir15=$(sed "${pseudoRAND15}q;" masterArray.txt)
dir16=$(sed "${pseudoRAND16}q;" masterArray.txt)

## copy verify script into level directory
mkdir level1/
mkdir level1/"$dir1"
mkdir level1/"$dir2"
mkdir level1/"$dir3"
mkdir level1/"$dir4"
mkdir level1/"$dir5"
mkdir level1/"$dir6"
mkdir level1/"$dir7"
mkdir level1/"$dir8"
mkdir level1/"$dir9"
mkdir level1/"$dir10"
mkdir level1/"$dir11"
mkdir level1/"$dir12"
mkdir level1/"$dir13"
mkdir level1/"$dir14"
mkdir level1/"$dir15"
mkdir level1/"$dir16"

cp level1Verify.sh /home/polylinuxgame/level1/

echo "*"
echo "*"
echo "*"
echo "* Level 1 *" >> level1/README
echo "Create a new file named $createdFile.txt in the $targetDirectory directory" >> level1/README
echo "Once finished, run the verify.sh script." >> level1/README

## remove generated directory list for this level
rm directoryList.txt

## fix for arch, also upload to buildroot (monkey around with array functionality with the broken 2d array in bash)
