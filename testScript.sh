#!/bin/sh
USER_HASH="4D3260702B1DF76063CE994722D35A4E"
## grab chars from hash
pseudoRANDcapture1=${USER_HASH:2:1}
echo "rand capture: $pseudoRANDcapture1"
pseudoRANDcapture2=${USER_HASH:3:1}
pseudoRANDcapture3=${USER_HASH:4:1}
pseudoRANDcapture4=${USER_HASH:5:1}
pseudoRANDcapture5=${USER_HASH:6:1}
pseudoRANDcapture6=${USER_HASH:7:1}
pseudoRANDcapture7=${USER_HASH:8:1}
pseudoRANDcapture8=${USER_HASH:9:1}
pseudoRANDcapture9=${USER_HASH:10:1}
pseudoRANDcapture10=${USER_HASH:11:1}
#pseudoRANDcapture11=${USER_HASH:12:1}
#pseudoRANDcapture12=${USER_HASH:13:1}
#pseudoRANDcapture13=${USER_HASH:14:1}
#pseudoRANDcapture14=${USER_HASH:15:1}
#pseudoRANDcapture15=${USER_HASH:16:1}
#pseudoRANDcapture16=${USER_HASH:17:1}

## convert hash character from hex to decimal
pseudoRAND1=$(echo "ibase=16; $pseudoRANDcapture1" | bc)
echo "converted to hex: $pseudoRAND1"
pseudoRAND2=$(echo "ibase=16; $pseudoRANDcapture2" | bc)
pseudoRAND3=$(echo "ibase=16; $pseudoRANDcapture3" | bc)
pseudoRAND4=$(echo "ibase=16; $pseudoRANDcapture4" | bc)
pseudoRAND5=$(echo "ibase=16; $pseudoRANDcapture5" | bc)
pseudoRAND6=$(echo "ibase=16; $pseudoRANDcapture6" | bc)
pseudoRAND7=$(echo "ibase=16; $pseudoRANDcapture7" | bc)
pseudoRAND8=$(echo "ibase=16; $pseudoRANDcapture8" | bc)
pseudoRAND9=$(echo "ibase=16; $pseudoRANDcapture9" | bc)
pseudoRAND10=$(echo "ibase=16; $pseudoRANDcapture10" | bc)
#pseudoRAND11=$(echo "ibase=16; $pseudoRANDcapture11" | bc)
#pseudoRAND12=$(echo "ibase=16; $pseudoRANDcapture12" | bc)
#pseudoRAND13=$(echo "ibase=16; $pseudoRANDcapture13" | bc)
#pseudoRAND14=$(echo "ibase=16; $pseudoRANDcapture14" | bc)
#pseudoRAND15=$(echo "ibase=16; $pseudoRANDcapture15" | bc)
#pseudoRAND16=$(echo "ibase=16; $pseudoRANDcapture16" | bc)

## add steps of 16 to each value to ensure no duplicate directory names are created
## 16 categories containing 16 items
## change the integer added to keep value in certain range while still being polymorphic
pseudoRAND1=$(( $pseudoRAND1 + 1 ))
echo "adding 1 to rand: $pseudoRAND1"
pseudoRAND2=$(( $pseudoRAND2 + 1 ))
pseudoRAND3=$(( $pseudoRAND3 + 1 ))
pseudoRAND4=$(( $pseudoRAND4 + 1 ))
pseudoRAND5=$(( $pseudoRAND5 + 1 ))
pseudoRAND6=$(( $pseudoRAND6 + 1 ))
pseudoRAND7=$(( $pseudoRAND7 + 1 ))
pseudoRAND8=$(( $pseudoRAND8 + 1 ))
pseudoRAND9=$(( $pseudoRAND9 + 1 ))
pseudoRAND10=$(( $pseudoRAND10 + 1 ))
#pseudoRAND11=$(( $pseudoRAND11 + 176 ))
#pseudoRAND12=$(( $pseudoRAND12 + 133 ))
#pseudoRAND13=$(( $pseudoRAND13 + 201 ))
#pseudoRAND14=$(( $pseudoRAND14 + 212 ))
#pseudoRAND15=$(( $pseudoRAND15 + 231 ))
#pseudoRAND16=$(( $pseudoRAND16 + 240 ))


case "$pseudoRAND1" in
    "1") dictSelect=1
    ;;
    "2") dictSelect=17
    ;;
    "3") dictSelect=33
    ;;
    "4") dictSelect=49
    ;;
    "5") dictSelect=65
    ;;
    "6") dictSelect=81
    ;;
    "7") dictSelect=97
    ;;
    "8") dictSelect=113
    ;;
    "9") dictSelect=129
    ;;
    "10") dictSelect=145
    ;;
    "11") dictSelect=161
    ;;
    "12") dictSelect=177
    ;;
    "13") dictSelect=193
    ;;
    "14") dictSelect=209
    ;;
    "15") dictSelect=225
    ;;
    "16") dictSelect=241
    ;;
esac
echo "Dict Select: $dictSelect"
## dictSelect is the starting line of the dict, should print 16 after that
## endRange adds 16 to get 16 directories the same plus 1 different directory at the tail
endRange=$(( $dictSelect + 16 ))
sed -n "$dictSelect","$endRange"p masterArray.txt > dirs.txt