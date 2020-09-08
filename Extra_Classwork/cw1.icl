module cw1

import StdEnv

// 1. Using recursive function generate a list with elements from 1 to x,
// x is function parameter (a dot-dot expression is not good).

//listGen :: Int -> [Int]

//Start = listGen 10


// 2. Compute the sum of each sublist.
// [[1,2], [3,4,5], [6,5,9,7], [], [8]] -> [3,12,27,0,8]

//sums :: [[Int]] -> [Int]

//Start = sums [[1,2], [3,4,5], [6,5,9,7], [], [8]]

// 3. Insert x as first element in every sublist of a list.
// if the sublist was empty then x will be the only element in the new sublist.
// [[1,2], [3,4,5], [6,5,9,7], [], [8]] 100 -> [[100,1,2], [100,3,4,5], [100,6,5,9,7], [100], [100,8]]

// insx :: [[Int]] Int -> [[Int]]

//Start = insx  [[1,2], [3,4,5], [6,5,9,7], [], [8]] 100
