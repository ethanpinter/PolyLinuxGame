#!/bin/sh
echo "$USER_HASH"

noDupsHash=""

## created by stripping any duplicate characters from the string
#noDupsHash=$(echo "$USER_HASH" | sed 's/\([A-Za-z]\)\1\+/\1/g')

echo "$noDupsHash ********"
# possible loop for each character in USER_HASH
#foo=string
for char in $USER_HASH; do
  echo "${USER_HASH:$char:1}"
done

# helper method for contains
# contains()
#  case "$1" in
#    (*"$2"*) true;;
#    (*) false;;
#  esac

#TMP=$(cd Folder && ls)
#
#for name in $TMP; do
#
#  if [[ "${name}" != *"a"* -a ${name} == *"b"* ]] ;then
#   echo $name
#  fi
#
#done


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

## add 1 to everything
pseudoRAND1=$((pseudoRAND1+1))
pseudoRAND2=$((pseudoRAND2+1))
pseudoRAND3=$((pseudoRAND3+1))
pseudoRAND4=$((pseudoRAND4+1))
pseudoRAND5=$((pseudoRAND5+1))
pseudoRAND6=$((pseudoRAND6+1))
pseudoRAND7=$((pseudoRAND7+1))
pseudoRAND8=$((pseudoRAND8+1))
pseudoRAND9=$((pseudoRAND9+1))
pseudoRAND10=$((pseudoRAND10+1))
pseudoRAND11=$((pseudoRAND11+1))
pseudoRAND12=$((pseudoRAND12+1))
pseudoRAND13=$((pseudoRAND13+1))
pseudoRAND14=$((pseudoRAND14+1))
pseudoRAND15=$((pseudoRAND15+1))
pseudoRAND16=$((pseudoRAND16+1))

targetDirectory=$(head -n $pseudoRAND7 masterArray.txt | tail -1)
createdFile=$(head -n $pseudoRAND4 masterArray.txt | tail -1)

## set directories based on user hash
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
