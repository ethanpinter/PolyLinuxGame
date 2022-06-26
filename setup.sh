#!/bin/bash

## reset system clock
rc-update delete hwclock boot
rc-service hwclock restart

## get system date and psu email, create hash for directories
currentDate=$(date +"%Y-%m-%d")
USER_ID=""
echo "Enter your PSU email (xyz1234@psu.edu): "
read -r USER_ID
USER_HASH=$(echo -n "$USER_ID$currentDate" | md5sum)

## export for level and verify scripts
export currentDate
export USER_ID
export USER_HASH

## generate master dictionary
declare -A masterArray=(
## airlines
[0,0]="spiritAirlines"
[0,1]="southwesternAirlines"
[0,2]="unitedAirlines"
[0,3]="emiratesAirlines"
[0,4]="airDubai"
[0,5]="deltaAirlines"
[0,6]="americanAirlines"
[0,7]="frontierAirlines"
[0,8]="jetBlueAirlines"
[0,9]="breezeAirways"
[0,10]="allegiantAir"
[0,11]="alaskaAirlines"
[0,12]="sunCountryAirlines"
[0,13]="virginAtlanticAirlines"
[0,14]="castleAir"
[0,15]="gamaAviation"
## appliances
[1,0]="microwave"
[1,1]="toaster"
[1,2]="oven"
[1,3]="stove"
[1,4]="refridgerator"
[1,5]="washer"
[1,6]="dryer"
[1,7]="paniniMaker"
[1,8]="waffleMaker"
[1,9]="electricSkillet"
[1,10]="electricBlender"
[1,11]="airFryer"
[1,12]="toasterOven"
[1,13]="foodProcessor"
[1,14]="coffeeMaker"
[1,15]="electricKettle"
## candies
[2,0]=smarties
[2,1]=starbursts
[2,2]=hersheyKiss
[2,3]=gummyBear
[2,4]=jollyRancher
[2,5]=reesespbc
[2,6]=gobbstopper
[2,7]=laughyTaffy
[2,8]=malloCups
[2,9]=snickers
[2,10]=twix
[2,11]=licorce
[2,12]=skittles
[2,13]=peachRings
[2,14]=sourPatchKids
[2,15]=kitKat
## car brands
[3,0]=ford
[3,1]=mazda
[3,2]=chevy
[3,3]=suburu
[3,4]=cadillac
[3,5]=audi
[3,6]=jeep
[3,7]=tesla
[3,8]=gmc
[3,9]=honda
[3,10]=bmw
[3,11]=hyundai
[3,12]=toyota
[3,13]=buick
[3,14]=lexus
[3,15]=nissan
## cheeses
[4,0]=swiss
[4,1]=american
[4,2]=mozzerella
[4,3]=colbyJack
[4,4]=cheddar
[4,5]=parmesan
[4,6]=brie
[4,7]=fetta
[4,8]=bleu
[4,9]=provolone
[4,10]=creamCheese
[4,11]=muenster
[4,12]=roquefort
[4,13]=gouda
[4,14]=ricotta
[4,15]=cottageCheese
## cities
[5,0]=newYork
[5,1]=losAngelos
[5,2]=chicago
[5,3]=stateCollege
[5,4]=boston
[5,5]=miami
[5,6]=houston
[5,7]=philadelphia
[5,8]=sanDiego
[5,9]=sanAntonio
[5,10]=harrisburg
[5,11]=albany
[5,12]=nashville
[5,13]=indianapolis
[5,14]=dallas
[5,15]=portland
## clothing brands
[6,0]=nike
[6,1]=adidas
[6,2]=luluLemon
[6,3]=americanEagle
[6,4]=hollister
[6,5]=zara
[6,6]=hellyHansen
[6,7]=oldNavy
[6,8]=macys
[6,9]=jcpenny
[6,10]=bedbathbeyond
[6,11]=sephora
[6,12]=urbanOutfitters
[6,13]=theNorthFace
[6,14]=burton
[6,15]=patagonia
## colleges
[7,0]=pennState
[7,1]=ohioState
[7,2]=michiganState
[7,3]=indianaUniversity
[7,4]=johnsHopkinsUniversity
[7,5]=ucla
[7,6]=cornell
[7,7]=yale
[7,8]=princeton
[7,9]=harvard
[7,10]=alabamaState
[7,11]=vanderbiltUniversity
[7,12]=coloradoState
[7,13]=notreDame
[7,14]=georgetownUniversity
[7,15]=universityOfUtah
## countries
[8,0]=unitedStatesAmerica
[8,1]=england
[8,2]=scotland
[8,3]=japan
[8,4]=germany
[8,5]=southKorea
[8,6]=russia
[8,7]=france
[8,8]=canada
[8,9]=mexico
[8,10]=brazil
[8,11]=iceland
[8,12]=greenland
[8,13]=china
[8,14]=india
[8,15]=taiwan
## letters
[9,0]=a
[9,1]=b
[9,2]=c
[9,3]=d
[9,4]=e
[9,5]=f
[9,6]=g
[9,7]=h
[9,8]=i
[9,9]=j
[9,10]=k
[9,11]=l
[9,12]=m
[9,13]=n
[9,14]=o
[9,15]=p
## dog breeds
[10,0]=germanShepherd
[10,1]=goldenRetriever
[10,2]=berneseMnt
[10,3]=goldenDoodle
[10,4]=greatDane
[10,5]=yorkie
[10,6]=mastiff
[10,7]=malamut
[10,8]=pitbull
[10,9]=poodle
[10,10]=beagle
[10,11]=rottweiler
[10,12]=dachshund
[10,13]=aussieShepherd
[10,14]=germanPointer
[10,15]=siberianHusky
## fast food
[11,0]=mcdonalds
[11,1]=wendys
[11,2]=culvers
[11,3]=chickfila
[11,4]=chipotle
[11,5]=panera
[11,6]=burgerKing
[11,7]=jerseyMikes
[11,8]=elPolloLoco
[11,9]=steakNshake
[11,10]=qdoba
[11,11]=timHortons
[11,12]=whataburger
[11,13]=bojangles
[11,14]=popeyes
[11,15]=zaxbys
## fruits
[12,0]=apple
[12,1]=grapes
[12,2]=cherry
[12,3]=clementine
[12,4]=cantaloupe
[12,5]=honeydew
[12,6]=watermelon
[12,7]=lemon
[12,8]=lime
[12,9]=mango
[12,10]=pineapple
[12,11]=pear
[12,12]=plum
[12,13]=starFruit
[12,14]=raspberry
[12,15]=strawberry
## instruments
[13,0]=flute
[13,1]=bassoon
[13,2]=violin
[13,3]=viola
[13,4]=percussion
[13,5]=cello
[13,6]=piano
[13,7]=clarinet
[13,8]=trumpet
[13,9]=saxophone
[13,10]=trombone
[13,11]=guitar
[13,12]=bass
[13,13]=ukulele
[13,14]=banjo
[13,15]=synth
## music artists
[14,0]=juiceWRLD
[14,1]=neckDeep
[14,2]=moneybaggYo
[14,3]=kodakBlack
[14,4]=gunna
[14,5]=youngThug
[14,6]=asapMob
[14,7]=flatbushZombies
[14,8]=2Chainz
[14,9]=shorelineMafia
[14,10]=migos
[14,11]=youngboyneverbrokeagain
[14,12]=lilyachty
[14,13]=kendrikLamar
[14,14]=21Savage
[14,15]=jid
## sports
[15,0]=soccer
[15,1]=americanFootball
[15,2]=pingPong
[15,3]=waterPolo
[15,4]=flyFishing
[15,5]=wrestling
[15,6]=lacrosse
[15,7]=iceHockey
[15,8]=badminton
[15,9]=tennis
[15,10]=golf
[15,11]=downhillSkiing
[15,12]=highJump
[15,13]=longJump
[15,14]=tripleJump
[15,15]=javelinThrow
)
export masterArray
#python pythonSetup.py "$USER_HASH"
## create new user with home directory (-m) and password
userName="polylinuxgame"
newPass="Password1"
useradd -p $newPass -m $userName

## create levels
bash level1.sh
bash level2.sh
bash level3.sh
bash level4.sh
bash level5.sh
bash level6.sh
bash level7.sh
bash level8.sh
bash level9.sh
bash level10.sh

## remove install scripts
rm level1.sh
rm level2.sh
rm level3.sh
rm level4.sh
rm level5.sh
rm level6.sh
rm level7.sh
rm level8.sh
rm level9.sh
rm level10.sh
rm -rf dictionaries
rm README.md

## copy create levels into new user folder
cp -r /root/PolyLinuxGame/* /home/"$userName"/

## remove install scripts from home directory
rm /home/polylinuxgame/level1Verify.sh
rm /home/polylinuxgame/level2Verify.sh
rm /home/polylinuxgame/level3Verify.sh
rm /home/polylinuxgame/level4Verify.sh
rm /home/polylinuxgame/level5Verify.sh
rm /home/polylinuxgame/level6Verify.sh
rm /home/polylinuxgame/level7Verify.sh
rm /home/polylinuxgame/level8Verify.sh
rm /home/polylinuxgame/level9Verify.sh
rm /home/polylinuxgame/level10Verify.sh

## remove root clone of game
rm -rf /root/PolyLinuxGame
## change permissions of levels to new user
chown -R $userName /home/polylinuxgame

#clear


echo "Done!" 
echo "***************************************"
echo "*   Welcome to The PolyLinux Game     *"
echo "*  Change to different directories    *"
echo "*  and use 'cat README.txt' to read   *"
echo "*   the instructions for the level    *"
echo "*             Good Luck!              *"
echo "*    You created this session on:     *"
echo "*             $currentDate              *"
echo "***************************************"
## drops user into new shell as new user
su -l $userName
