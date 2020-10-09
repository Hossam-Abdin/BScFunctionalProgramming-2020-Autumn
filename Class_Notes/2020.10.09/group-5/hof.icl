module hof

import StdEnv


// Fibonacci
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

fib2 :: Int -> Int
fib2 n = fibAux n 1 1

fibAux :: Int Int Int -> Int
fibAux 0 a b = a
fibAux i a b = fibAux (i-1) b (a+b)

// Start = fib2 5

// hofs

// Important : filter, takeWhile, dropWhile, foldr, prod, map

// Start = foldr (*) 1 [1..3]

// Start = foldr (+) 0 [1,2,3]

// Start = prod [1..3]

// Start = map isEven [2,4..10]

// Start = foldr (&&) True (map isEven [2,4..10])

// r : 2
// l : 0 - 1 - 2 - 3 

isOne :: Int -> Bool
isOne n = n == 1

// Start = filter isOdd [1..10]

// Start = takeWhile isOne [1,1,1,7]

// Start = dropWhile isOdd [1..10]
// Exercises for hofs

// 1. For every sublist, eliminates its elements
// Until the current element is a prime number
// Requirement: 
//  - Use map instead of recursion
//  - Use dropWhile

isPrime :: Int -> Bool
isPrime 1 = False
isPrime n = isPrimeAux 2 n

isPrimeAux :: Int Int -> Bool
isPrimeAux i n 
| n == i = True
= (n rem i) <> 0 && isPrimeAux (i+1) n

// Start = isPrime 5

f1Aux :: [Int] -> [Int]
f1Aux list = dropWhile (not o isPrime) list

f1 :: [[Int]] -> [[Int]]
f1 list = map f1Aux list

// Start = f1 [[1, 2, 3, 4], [9, 7, 6, 5, 4, 3, 0], [3, 5, 7, 9], [], [128, 64, 32]] // [[2,3,4],[7,6,5,4,3,0],[3,5,7,9],[],[]]
// Start = f1 [[1], [4], [2]] // [[],[],[2]]
// Start = f1 [[5..10], map (\x = x + 5) [1..4], [], [4,12,8,5, 4]] // [[5,6,7,8,9,10],[7,8,9],[],[5,4]]


//2. A positive number in the form like: 10, 200, 8, 1000, 40, 1, 9, 7000, 30000000
// (which has only one non-zero digit at first place) is called a "clean number"(0 is not included)
// find all clean numbers in the list of lists and write to a list

//Start = f2 [[1,2,7,10,50,102,33],[],[0,9,90],[11,980,20]] //[1,2,7,10,50,9,90,20]
//Start = f2 [[1..20],[10,20..60],[30,20.. -10]]//[1,2,3,4,5,6,7,8,9,10,20,10,20,30,40,50,60,30,20,10]


//3. find the middle element of each sublists of list.(hint:use !!)
// list of even length like [0,1,2,3] choose 2
// add them together using foldr


// Start =f3 [[1],[1,2],[1,2,3]] //5
//Start =f3 [[1],[1,2],[1,2,3],[3,3,0,8,9]] //5
//Start = f3 [[10,20,30],[1,3]] //23

del_nth :: [Int] Int -> [Int]
del_nth list n 
| length(list) < (n+2) = list
= take n list ++ drop (n+2) list 

del :: [[Int]] Int -> [[Int]]
del [] _ = []
del [x:xs] n = [del_nth x n:del xs n]  


//Start = del [[1,2,3],[3],[4,5,6,7],[],[0,1,6,3,5]] 3  //[[1,2,3,3],[3],[4,5,6,3,7],[],[0,1,6]]
//Start = del [[1,2,6,8,3],[9,3],[0,5,0,6,7],[],[0,1,6,3,5,8]] 2  //[[1,2,3],[9,3],[0,5,7],[],[0,1,5,8]]
//Start = del [[0],[3],[4,5,6],[],[0,1,6,9,7,3,5]] 0  //[[0],[3],[6],[],[6,9,7,3,5]]