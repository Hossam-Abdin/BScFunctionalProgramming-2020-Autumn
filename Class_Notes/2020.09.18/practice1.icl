module practice1
import StdEnv

//Start = 5
//Start = 1+2

// Int, Real, Bool, String
// Start = "any string"
// Int: 1, 2,3 ,-3, ..
// Real: 1.5, 2.5, 2.3...
// Bool: True, False

//Start = sqrt 4.0
//Start = sin 60.0

// Start = True
// Bool operators: <, >, <=, >=, <>, &&, ||

// Start = 5 > 4

// Define a function maxi which takes two Integer parameters
// and decides which one is bigger
maxi :: Int Int -> Int
maxi x y
| x > y = x
//| otherwise = y
= y

//if ( x> y)
	///return x
//else
	//return y


//Start = maxi 5 4 // 5
//Start = maxi -5 4 // 4


// Decide if Integer is odd.
myIsOdd :: Int -> Bool
myIsOdd x
| x rem 2 == 1 = True
= False

myIsOdd2 :: Int -> Bool
myIsOdd2 x = (x rem 2 == 1)

//Start = myIsOdd2 3

// We get three numbers as parameters,
// decide if thrid one is sum of two others

myIsSum :: Int Int Int -> Bool
myIsSum x y z = (z == x+y)

// We get three numbers as parameters,
// decide if any of them is sum of two others

myIsSum2 :: Int Int Int -> Bool
myIsSum2 x y z
| x == y + z = True
| y == x + z = True
| z == x + y = True
= False

myIsSum3 :: Int Int Int -> Bool
myIsSum3 x y z
| (x == y + z) || (y == x+ z) || (z == x + y) = True
= False

myIsSum4 :: Int Int Int -> Bool
myIsSum4 x y z = ((x == y + z) || (y == x+ z) || (z == x + y))


// recursion
// Add the numbers from 1..N
addN :: Int -> Int
addN x
| x == 1 = 1
= (addN (x-1)) + x

// Start = addN 5
//addN 5
//| 5 == 1 -> (addN 4) + 5 -> (addN 3) + 4 + 5
//-> (addN 2) + 3 + 4 + 5 -> (addN 1) + 2 + 3 + 4 + 5
//-> 1 + 2 + 3 + 4 + 5 -> 15

// Recursion: function calling itself.



// Start = 2^3

// find factorial of N
// N! = 1 * 2 * 3... * (N-1) * N = (N-1)! * N
// 0! = 1
factorialN :: Int -> Int
factorialN x
| x == 0 = 1
= (factorialN (x-1)) * x

// Start = factorialN 5
//factorialN 5 -> facotrialN 4 * 5 -> factorialN 3 * 4 * 5
//-> facotorialN 2 * 3 * 4 * 5 -> facotiralN 1 * 2 * 3 * 4 * 5
//-> factorialN 0 * 1 * 2 * 3 * 4 * 5 ->
//1 * 1 * 2* 3* 4* 5 -> 120

// Given Integer, find last digit
//120 -> 0
//124 -> 4
//-10 -> 0
//5 -> 5

lastDigit :: Int -> Int
lastDigit x = x rem 10

// Start = lastDigit 124

// Given integer number, find sum of its digits

//Start = sumDigits 12345 // 15
//Start = sumDigits 5 // 5
//Start = sumDigits -54 // 9

//sumDigits abcdefg = sumDigits abcdef   + g

// Start = -14 rem 10

sumDigits :: Int -> Int
sumDigits x
| x < 0 = sumDigits (~x) // ~ unary minus
| x < 10 = x
= (x rem 10) + sumDigits (x / 10)


//Start = sumDigits -123414

//sumDigits -123414   123414
//sumDigits -123414 -> sumDigits 123414

//Start = 5.2/2.0


numToList :: Int -> [Int]
numToList x
|x == 0  = []
= numToList (x/10) ++  [abs(x rem 10)]

sum1 :: [Int] -> Int
sum1 x
| x == [] = 0
| otherwise = hd x + sum1 (tl x)

Start = sum1 (numToList -123)
