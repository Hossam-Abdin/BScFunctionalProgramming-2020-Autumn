module stuff
import StdEnv

/**2
  * Write a function that takes a list of integers and returns a list of

  * result integers based on how many integers were in the parameter list.

  * For 1 integer 'a', it will return that integer modulus 2. (a rem 2)

  * For 2 integers 'a','b' , it will return a list of all integers from the first to the second. [a..b]

  * For 3 integers 'a','b','c' , it will return (a*(b^c))

  * For 4 integers 'a','b','c','d', it will return a list of the sum of 'a' and 'b' and the sum of 'c' and 'd'.
  */

Listing :: [Int] -> [Int]
Listing myList
| length myList == 0 = []
| length myList == 1 = [(hd myList) rem 2]
| length myList == 2 = [(hd myList)..(last myList)]
| length myList == 3 = [(hd myList)*(myList!!1 ^ last myList)]
| length myList == 4 = [myList!!0 + myList!!1 , myList!!2 + myList!!3]

ListingAlt :: [Int] -> [Int]
ListingAlt [] = []
ListingAlt [a] = [a rem 2]
ListingAlt [a,b] = [a..b]
ListingAlt [a,b,c] = [a*(b^c)]
ListingAlt [a,b,c,d] = [a+b,c+d]

//[ elem, elem]
//(1,2,3)

//Start = someFunc isEven ((<)3) [1..10]

// a < b //infix form <
//(<) a b //prefix form
//Start = Listing [5] //[1]

//Start = Listing [4,10] //[4,5,6,7,8,9,10]

//Start = Listing [3,5,2] //[75]

//Start = Listing [13,29,1030,307] //[42,1337]

//Start = Listing [] //[]

//currying
//when your function doesn't have enough variables.

//Start =  ((+)3) 1

grid :: Int -> [[(Int,Int)]]
grid n = [[(rowNo,colNo)\\colNo<-[1..n]]\\rowNo<-[1..n]]

//Start = grid 5

build :: Int -> [[Int]]
build n = [ (repeatn (r-1) 0)++[0..(n-r)] \\ r<-[1..n] ]
//Start = build 10