module group1
import StdEnv



// tuples


list1 = [1124,523532,6757]
list2 = ["James","Jack","John"]
//nolist = ["james",1124]

// fun :: [Int] [Real] ...




//pair
james :: (String, Int)
james = ("James",25)



//Start = fst james //"James"
//Start = snd james //25
//fst and snd ONLY work on tuples of 2 elements



//Start = thd3("James", 1124, True)

//Start = fourth("James",1124,True,'a')

// Start = ("James") //singleton tuples do not exist

func1 :: Int Int -> (Int,Int)
func1 x y = (x,y)
//[ something , other ]
// Start = func1 2 3 //(2,3)


add :: (Int, Int) (Int, Int) -> (Int, Int)
// add a b = (fst a + fst b,snd a + snd b)
add (a, b) (c, d) = (a+c, b+d)


samePar :: (Int, Int) -> Bool
samePar (a, b) = isEven (a+b) // (isEven a && isEven b) || (isOdd a && isOdd b)


// Given list of tuples. Add all the tuples that have same parity elements and from that substract sum of tuples which ahve
// different parity elements



tupleSum :: [(Int,Int)] -> (Int, Int)
tupleSum list = (x1-x2,y1-y2) // (-7, -8)
where
    (x1,y1) = foldr add (0,0) (filter samePar list) // (6,8)
    (x2,y2) = foldr add (0,0) (filter (not o samePar) list) // (13,16)

// Start = tupleSum [] // (0,0)
// Start = tupleSum [(1, 2)] // (-1, -2)
// Start = tupleSum [(1, 2), (4, 4), (8,9), (2,4), (4,5)] // (3, 2)
// (filter samePar list) -> [(4,4), (2,4)]
// (0,0) + (2,4) -> (2,4)
// (2,4) + (4,4) -> (6,8)


//(filter (not o samePar) list) -> [(1,2), (8,9), (4,5)]
// (0,0) + (4,5) = (4,5)
// (4,5) + (8,9) = (12,14)
// (12,14) + (1,2) = (13,16)





// list comprehension

//  [ something with a \\  a<-[1..3]]
// a=1 b=1
// a=2 b=2
// a=3 b=3

// double the elements of a list [1,2,3,4,5]

// Start = [2*a \\ a <- [1..5], b <- [1..5]]
// map (\x = 2 *x ) [1..5]


// Start = [a + b \\ a <- [1..5] & b <- [1..5]]
// a = 1 b = 1
// a = 2 b = 2
// a = 3 b = 3
// a = 4 b = 4
// a = 5 b = 5

// Start = [(a,b)\\  a<-[1..3] , b<-[1..3] ]
// a=1 b=1
// a=1 b=2
// a=1 b=3
// a=2 b=1
// a=2 b=2
// a=2 b=3
// a=3 b=1
// a=3 b=2
// a=3 b=3



// find number of divisors of a number
// numOfDivisors :: Int -> Int
// numOfDivisors n = numOfDivisorsAux n 1 0


// numOfDivisorsAux :: Int Int Int -> Int
// numOfDivisorsAux n i count
// | n == i = 1 + count
// | n rem i == 0 = numOfDivisorsAux n (i+1) (count + 1)
// = numOfDivisorsAux n (i+1) count


// Start = numOfDivisors 5
numOfDivisors :: Int -> Int
numOfDivisors n = length [a \\ a <- [1..n] | n rem a == 0]

// Start = numOfDivisors 10

// decide if number is prime

isPrime :: Int -> Bool
isPrime n = (numOfDivisors n) == 2
// length [a \\ a <- [1..n] | n rem a == 0] == 2




// Write a function that reverses tuples from a list if the tuple members sum up to an even number.
reverseEven :: (Int, Int) -> (Int, Int)
reverseEven (a,b)
| isEven (a+b) = (b,a)
= (a,b)

// reverseEvenTuples :: [(Int, Int)] -> [(Int, Int)]
// reverseEvenTuples list = map reverseEven list
// reverseEvenTuples list = [reverseEven x \\ x <- list]


// Start = reverseEvenTuples [(1,2),(3,4),(5,7)] //[(1,2),(3,4),(7,5)]
// [(-1,3),(12,1),(0,0),(-4,-2)] //[(3,-1),(12,1),(0,0),(-2,-4)]

//  Write a function that takes every number in a list and generates a sublist of its first 5 multiples.
fiveMultiples :: [Int] -> [[Int]]
fiveMultiples list = map (\x = [x, 2*x, 3*x, 4*x, 5*x]) list


// Start = fiveMultiples [1..3] //[[1,2,3,4,5],[2,4,6,8,10],[3,6,9,12,15]]




// Given an integer n, find the minimal k such that

// k = m! (where m! = 1 * 2 * ... * m) for some integer m; k >= n.

// In other words, find the smallest factorial which is not less than n.

// example: leastfactorial 17 = 24.  because 17 < 24 = 4! = 1 * 2 * 3 * 4, while 3! = 1 * 2 * 3 = 6 < 17

leastfactorial :: Int -> Int
leastfactorial n = hd (dropWhile ((>) n) [prod [1..i] \\ i <- [1..]])


// Start = leastfactorial 17
// Start = take  [prod [1..i] \\ i <- [1..]]


//Start = filter isEven [1..10]
//Start = [ n \\ n<-[1..10] | isEven n ]

//Start = map (\x = x + 1) [1..10]
//Start = [ n+1 \\ n<-[1..10]  ]
