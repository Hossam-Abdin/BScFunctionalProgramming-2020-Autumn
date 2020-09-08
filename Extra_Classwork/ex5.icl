module ex5

import StdEnv


// Operations with lists: write functions for the followings
// without map or foldr.

// 1. Keep every non-empty sublist.
// e.g. [[1, 2, 3], [], [3, 4],[],[],[5, 7, 8, 9],[]] -> [[1, 3, 5],[3,4],[5,7,8,9]]
//f1 :: [[Int]] -> [[Int]]


//Start = heads [[1, 2, 3], [3, 4], [5, 7, 8, 9]]


// 2. Keep the last two elements of the sublists in 2 versions (ignore if can not be done)
// e.g. [[1, 2, 3], [3, 4], [], [5, 7, 8, 9]] -> [[2, 3], [3,4], [8, 9]] 
//last2 :: [[Int]] -> [[Int]]


//Start = last2 [[1, 2, 3], [3, 4], [], [5, 7, 8, 9]]


// 3. Triple the head elements of the elements of a list.
//triples :: [[Int]] -> [[Int]]


//Start = triples [[1..5],[1..10],[],[1],[1,2,3],[1..4]]


// 4. Check if the numbers of a list are even. 
// e.g. [1,2,4,5]  -> [False, True, True, False] 
//evens :: [Int] -> [Bool]


//Start = evens [1..5]


// 5. Add 100 as last number of a list.
//add100 :: [Int] -> [Int]


//Start = add100 [1..8]


// 6. Check if the numbers of a list are multiple of 10.
//ismult10 :: [Int] -> [Bool]


//Start = ismult10 [1..20]


// 7. Collect in a list the last digists of the numbers of a list.
//lastdigits :: [Int] -> [Int]


//Start = lastdigits [1..35]


// 8. Compute the cube of the numbers of a list.
//cubes :: [Int] -> [Int]


//Start = cubes [1..10]
//Start = cubes []

// 9.  Compute the average of the numbers from 1..N (N positive).
//addn :: Int -> Int


//Start = addn 5
//Start = addn 0
//Start = addn -2
//Start = addn 10


// 10. Compute the length of every sublist of a list
//lens :: [[Int]] -> [Int]


//Start = lens [[1,2,3],[5,6],[],[7,8,9,10]]

