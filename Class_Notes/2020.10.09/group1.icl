module group1
import StdEnv

// Higher order functions, function that takes another function as argument.


f :: Int Int (Int Int -> Int) -> Int
f a b op = op a b


// Start = f 2 3 (+) // (+) 2 3
// Start = f 2 3 (*) // (*) 2 3
// Start = f 2 3 (\x y = x * y - 1)    // LAMBDA



someFunc :: Int Int -> Int
someFunc x y = (x + y - 1) * x

// Start = f 2 3 (\x y = (x + y - 1) * x)

//infix form -> 2 + 3
//prefix form -> (+) 2 3

f2 :: Int Int (Int Int -> Int) -> Int
f2 a b op
| a < b = op a b
| b < a = op b a

// Start = f2 3 2 (-) // (-) 2 3 -> 2 - 3
// Start = f2 4 2 (^) // (^) 2 4 -> 2 ^ 4


// filter, map, foldr, takeWhile, dropWhile


// Start = filter isEven [1..10] //[2,4,6,8,10]
//Start = filter isEven [1..10]
// Start = filter isEven [1,2,3,4,5,6,7,8,9,10]
// Start = filter ((>)5) [1..10] //[1,2,3,4]
// Start = filter (\x = x < 5) [1..10] //lambda

// ((>)5)       -> 5 >

isPrime :: Int -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n = isPrimeAux n 2

isPrimeAux :: Int Int -> Bool
isPrimeAux n x
| n == x = True
| n rem x == 0 = False
= isPrimeAux n (x+1)




// Start = filter isPrime [1..100]
// Start = filter (\x = x<10 )  [1..100]

isListContained :: [Int] [Int] -> [Int]
isListContained list1 list2 = removeDup (filter (\x = isMember x list2) list1)



// Start = isListContained [2,5,3,6,8,3,2,5,7,8,47] [1..10]  // [2,3,5,6,7,8]

// Start = isMember 5 [1,2,3,4,5]

primesLessThanN :: Int -> [Int]
primesLessThanN n = primesLessThanNAux n 2 []


primesLessThanNAux :: Int Int [Int] -> [Int]
primesLessThanNAux n c list
| c == n = list
| isPrime c = primesLessThanNAux n (c+1) (list ++ [c])
= primesLessThanNAux n (c+1) list


// primesLessThanN n = takeWhile (\a = a < n  ) [ x \\ x<-[1..] | isPrime x ] //[1,2,3,5,7,11,13...]





// [12:35 PM] Naspalic Dalibor

// 	1. Given an integer and a list of integers, write a function which
// 	deletes that number when it appears.
// */


myFun :: Int [Int] -> [Int]
myFun n [] = []
myFun n [x:xs]
| x <> n = [x: myFun n xs]
=  myFun n xs

myFilter :: (a -> Bool) [a] -> [a]
myFilter cond [] = []
myFilter cond [x:xs]
| cond x = [x: myFilter cond xs]
= myFilter cond xs


// myFun n list = filter (\x = x <> n) list






// Start = map (isEven) [1..10] //[False,True,False,True,False,True,False,True,False,True]
// Start = map ((+) 1) [1..10] //[2,3,4,5,6,7,8,9,10,11]
// ((+) n)  x -> (+) n x -> n + x

// Start = map ((-) 5) [1..10] //[4,3,2,1,0,-1,-2,-3,-4,-5]
//((-) 5) 3 -> (-) 5 3 -> 5 - 3
//((-) 5) 8 -> (-) 5 8 -> 5 - 8
// Start = map (\x = 5 - x) [1..10] //[4,3,2,1,0,-1,-2,-3,-4,-5]
// ^ BE VERY CAREFUL OF PREFIX ORDER OPERATIONS

// Start = foldr (+) 0 [1..3]
// foldr foldl
// foldr operation neutralElement List

// foldr (+) 0 [1..3]
// foldr (+) ((+) 3 0) [1,2]
// foldr (+) (foldr 2 ((+) 3 0)) [1]
//foldr (+) (foldr 1 (foldr 2 ((+) 3 0))) []
//(foldr 1 (foldr 2 ((+) 3 0)))
// (+) 1 ((+) 2 ((+) 3 0))
//(+) 1 ((+) 2 (3 + 0))
//(+) 1 (2 + (3 + 0))
//1 + (2 + (3 + 0))
//1 + (2 + 3)
//1 + 5
//6
// (+) 3 0
// (+) 2 3
// (+) 1 5
// 6

//Start = foldr (-) 10 [1..3]
//this is NOT 10 - 1 - 2 - 3 = 4
// Start = 1 - (2 - (3 - 10))


// implement map
// implement filter
// filter cond list - > list


