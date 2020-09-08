module ex8
import StdEnv

// 1. write a recursive function that computes n at power k (n, k positive numbers)
//power :: Int Int -> Int

Start = power 2 5 // 32


// 2. add 3 to every element of a list
//f1 :: [Int] -> [Int]

// Start = f1 [1,5,3,1,6]  // [4,8,6,4,9]  


// 3. compute the double of the positive elements of a list [1, 2, -2, 3, -4] -> [2, 4, 6]
// hints: first filter it then use map 
//f2 :: [Int] -> [Int]

// Start = f2 [1, 2, -2, 3, -4] // [2, 4, 6]


// 4. write a function that keeps the integers of a list up to the first 0 encounterred 
// and then divides by 2 every element [1, 2, -2, 3, 0, -4] -> [0, 1, -1, 1]
// hints: use takeWhile then map
//f3 :: [Int] -> [Int]

// Start = f3 [1, 2, -2, 3, 0, -4] // [0, 1, -1, 1]


// 5. write a function for the square of every element of a list and sublists
// [[1,2],[3,4,5,6],[7,8]]  -> [[1,4],[9,16,25,36],[49,64]]  
// hint: map in map
//f4 :: [[Int]] -> [[Int]]

// Start = f4 [[1,2],[3,4,5,6],[7,8]] // [[1,4],[9,16,25,36],[49,64]]


// 6. Replicate n>0 times the element of a list e.g. n=3 [3..6] ->
// [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]
//f5 :: Int [Int] -> [[Int]]

// Start = f5 3 [3..6]


// 7. insert 0 at the beginning of each sublist
// [[1,2], [3,4,5], [6,7]] -> [[0,1,2], [0,3,4,5], [0,6,7]]
//f6 :: [[Int]] -> [[Int]]

// Start =  f6 [[1,2], [3,4,5], [6,7]]


// 8. filter the elements smaller then n, e.g. n=3 [1,5,3,2,1,6,4,3,2,1] -> [1,2,1,2,1]
//f7 :: Int [Int] -> [Int]

// Start = f7 3 [1,5,3,2,1,6,4,3,2,1] 


// 9. using notempty eliminate the empty lists: 
// [[1,2,3],[],[3,4,5],[2,2],[],[],[]] -> [[1,2,3], [3,4,5], [2,2]]

notempty :: [Int] -> Bool
notempty x = not (x == [])

//f8 :: [[Int]] -> [[Int]]

// Start = f8 [[1,2,3],[],[3,4,5],[2,2],[],[],[]]


// 10. compute the sum of the sublist using foldr [[1,2,3], [3,4,5], [2,2]] -> [6, 12, 4]
//f9 :: [[Int]] -> [Int]

// Start = f9 [[1,2,3], [3,4,5], [2,2]]


// 11. (bonus point) rewrite map using foldr
//mymap :: (a -> b) [a] -> [b]

// Start = mymap inc [1..10]
