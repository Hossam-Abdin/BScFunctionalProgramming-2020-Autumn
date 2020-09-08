module ex15

import StdEnv

// For the mark 2: ex1 and ex2 and ex3 and ex4 MUST be done
// For a mark greater then 2 ex.1,2,3,4 + any from ex. 5(1p), ex6(1p), ex7(1p), ex8(1p)

// 1. Compute the sum of the elements of the sublists of a list (you must use map) 
//plist :: [[Int]] -> [Int]

//Start = plist [[1, 2, 3], [3, 4], [5, 7, 8, 9], []]


// 2. Insert x as second element in every sublist of a list.
// if the sublist was empty then x will be the only element in the new sublist. 
// [[1,2], [3,4,5], [6,5,9,7], [], [8]] 10 -> [[1,10,2], [3,10,4,5], [6,10,5,9,7], [10], [8,10]]

//xlist :: [[Int]] Int -> [[Int]]

//Start = xlist [[1,2], [3,4,5], [6,5,9,7],[]] 10


// 3. Given a list of triple tuples make a tuple of 3 lists like:
//clist :: [(Int, Int, Int)] -> ([Int], [Int], [Int])

//Start = clist [(1,2,1), (3,1,4), (8,5,4), (5,7,0), (8,9,1)]  // ([1,3,8,5,8],[2,1,5,7,9],[1,4,4,0,1])


// 4. Generate the first 10 positive elements of a list in which a number is multiple of 25, but is not multiple of 100.
//glist :: [Int]

//Start = glist


// 5. Generate pairs like in the following: 
// [[1,2,3], [4,5], [6,1,8], []] -> [(1,6),(2,20),(3,48),(4,1)]
//fpair :: [[Int]] -> [(Int, Int)]

//Start = fpair [[1,2,3],[4,5],[6,1,8],[]]


// 6. Generate the following list
// [[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5],[1,2,3,4,5,6],
// [1,2,3,4,5,6,7],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9,10]]
//f :: Int -> [[Int]]

//Start = nlist 10


// 7. Check if a list contains 3 equal elements one after the other 
// (it can be anywhere in the list) 
// for [1,2,3,3,3,2,4,5] is True for [1 .. 5] is False
//dlist :: [Int] -> Bool

//Start = dlist [1,2,2,3,4,3,3,2,4,5,5,5] 


// 8. Extract the third element of the sublists (if there is no such element, ignore that sublist)
// [[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]]-> [3,5,8]
//qlist :: [[Int]] -> [Int]

//Start = qlist [[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]]

