import os
import sys
global completeDictArray
completeDictArray = [
["spiritAirlines", "southwesternAirlines", "unitedAirlines", "emiratesAirlines", "airDubai", "deltaAirlines", "americanAirlines", "frontierAirlines", "jetBlueAirlines", "breezeAirways", "allegiantAir", "alaskaAirlines", "sunCountryAirlines", "virginAtlanticAirlines", "castleAir", "gamaAviation"], ## airlines
["microwave", "toaster", "oven", "stove", "refridgerator", "washer", "dryer", "paniniMaker", "waffleMaker", "electricSkillet", "electricBlender", "airFryer", "toasterOven", "foodProcessor", "coffeeMaker", "electricKettle"],
["smarties", "starbursts", "hersheyKiss", "gummyBear", "jollyRancher", "reesespbc", "gobbstopper", "laughyTaffy", "malloCups", "snickers", "twix", "licorce", "skittles", "peachRings", "sourPatchKids", "kitKat"],
["ford", "mazda", "chevy", "suburu", "cadillac", "audi", "jeep", "tesla", "gmc", "honda", "bmw", "hyundai", "toyota", "buick", "lexus", "nissan"],
["swiss", "american", "mozzerella", "colbyJack", "cheddar", "parmesan", "brie", "fetta", "bleu", "provolone", "creamCheese", "muenster", "roquefort", "gouda", "ricotta", "cottageCheese"],
["newYork", "losAngelos", "chicago", "stateCollege", "boston", "miami", "houston", "philadelphia", "sanDiego", "sanAntonio", "harrisburg", "albany", "nashville", "indianapolis", "dallas", "portland"],
["nike", "adidas", "luluLemon", "americanEagle", "hollister", "zara", "hellyHansen", "oldNavy", "macys", "jcpenny", "bedbathbeyond", "sephora", "urbanOutfitters", "theNorthFace", "burton", "patagonia"],
["pennState", "ohioState", "michiganState", "indianaUniversity", "johnsHopkinsUniversity", "ucla", "cornell", "yale", "princeton", "harvard", "alabamaState", "vanderbiltUniversity", "coloradoState", "notreDame", "georgetownUniversity", "universityOfUtah"],
["unitedStatesAmerica", "england", "scotland", "japan", "germany", "southKorea", "russia", "france", "canada", "mexico", "brazil", "iceland", "greenland", "china", "india", "taiwan"],
["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"],
["germanShepherd", "goldenRetriever", "berneseMnt", "goldenDoodle", "greatDane", "yorkie", "mastiff", "malamut", "pitbull", "poodle", "beagle", "rottweiler", "dachshund", "aussieShepherd", "germanPointer", "siberianHusky"],
["mcdonalds", "wendys", "culvers", "chickfila", "chipotle", "panera", "burgerKing", "jerseyMikes", "elPolloLoco", "steakNshake", "qdoba", "timHortons", "whataburger", "bojangles", "popeyes", "zaxbys"],
["apple", "grapes", "cherry", "clementine", "cantaloupe", "honeydew", "watermelon", "lemon", "lime", "mango", "pineapple", "pear", "plum", "starFruit", "raspberry", "strawberry"],
["flute", "bassoon", "violin", "viola", "percussion", "cello", "piano", "clarinet", "trumpet", "saxophone", "trombone", "guitar", "bass", "ukulele", "banjo", "synth"],
["juiceWRLD", "neckDeep", "moneybaggYo", "kodakBlack", "gunna", "youngThug", "asapMob", "flatbushZombies", "2Chainz", "shorelineMafia", "migos", "youngboyneverbrokeagain", "lilyachty", "kendrickLamar", "21Savage", "jid"],
["windows11", "debian", "ubuntu", "arch", "centOs", "linuxMint", "tailsOS", "windows10", "window98", "windows2002R", "msDOS", "pcDOS", "macOS", "iOS", "androidOS", "kaliLinux"],
["cajun", "salt", "pepper", "bayRub", "pizzaSeasoning", "italianSeasoning", "paprika", "garlic", "allspice", "cinnamon", "cumin", "ginger", "mustardSeed", "peppercorn", "tumeric", "vanilla"],
["soccer", "americanFootball", "pingPong", "waterPolo", "flyFishing", "wrestling", "lacrosse", "iceHockey", "badminton", "tennis", "golf", "downhillSkiing", "highJump", "longJump", "tripleJump", "javelinThrow"]
]

userHash = sys.argv[0]
firstCharConverted=int(userHash[0:0], 16)
print(userHash)
print(completeDictArray[0][firstCharConverted])
#var1=completeDictArray[][]
#del(completeDictArray[][])
#var2=completeDictArray[][]
#del(completeDictArray[][])
#print(completeDictArray[var1][var2])