module Ashour
import StdEnv

//[1,2,3,4]
//[1,2,3,4,1,2,2,3,3,4,1,2,3,2,3,4]
//[[1],[2],[3],[4],[1,2],[2,3],[3,4],[1,2,3],[2,3,4] ]

//we need to get all subsequences of a list
//given a certain subsequence length
//this length can change

func2 :: [Int] -> [[Int]]
func2 list = flatten[ func1 list subseqlength \\ subseqlength <- [1..(length list)]  ]

func1 :: [Int] Int -> [[Int]]
func1 list n
| length list < n = []
= [(take n list)] ++ (func1 (tl list) n)

//Start = func1 [1..4] 3 //[[1,2,3],[2,3,4]]
//Start = func1 [1..4] 2 //[[1,2],[2,3],[3,4]] only generates the list of pairs
Start = func2 [1..4]

/*
Type error [Ashour.icl,13,comprehension]: cannot unify demanded type with offered type:
 [[Int]]    <- this is the demanded type
 [[[Int]]]  <- this is the offered type
*/

//removeDup