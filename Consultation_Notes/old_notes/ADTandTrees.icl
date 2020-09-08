module ADTandTrees
import StdEnv

:: Person = {name :: String, gender :: Gender}
:: Gender = Male | Female | AttackHelicopter

Evan :: Person
Evan = {name = "Evan", gender = Male}
Tringa :: Person
Tringa = {name = "Tringa", gender = Female}

//Start = Evan
isMale :: Person -> Bool
isMale x = x.gender == Male

instance == Gender
where
    == Male Male = True
    == Female Female = True
    == AttackHelicopter _ = True
    == _ AttackHelicopter = True
    == _ _ = False

//Start = isMale Evan

instance toString Gender
where
    toString Male = "Male"
    toString Female = "Female"
    toString AttackHelicopter = "AGGRESSIVEMF"

//Start = "Evan is " +++ toString(Evan.gender)

instance toInt Gender
where
    toInt Male = 1
    toInt Female = 2
    toInt AttackHelicopter = 9000

//Start = 42 + toInt(Evan.gender)

:: X someType otherType = A | B (someType,someType,someType) | C (someType,otherType)| D [someType]

test1 :: (X Int Int)
test1 = D [1,2,3,4,5]

test2 :: (X Bool Int)
test2 = B (True, False, True)

test3 :: (X Person Gender)
test3 = C (Evan, Evan.gender)

//Start = test1
//Start = test2
//Start = test3

:: PileOfHotShit someShit = Dung someShit  (PileOfHotShit someShit)  (PileOfHotShit someShit) | Poop
//                          Dung    x                 l                          r

demoTree :: (PileOfHotShit Int)
demoTree = Dung 8 (Dung 3 (Dung 1 Poop Poop) (Dung 6 (Dung 4 Poop Poop) (Dung 7 Poop Poop))) (Dung 10 Poop (Dung 14 (Dung 13 Poop Poop) Poop))

//Start = demoTree

extractPoop :: (PileOfHotShit someShit) -> someShit
extractPoop (Dung x l r) = x

//Start = extractPoop demoTree

goL :: (PileOfHotShit someShit) -> (PileOfHotShit someShit)
goL (Dung x l r) = l
goR :: (PileOfHotShit someShit) -> (PileOfHotShit someShit)
goR (Dung x l r) = r

//Start = goR demoTree

isPoop :: (PileOfHotShit someShit) -> Bool
isPoop Poop = True
isPoop _ = False

minShit :: (PileOfHotShit someShit) -> someShit
minShit tree
| isPoop(goL tree) = extractPoop tree
= minShit(goL tree)

//Start = minShit demoTree

minShit2 :: (PileOfHotShit someShit) -> someShit
minShit2 (Dung x Poop r) = x
minShit2 (Dung x l r) = minShit2 l

//Start = minShit2 demoTree

cloneShit :: (PileOfHotShit someShit) -> (PileOfHotShit someShit)
cloneShit tree
| isPoop tree = Poop
= Dung (extractPoop tree) (cloneShit(goL tree)) (cloneShit(goR tree))

//Start = cloneShit demoTree
//Start = demoTree

cloneShit2 :: (PileOfHotShit someShit) -> (PileOfHotShit someShit)
cloneShit2 Poop = Poop
cloneShit2 (Dung x l r) = Dung x (cloneShit2 l) (cloneShit2 r)

//Start = cloneShit2 demoTree

timeShit :: (PileOfHotShit someShit) someShit -> (PileOfHotShit someShit) | * someShit
timeShit Poop _ = Poop
timeShit (Dung x l r) n = Dung (x*n) (timeShit l n) (timeShit r n)

//Start = timeShit demoTree 10

timeShit2 :: (PileOfHotShit someShit) someShit -> (PileOfHotShit someShit) | * someShit
timeShit2 tree n
| isPoop tree = Poop
= Dung (n*(extractPoop tree)) (timeShit2 (goL tree) n) (timeShit2 (goR tree) n)

//Start = timeShit2 demoTree 10

addShit :: (PileOfHotShit someShit) someShit -> (PileOfHotShit  someShit) | Eq, < someShit
addShit Poop n = Dung n Poop Poop
addShit (Dung x l r) n
| n == x = Dung x l r 
| n < x = Dung x (addShit l n) r
| n > x = Dung x l (addShit r n)

//Start = addShit demoTree 5

addShit2 :: (PileOfHotShit someShit) someShit -> (PileOfHotShit  someShit) | Eq, < someShit
addShit2 tree n
| isPoop tree = Dung n Poop Poop
| n == extractPoop tree = Dung (extractPoop tree) (goL tree) (goR tree)
| n < extractPoop tree = Dung (extractPoop tree) (addShit2 (goL tree) n) (goR tree)
| n > extractPoop tree = Dung (extractPoop tree) (goL tree) (addShit2 (goR tree) n)

//Start = addShit2 demoTree 5

addShit3 :: (PileOfHotShit someShit) someShit -> (PileOfHotShit  someShit) | Eq, < someShit
addShit3 tree n
| isPoop tree = Dung n Poop Poop
| n == x = Dung x l r 
| n < x = Dung x (addShit3 l n) r
| n > x = Dung x l (addShit3 r n)
where
    x = extractPoop tree
    l = goL tree
    r = goR tree

//Start = addShit3 demoTree 5