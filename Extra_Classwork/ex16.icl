module ex16

import StdEnv

// Sample test, earlier midterm
// For the mark 2 ex1 and ex2 and ex3 and ex4 must be done
// For a mark >2 ex.1,2,3,4 + any from ex. 5(1p), 6(1p), 7(1p), 8(1p)

// 1. Create using an input list of tuples a new list of tuples like:
// [(1,1), (2,6), (3,9)] -> [(1,1,2), (2,6,8), (3,9,12)] 

//create :: [(Int, Int)] -> [(Int, Int, Int)]

//Start =  create [(1,1), (2,6), (3,9)]
 

// 2. Compute the average of tuple elements using map
//averages :: [(Int, Int)] -> [Int]

//Start = averages [(1,1), (2,6), (3,9)]


// 3. Put the product of the sublist elements in a list, you must use foldr
//sublistsp :: [[Int]] -> [Int]

//Start = sublistsp [[1, 2, 3], [3, 4], [5, 7, 1]] // [6,12,35]


// 4. Generate the following list of lists
// [[1],[2,1],[3,2,1],[4,3,2,1],[5,4,3,2,1]]
//genNlist :: Int -> [[Int]]

//Start = genNlist 5


// 5. "Reverse" a number: 1234 -> 4321
//revnr :: Int -> Int

//Start = revnr 1234


// 6. Delete every second element of a list
// e.g. [1,2,3,4,3,2,4,5] -> [1,3,3,4]
//delsecond :: [Int] -> [Int]

//Start = delsecond [1,2,3,4,3,2,4,5]


// 7. Insert a value after every element of a list 
// [1,2,3,4,5] 0 -> [1,0,2,0,3,0,4,0,5,0]
//insertx :: [Int] Int -> [Int]/

//Start = insertx [1,2,3,4,5] 0


// 8. Insert 0 after every digit of a number: 123 -> 102030
//digit0 :: Int -> Int

//Start = digit0 123 

