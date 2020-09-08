module familyTree
import StdEnv


//Given these Algebraic Data Types, Records, and Tree...
:: Gender = Male | Female | NonBinary | AttackHelicopter
:: LivingStatus = Alive | Deceased
:: MarriageStatus = Married | Divorced | Single
:: Person = { name :: String, gender :: Gender, age :: Int, livingStatus :: Bool, marriageStatus :: MarriageStatus}
:: FamilyTree a = Name a (FamilyTree a) (FamilyTree a) | End

//And these people:
Olivia = {name = "Olivia", gender = Female, age = 19, livingStatus = True, marriageStatus = Single}
Amelia = {name = "Amelia", gender = Female, age = 83, livingStatus = True, marriageStatus = Married}
Isla = {name = "Isla", gender = Female, age = 40, livingStatus = True, marriageStatus = Married}
Emily = {name = "Emily", gender = Female, age = 73, livingStatus = True, marriageStatus = Divorced}
Ava = {name = "Ava", gender = Female, age = 18, livingStatus = True, marriageStatus = Single}
Lily = {name = "Lily", gender = Female, age = 50, livingStatus = True, marriageStatus = Divorced}
Oliver = {name = "Oliver", gender = Male, age = 56, livingStatus = True, marriageStatus = Married}
Harry = {name = "Harry", gender = Male, age = 45, livingStatus = True, marriageStatus = Married}
Jack = {name = "Jack", gender = Male, age = 90, livingStatus = False, marriageStatus = Married}
George = {name = "George", gender = Male, age = 43, livingStatus = True, marriageStatus = Married}
Noah = {name = "Noah", gender = Male, age = 74, livingStatus = False, marriageStatus = Divorced}
Freddie = {name = "Freddie", gender = Male, age = 24, livingStatus = True, marriageStatus = Single}
Ethan = {name = "Ethan", gender = Male, age = 20, livingStatus = True, marriageStatus = Single}

//And each person's immediate parents:
OliviaTree = Name Olivia OliverTree HarryTree
OliverTree = Name Oliver End End
HarryTree = Name Harry AmeliaTree JackTree
AmeliaTree = Name Amelia End End
JackTree = Name Jack End End
EthanTree = Name Ethan GeorgeTree IslaTree
GeorgeTree = Name George AmeliaTree JackTree
IslaTree = Name Isla NoahTree EmilyTree
NoahTree = Name Noah End End
EmilyTree = Name Emily End End
AvaTree = Name Ava LilyTree OliverTree
LilyTree = Name Lily End End
FreddieTree = Name Freddie End End

personsList = [Olivia, Amelia, Isla, Emily, Ava, Lily, Oliver, Harry, Jack, George, Noah, Freddie, Ethan]
familyList = [OliviaTree, OliverTree, HarryTree, AmeliaTree, JackTree, EthanTree, GeorgeTree, IslaTree, NoahTree, EmilyTree, AvaTree, LilyTree, FreddieTree]

//Start = personsList
//Start = familyList

(equals) p q = (p.name == q.name)&&(p.age==q.age)

(sameSex) Male Male = True
(sameSex) Female Female = True
(sameSex) _ _ = False

(olderThan) p q = (p.age > q.age)

(youngerThan) p q = (p.age < q.age)

//Start = Olivia equals Olivia
//Start = x == y
//Start = Oliver olderThan Harry
//Start = Oliver youngerThan Harry

(isFamilyOf) (Name a x y) p = p equals a

//Start =  OliviaTree isFamilyOf Olivia

getFamily p = hd [x\\ x<-familyList | x isFamilyOf p]

//Start = getFamily Ava 

getPerson (Name a x y) = a

//Start = getPerson OliviaTree

getName (Name {name} x y) = name

//Start = getName OliviaTree


//1. Write a function that tests if a person is adopted.
//Condition: Person has two parents of same gender, we're simplifying here.
//isAdopted :: Person -> Bool
adoptAux (Name a End End) = False
adoptAux (Name a x y) = (getPerson x).gender sameSex (getPerson y).gender

isAdopted :: Person -> Bool
isAdopted x = adoptAux (getFamily x)

//Start = isAdopted Olivia //True
//Start = isAdopted Ethan //False
//Start = isAdopted Freddie //False (we don't know who his parents are)

//2. Write a function that tests if two persons are cousins
//Condition: They share a grandparent.

getParents :: Person -> [Person]
getParents p = getParentsAux (getFamily p)
getParentsAux (Name a End End) = []
getParentsAux (Name a x y) = [ (getPerson x), (getPerson y)]

//Start = getParents Ethan
//Start = getParents Freddie

getGrandParents :: Person -> [Person]
getGrandParents p = flatten (map getParents (getParents p))

Start = getGrandParents Ethan
//Start = getGrandParents Olivia

isMemberP :: Person [Person] -> Bool
isMemberP p list = not(isEmpty[x \\ x<-list | x equals p])

//Start = isMemberP Jack (getGrandParents Ethan)

removeDupP :: [Person] -> [Person]
removeDupP [] = []
removeDupP [a:b] = [a:removeDupP [x \\ x<-b | not(x equals a)]]

//Start = removeDupP [Ethan, Olivia, Ava, Ethan, Jack, Jack, Jack, Emily, Noah, Ethan]

inCommon :: [Person] [Person] -> Bool
inCommon listA listB = or[isMemberP x listB \\ x<-listA]

//Start = inCommon (getGrandParents Ethan) (getGrandParents Olivia)

areCousins :: Person Person -> Bool
areCousins p q = inCommon (getGrandParents p) (getGrandParents q) && not(inCommon (getParents p) (getParents q))
//Start = areCousins Ethan Olivia //True
//Start = areCousins Ethan Ava //False
//Start = areCousins George Harry //False
//Start = areCousins George Isla //False


//::RedDots::

//3. Write a function that will return a list of names of everyone related to that person who can come to a family gathering
//Not including dead people.

(isChildOf) p q = isMemberP q (getParents p)

//Start = Ethan isChildOf George
//Start = Ethan isChildOf Ava

getChildren p = [ x \\ x<-personsList | x isChildOf p]

//Start = getChildren Jack
//Start = getChildren Ethan

isMarried {marriageStatus=Married}=True
isMarried {marriageStatus}=False

//Start = isMarried Ethan
//Start = isMarried Jack

areMarried p q = inCommon (getChildren p) (getChildren q)&& isMarried p && isMarried q

//Start = areMarried Jack Amelia
//Start = areMarried Jack Ethan

extendedFamily p = [x\\ x<-removeDupP((flatten[(getParents x)++(getGrandParents x)\\ x<-cousins])++cousins)| not(x equals p)]
	where
		cousins = flatten[getChildren x\\ x<-flatten[getChildren y \\ y<-(getGrandParents p)++(getParents p)]]

//Start = extendedFamily Ethan
//Start = extendedFamily Olivia
//Start = extendedFamily Harry

familyGathering :: Person -> [String]
familyGathering p = [ x.name \\ x<- extendedFamily p| x.livingStatus]
//Start = familyGathering Ethan //["George","Isla","Amelia","Emily","Olivia","Oliver","Harry"] (Lily and Ava are not here because Lily is divorced from Oliver, and hence are not invited)
//Start = familyGathering Freddie //[]
//Start = familyGathering Ava //[] (Parents are divorced, poor girl)


//4. Write a function that will test if two people can date.
canDate :: Person Person -> Bool
canDate p q
| areMarried p q = True
= not(isMemberP p (extendedFamily q))&&not(inCommon(getChildren p)(getChildren q))&& not(isMarried p) && not(isMarried q) && p.livingStatus && q.livingStatus
//Start = canDate Ethan Olivia //False (are related, even if not by blood)
//Start = canDate Ethan Ava //True 
//Start = canDate Oliver Lily //False (they are divorced, and have been married aka have a child)
//Start = canDate George Isla //True (they are married)
//Start = canDate Lily George //False (George is still married)
//Start = canDate Ava Olivia //True (not related, both single)
//Start = canDate Isla Ethan //False (mother/son)
//Start = canDate Lily Noah //False (both divorced, not related, but Noah is dead)

