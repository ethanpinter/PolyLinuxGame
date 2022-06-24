#!/bin/bash

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
declare -a directoryDict
declare -a randDictSelection
declare -a diffDictSelection
declare -a dictNumber1
declare -a dictNumber2

## assign dictionaries to data files
readarray -t dict5 <dictionaries/airlines.txt
readarray -t dict16 <dictionaries/appliances.txt
readarray -t dict4 <dictionaries/colleges.txt
readarray -t dict3 <dictionaries/candy.txt
readarray -t dict11 <dictionaries/carBrands.txt
readarray -t dict8 <dictionaries/cheese.txt
readarray -t dict15 <dictionaries/cities.txt
readarray -t dict7 <dictionaries/clothingBrands.txt
readarray -t dict10 <dictionaries/instruments.txt
readarray -t dict9 <dictionaries/countries.txt
readarray -t dict6 <dictionaries/dogBreeds.txt
readarray -t dict12 <dictionaries/fruits.txt
readarray -t dict2 <dictionaries/operatingSystems.txt
readarray -t dict1 <dictionaries/seasonings.txt
readarray -t dict14 <dictionaries/sports.txt
readarray -t dict13 <dictionaries/fastFood.txt

readarray -t dict17 <dictionaries/createdDirectoryDictionary.txt

## grab 5th hash character and convert to decimal
pseudoRANDcapture=${USER_HASH:5:1}
secondRANDcapture=${USER_HASH:10:1}
pseudoRAND=$(echo "ibase=16; $pseudoRANDcapture" | bc)
secondRAND=$(echo "ibase=16; $secondRANDcapture" | bc)

## grabs and converts hash characters into decimal seeds
char1=${USER_HASH:1:1}
char2=${USER_HASH:2:1}
char3=${USER_HASH:3:1}
char4=${USER_HASH:4:1}
char5=${USER_HASH:5:1}
char6=${USER_HASH:6:1}
char7=${USER_HASH:7:1}
char8=${USER_HASH:8:1}
char9=${USER_HASH:9:1}
char10=${USER_HASH:10:1}
char11=${USER_HASH:11:1}
char12=${USER_HASH:12:1}
char13=${USER_HASH:13:1}
char14=${USER_HASH:14:1}
char15=${USER_HASH:15:1}
char16=${USER_HASH:16:1}
char17=${USER_HASH:5:1}
dir1Seed=$(echo "ibase=16; $char1" | bc) 
dir2Seed=$(echo "ibase=16; $char2" | bc)
dir3Seed=$(echo "ibase=16; $char3" | bc)
dir4Seed=$(echo "ibase=16; $char4" | bc)
dir5Seed=$(echo "ibase=16; $char5" | bc)
dir6Seed=$(echo "ibase=16; $char6" | bc) 
dir7Seed=$(echo "ibase=16; $char7" | bc)
dir8Seed=$(echo "ibase=16; $char8" | bc)
dir9Seed=$(echo "ibase=16; $char9" | bc)
dir10Seed=$(echo "ibase=16; $char10" | bc)
dir11Seed=$(echo "ibase=16; $char11" | bc) 
dir12Seed=$(echo "ibase=16; $char12" | bc)
dir13Seed=$(echo "ibase=16; $char13" | bc)
dir14Seed=$(echo "ibase=16; $char14" | bc)
dir15Seed=$(echo "ibase=16; $char15" | bc)
dir16Seed=$(echo "ibase=16; $char16" | bc)

## determines the seed for the name of the file that user is asked to create
createdFileSeed=$(echo "ibase=16; $char17" | bc)

## seeds are converted into directory names based on the data files and seeds
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

## adds names of directories to a file
## this file is needed in order to select what file the user should modify/create/delete
echo "$dir1" >> directoryList.txt
echo "$dir2" >> directoryList.txt
echo "$dir3" >> directoryList.txt
echo "$dir4" >> directoryList.txt
echo "$dir5" >> directoryList.txt
echo "$dir6" >> directoryList.txt
echo "$dir7" >> directoryList.txt
echo "$dir8" >> directoryList.txt
echo "$dir9" >> directoryList.txt
echo "$dir10" >> directoryList.txt
echo "$dir11" >> directoryList.txt
echo "$dir12" >> directoryList.txt
echo "$dir13" >> directoryList.txt
echo "$dir14" >> directoryList.txt
echo "$dir15" >> directoryList.txt
echo "$dir16" >> directoryList.txt

## reads in names of created directories into list
readarray -t directoryDict <directoryList.txt

## sets seed for target directory based on hash
targetDirectorySeed=$pseudoRAND
## selected target directory based on list of created directories and seed
targetDirectory=$(echo -n "${directoryDict[$targetDirectorySeed]}")

## create level directories
mkdir "level1"
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

## select noise directories (2D array implementation here for polymorphism)
noiseDirectory1=$(echo -n "${directoryDict[10]}")
noiseDirectory2=$(echo -n "${directoryDict[7]}")
noiseDirectory3=$(echo -n "${directoryDict[3]}")
noiseDirectory4=$(echo -n "${directoryDict[13]}")

## select dictionary, read in data from that dictionary, select a word from that dictionary, use those names to create noise data
randDictSeed=$(echo -n "$pseudoRAND")
diffDictSeed=$(echo -n "$secondRAND")
readarray -t randDictSelection < dictionaries/allDirectoryNames.txt
readarray -t diffDictSelection < dictionaries/allDirectoryNames.txt
selection=${randDictSelection[$randDictSeed]}
diffSelection=${diffDictSelection[$diffDictSeed]}
readarray -t dictNumber1 < dictionaries/"$selection"
readarray -t dictNumber2 < dictionaries/"$diffSelection"

## generate 5 similar directories inside target directory, generate one that is clearly different
mkdir level1/"$targetDirectory"/"${dictNumber1[6]}"
mkdir level1/"$targetDirectory"/"${dictNumber1[1]}"
mkdir level1/"$targetDirectory"/"${dictNumber1[8]}"
mkdir level1/"$targetDirectory"/"${dictNumber1[3]}"
mkdir level1/"$targetDirectory"/"${dictNumber1[2]}"
mkdir level1/"$targetDirectory"/"${dictNumber2[3]}"

## generate noise data the same as what goes in target directory
mkdir level1/"$noiseDirectory1"/"${dictNumber1[6]}"
mkdir level1/"$noiseDirectory1"/"${dictNumber1[1]}"
mkdir level1/"$noiseDirectory1"/"${dictNumber1[8]}"
mkdir level1/"$noiseDirectory1"/"${dictNumber1[3]}"
mkdir level1/"$noiseDirectory1"/"${dictNumber1[2]}"
mkdir level1/"$noiseDirectory1"/"${dictNumber2[3]}"
## generate noise data the same as what goes in target directory
mkdir level1/"$noiseDirectory2"/"${dictNumber1[6]}"
mkdir level1/"$noiseDirectory2"/"${dictNumber1[1]}"
mkdir level1/"$noiseDirectory2"/"${dictNumber1[8]}"
mkdir level1/"$noiseDirectory2"/"${dictNumber1[3]}"
mkdir level1/"$noiseDirectory2"/"${dictNumber1[2]}"
mkdir level1/"$noiseDirectory2"/"${dictNumber2[3]}"
## generate noise data the same as what goes in target directory
mkdir level1/"$noiseDirectory3"/"${dictNumber1[6]}"
mkdir level1/"$noiseDirectory3"/"${dictNumber1[1]}"
mkdir level1/"$noiseDirectory3"/"${dictNumber1[8]}"
mkdir level1/"$noiseDirectory3"/"${dictNumber1[3]}"
mkdir level1/"$noiseDirectory3"/"${dictNumber1[2]}"
mkdir level1/"$noiseDirectory3"/"${dictNumber2[3]}"
## generate noise data the same as what goes in target directory
mkdir level1/"$noiseDirectory4"/"${dictNumber1[6]}"
mkdir level1/"$noiseDirectory4"/"${dictNumber1[1]}"
mkdir level1/"$noiseDirectory4"/"${dictNumber1[8]}"
mkdir level1/"$noiseDirectory4"/"${dictNumber1[3]}"
mkdir level1/"$noiseDirectory4"/"${dictNumber1[2]}"
mkdir level1/"$noiseDirectory4"/"${dictNumber2[3]}"

## copy verify script into level directory
cp level1Verify.sh level1/
## set name of file to be created by user based on seed
createdFile=$(echo -n "${dict17[$createdFileSeed]}")
echo "*"
echo "*"
echo "*"
echo "* Level 1 *" >> level1/README
echo "Create a new file named $createdFile.txt in the $targetDirectory directory" >> level1/README
echo "Once finished, run the verify.sh script." >> level1/README

## remove generated directory list for this level
rm directoryList.txt


