module ex9

import StdEnv

// Types
//(1,'f')          :: (Int, Char)
//("world",True,2) :: (String, Bool, Int)
//([1,2],sqrt)     :: ([Int], Real->Real)
//(1,(2,3))        :: (Int, (Int,Int))

// Start = (1,'f')
// Start = ("world",True,2)
// Start :: ([Int], Real->Real)
// Start = ([1,2],sqrt)
// Start = (1,(2,3))

fst1 :: (a,b) -> a
fst1 (x,y) = x

// Start = fst1 (10, "world") // 10

snd1 :: (a,b) -> b
snd1 (x,y) = y

// Start = snd1 (1,(2,3))    // (2,3)

splitAt1 :: Int [a] -> ([a],[a])
splitAt1 n xs = (take n xs, drop n xs)

// Start = splitAt1 3 ['hello'] // (['h','e','l'],['l','o'])

search :: a [(a,b)] -> b | == a
search s [(x,y):ts]
| x == s = y
| otherwise = search s ts

// Start = search 3 [(1,1), (2,4), (3,9), (3,7)] // 9

zip1 :: [a] [b] -> [(a,b)]
zip1 [] ys = []
zip1 xs [] = []
zip1 [x : xs] [y : ys] = [(x , y) : zip1 xs ys]

// Start = zip1 [1,2,3] ['abc'] // [(1,'a'),(2,'b'),(3,'c')]

myzip :: [a] [b] -> [(a,b)]
myzip as bs = [(a , b) \\ a <- as & b <- bs]

// Start = myzip [1,2,3] [10, 20, 30, 40, 50] // [(1,10),(2,20),(3,30)]


// Start = [x * x \\ x <- [1..10]] // [1,4,9,16,25,36,49,64,81,100]

// Start = map (\x = x * x) [1..10]


// Start = [(x,y) \\ x <- [1..2], y <- [4..6]]  // [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6)]

// Start = [(x,y) \\ x <- [1..2] & y <- [4..6]] // [(1,4),(2,5)]

// Start = [(x,y) \\ x <- [1..5], y <- [1..x] | isEven x]  // [(2,1),(2,2),(4,1),(4,2),(4,3),(4,4)]

qsort :: [a] -> [a] | Ord a
qsort [] = []
qsort [h : xs] = qsort [x \\ x <- xs | x <  h] ++ [h] ++
                 qsort [x \\ x <- xs | x >= h]

Start = qsort [2,1,5,3,6,9,0,1] // [0,1,1,2,3,5,6,9]

/////////////////////////

// 1. generate a list with 10 times of 13 : [13,13,13,13,13,13,13,13,13,13]
//l1 :: [Int]
//l1 = 

//Start = l1


// 2. generate the following list [(1,1),(1,2),(2,1),(2,2)]
//l2 :: [(Int, Int)]
//l2 = 

//Start = l2


// 3. generate the following list [(1,3),(1,2),(1,1),(2,3),(2,2),(2,1),(3,3),(3,2),(3,1)]
//l3 :: [(Int, Int)]
//l3 = 

//Start = l3


// 4. generate the list [(1,5),(2,6),(3,7),(4,8),(5,9),(6,10)]
//l4 :: [(Int, Int)]
//l4 = 

//Start = l4


// 5. generate the list [1,2,2,3,3,3,4,4,4,4,...,10,..,10]
//l5 :: [Int]
//l5 = 

//Start = l5


// 6. generate the list [[1],[2,2],[3,3,3],[4,4,4,4],...,[10,..,10]]
//l6 :: [[Int]]
//l6 = 

//Start = l6
  
  
// 7. generate 6 pythagoras numbers : [(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20)]
//l7 :: [(Int, Int, Int)]
//l7 = 

//Start = l7
