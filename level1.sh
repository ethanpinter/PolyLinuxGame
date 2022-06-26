#!/bin/bash

pseudoRANDcapture=${USER_HASH:2:1}
pseudoRAND=$(echo -n "ibase=16; $pseudoRANDcapture" | bc)
createdFile=$(echo -n "${masterArray["$pseudoRAND,$pseudoRAND"]}")
targetDirectory=
## copy verify script into level directory
cp level1Verify.sh level1/

echo "*"
echo "*"
echo "*"
echo "* Level 1 *" >> level1/README
echo "Create a new file named $createdFile.txt in the $targetDirectory directory" >> level1/README
echo "Once finished, run the verify.sh script." >> level1/README

## remove generated directory list for this level
rm directoryList.txt


