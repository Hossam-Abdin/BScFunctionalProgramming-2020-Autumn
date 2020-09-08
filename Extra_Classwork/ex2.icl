module ex2

import StdEnv

l1 :: [Int]
l1 = [1, 2, 3, 4, 5]
l2 :: [Bool]
l2 = [True, False, True]
l3 :: [Real->Real]
l3 = [sin, cos, sin]
l4 :: [[Int]]
l4 = [[1, 2, 3], [8, 9]]
l5 :: [a]
l5 = []
l6 :: [Int]
l6 = [1..10]
l7 :: [Int]
l7 = [1..]

Start = l4

/* [1..10]     
   [1,2..10]   
   [1,0.. -10] 
   [1.. -10]   
   [1..0]      
   [1..1]      
   [1,3..4]  
   [1..]       
   [1,3..]     
   [100,80..]  */

// Start = [1,2..10]

// Start = hd [1, 2, 3, 4, 5]       
// Start = tl [1, 2, 3, 4, 5]      
// Start = drop 2 [1, 2, 3, 4, 5]   
// Start = take 2 [1, 2, 3, 4, 5]   
// Start = [1, 2, 3] ++ [6, 7]      
// Start = reverse [1, 2, 3]        
// Start = length [1, 2, 3, 4]      
// Start = last [1, 2, 3]           
// Start = init [1, 2, 3]           
// Start = isMember 2 [1, 2, 3]     
// Start = isMember 5 [1, 2, 3]     
// Start = flatten [[1,2], [3, 4, 5], [6, 7]]  

// Start = take 2 []                
// Start = drop 5 [1,2,3]           
// Start = take 2 [1 .. 10]         
// Start = drop ([1..5]!!2) [1..5]  

// Start = reverse [1,3..10]           
// Start = reverse [5,4 .. -5]         
// Start = isMember 0 []               
// Start = isMember -1 [1..10]         
// Start = isMember ([1..5]!!1) [1..5] 

// some list patterns
triplesum :: [Int] -> Int
triplesum [x, y, z] = x + y + z

// Start = triplesum [1,2,4] // 7  [1,2,3,4] error
head :: [Int] -> Int
head [x : y] = x

// Start = head [1..5] // 1

tail :: [Int] -> [Int]
tail [x : y] = y

// Start = tail [1..5] // [2,3,4,5]

// omitting values
f :: Int Int -> Int
f _ x = x

// Start = f 4 5 // 5

// patterns with list constructor
g :: [Int] -> Int
g [x, y : z] =  x + y

// Start = g [1, 2, 3, 4, 5] // 3

// patterns + recursively applied functions
lastof :: [Int] -> Int
lastof [x] = x
lastof [x : y] = lastof y

// Start = lastof [1..10] // 10

// recursive functions on lists
sum1 :: [Int] -> Int
sum1 x
| x == [] = 0
| otherwise = hd x + sum1 (tl x)

// Start = sum1 [1..5] // 15 

sum2 :: [Int] -> Int
sum2 [] = 0
sum2 [first : rest] = first + sum2 rest

// Start = sum2 [1..5] // 15 

// recursive function with any element pattern
length1 :: [Int] -> Int
length1 [] = 0
length1 [_ : rest]= 1 + length1 rest

// Start = length1 [1..10] // 10

// Exercises

// 1. Evaluate the following expressions:

//Start = (take 3 [1..10]) ++ (drop 3 [1..10])

//Start = length (flatten [[1,2], [3], [4, 5, 6, 7], [8, 9]])

//Start = isMember (length [1..5]) [7..10]

//Start = [1..5] ++ [0] ++ reverse [1..5]

// 2. Generate lists 
// from -10 to 10

// even numbers from 1 to 100

// every 10th element from 0 to 100


// 3. Operations with lists: write functions for the followings
// keep the head of every sublist e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [1, 3, 5]
//heads :: [[Int]] -> [Int]

//Start = heads [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

// 4. Keep the tails of a list in 2 versions 
// e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [[2, 3], [4], [7, 8, 9]] 
//tails :: [[Int]] -> [[Int]]


//Start = tails [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

//tailsd :: [[Int]] -> [[Int]]

// Start = tailsd [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

// 5. Rewrite flatten with ++
//lc :: [[Int]] -> [Int]


//Start = lc [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

// 6. Test if a list is symmetrical
//sim :: [Int] -> Bool


// Start = sim [1, 2, 1]

// 7. Keep the first 2 and the last 2 elements of a list
//droptake2 :: [Int] -> [Int]


//Start = droptake2 [1, 2, 3, 4, 5, 6, 7, 8, 9]