module ex12
import StdEnv

// 1. write a function duplicates which checks if there are neighbour duplicates in a list
//duplic :: [Int] -> Bool


//Start = duplic [1, 1]
//duplic [2]
//duplic [1, 2, 3, 4, 5, 6, 7, 8, 9]
//duplic [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 


// 2. write a function that removes neighbour duplicates in a list
//duplicrem :: [Int] -> [Int] 


//Start = duplicrem [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 


// 3. transform the sub-sub lists into one list of sublists
//f :: [[[Int]]] -> [[Int]]


// Start = f [[[1,2,3], [3,4,5]], [[1,2,3], [3,4,5], [7,8,9]]] 
// result : [[1,2,3],[3,4,5],[1,2,3],[3,4,5],[7,8,9]]


// 4.  generate the following list [(1,1),(2,2),(3,3),(4,4),(5,5)]
//l1 :: [(Int, Int)]


//Start = l1


// 5. generate [(1,2,3),(2,4,6),(3,6,9),(4,8,12),(5,10,15)]
//l2 :: [(Int, Int, Int)]


//Start = l2