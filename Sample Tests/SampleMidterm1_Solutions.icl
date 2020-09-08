module SampleMidterm1_Solutions
import StdEnv

/**1
  * Write a function, that takes a list of functions, and a list of

  * tuples (Int, Int) where the first Int indicates which function to

  * use and the second Int acts as a parameter and returns a list of

  * the results.
  
  * For example: Router [isEven,isOdd] [(1,2),(2,4),(1,57)] = [True, False, False]
  */

Router :: [(a->b)] [(Int,a)] -> [b]
Router listFunc listRoute
| isEmpty listFunc || isEmpty listRoute = []
= [ (listFunc!!(funcNum-1)) param\\ (funcNum, param) <-listRoute]

//Start = Router [isEven,isOdd] [(1,2),(2,4),(1,57)] //[True, False, False]

//Start = Router [((+)1),((*)2),((^)2),((rem) 100)] [(4,13),(2,23),(3,5),(1,1336),(4,23)] //[9,46,32,1337,8]

//Start = Router [(\x = [1..x]),(\x = [n\\n<-[1..x]|x rem n ==0]),(\x = [x,x*2..x*10])] [(2,36),(1,13),(3,5),(2,128),(3,1)]  //[[1,2,3,4,6,9,12,18,36],[1,2,3,4,5,6,7,8,9,10,11,12,13],[5,10,15,20,25,30,35,40,45,50],[1,2,4,8,16,32,64,128],[1,2,3,4,5,6,7,8,9,10]]

//Start = Router [] [(4,13),(2,23),(3,5),(1,1336),(4,23)] //[]

//Start = Router [isEven, isOdd] [] //[]


/**2
  * Write a function that takes a list of integers and returns a list of

  * result integers based on how many integers were in the parameter list.

  * For 1 integer 'a', it will return that integer modulus 2. (a rem 2)

  * For 2 integers 'a','b' , it will return a list of all integers from the first to the second. [a..b]

  * For 3 integers 'a','b','c' , it will return (a*(b^c))

  * For 4 integers 'a','b','c','d', it will return a list of the sum of 'a' and 'b' and the sum of 'c' and 'd'.
  */

Listing :: [Int] -> [Int]
Listing [] = []
Listing [a] = [a rem 2]
Listing [a,b] = [a..b]
Listing [a,b,c] = [a*(b^c)]
Listing [a,b,c,d] = [a+b,c+d]

//Start = Listing [5] //[1]

//Start = Listing [4,10] //[4,5,6,7,8,9,10]

//Start = Listing [3,5,2] //[75]

//Start = Listing [13,29,1030,307] //[42,1337]

//Start = Listing [] //[]


/**3
  * Write a function that checks if a list of numbers is odd,even,odd,even...

  * For exmaple: SeqCheck [1,2,3,4,6] = False because 4 is even, but 6 is not odd.
  */

SeqCheck :: [Int] -> Bool
SeqCheck [] = False
SeqCheck seq = and[isEven (x+y)\\x<-seq & y<-[1..]]

//Start = SeqCheck [1..10] //True

//Start = SeqCheck [1,2,3] //True

//Start = SeqCheck [2,3,4] //False

//Start = SeqCheck [1,3,4,5] //False

//Start = SeqCheck [1,2,3,4,6,7] //False

//Start = SeqCheck [] //False


/**4
  * Write a function that checks if each elements in the list appear even times.
  
  * For example, checkEven [1,1,2,2,2,2,3,5,3,5] = True
  */

checkEven :: [Int] -> Bool
checkEven [] = False
checkEven nums = and[isEven(length(filter ((==)x) nums)) \\x<-nums]

//Start = checkEven [1,1,2,2,2,2,3,5,3,5] // True

//Start = checkEven [1,1,2,2,1] // False

//Start = checkEven [] //False


/**5
  * Write a function that takes two vectors, represented as lists, and returns their dot product.
  
  * The dot product of two vectors can be computed as:
  
  * < xa, xb, xc, ...> * < ya, yb, yc, ...> = (xa*ya) + (xb*yb) + (xc*yc) + ...
  
  * For example: DotProd [4,6,3] [6,3,7] = 24+18+21 = 63
  */

DotProd :: [Int] [Int] -> Int
DotProd vec1 vec2 = sum [x*y\\x<-vec1 & y<-vec2]

//Start = DotProd [4,6,3] [6,3,7] //63

//Start = DotProd [6,3,7] [4,6,3] //63

//Start = DotProd [5,2,6,8,3] [5,-8,5,-3,-5] //0


/**6
Given a list of characters, split it into a tuple in which the first part only contains digits ('0'..'9'),

the second part contains the rest. */

TwoLists :: [Char] -> ([Char], [Char])
TwoLists myList = (filter (\char = char >= '0' && char <= '9') myList, filter (\char = char >= 'a' && char <= 'z') myList)
//Start = TwoLists  ['1', 'a', '2', 'b', '3'] // (['1','2','3'],['a','b'])

//Start = TwoLists [] // ([],[])


/**7
 Given a list of lists, for each list, extract the first, middle and last element. */

Points3 :: [[Int]] -> [(Int, Int, Int)]
Points3 bigList = [(hd subList, subList!!((length subList)/2),last subList)\\subList<-bigList]

//Start = Points3 [[1..9], [2..6], [3..11], [1..10]] // [(1,5,9),(2,4,6),(3,7,11),(1,6,10)]

//Start = Points3 [[]] //[]


/**8

Find the 'unique' right triangle in the list eg. (3,4,5) and (4,3,5) are the same triangle. 

only one will appear in the answer list [(3,4,5),(4,3,5)] -> [(3,4,5)] */

f8::[(Int,Int,Int)]->[(Int,Int,Int)]
f8 list = f8aux (filter checkValid list)

f8aux :: [(Int,Int,Int)]->[(Int,Int,Int)]
f8aux [] = []
f8aux [a:b] = [a] ++ f8 (filter (notDup a) b)

checkValid :: (Int,Int,Int) -> Bool
checkValid (x,y,z) = (a<>b)&&(b<>c)&&(a+b>c)&&(a^2 + b^2 == c^2)
    where
    sorted = sort[x,y,z]
    a = sorted!!0
    b = sorted!!1
    c = sorted!!2

notDup :: (Int,Int,Int) (Int,Int,Int) -> Bool
notDup (x,y,z) (a,b,c) = (sort list1) <> (sort list2)
    where
    gcd1 = gcd x (gcd y z)
    gcd2 = gcd a (gcd b c)
    list1 = map (\elem = elem/gcd1) [x,y,z]
    list2 = map (\elem = elem/gcd2) [a,b,c]

//Start = f8 [(3,4,5),(4,5,6),(4,5,3),(6,8,10),(10,5,8),(-3,4,5)] //[(3,4,5)]

//Start = f8 [(1,1,1),(5,4,3),(3,4,5),(0,0,0)] //[(5,4,3)]


/**9

Use foldr to check if the square root of each integer in a list are all integers. */

f9 :: [Int] ->Bool
f9 myList = foldr (\ x y = y && ((sqrt (toReal x))==(toReal(toInt (sqrt (toReal x)))))) True myList

//Start = f9 [] //True

//Start = f9 [4,16,9] //True

//Start = f9 [1,8] //False

 
/**10 Insert sum of elements as last element in every sublist of a list. */

addSum :: [[Int]] -> [[Int]]
addSum bigList = [subList++[sum subList]\\subList<-bigList]

//Start = addSum [[1,2], [3,4,5], [6,5,9,7], [], [8]] //[[1,2,3],[3,4,5,12],[6,5,9,7,27],[0],[8,8]]