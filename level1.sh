#!/bin/bash
echo "$USER_HASH"
pseudoRANDcapture=${USER_HASH:2:1}
echo "$pseudoRANDcapture"
pseudoRAND=$(echo -n "ibase=16; $pseudoRANDcapture" | bc)
echo "$pseudoRAND"
secondRANDcapture=${USER_HASH:3:1}
secondRAND=$(echo -n "ibase=16; $secondRANDcapture" | bc)
combined=$(echo -n "$pseudoRAND,$secondRAND")
echo "$combined"
reference=${masterArray[$combined]}
echo "$reference"
createdFile=$(echo -n "$reference")
targetDirectory="test"
echo "${masterArray["1,0"]}"
## copy verify script into level directory
mkdir level1/
cp level1Verify.sh level1/

echo "*"
echo "*"
echo "*"
echo "* Level 1 *" >> level1/README
echo "Create a new file named $createdFile.txt in the $targetDirectory directory" >> level1/README
echo "Once finished, run the verify.sh script." >> level1/README

## remove generated directory list for this level
rm directoryList.txt


