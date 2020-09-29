module lecture8
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

//Start = l4

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

// Start = hd []
// Start = drop 5 [1,2,3]
// Start = take 2 [1 .. 10]
// Start = drop ([(1+0)..5]!!2) [1..5]

// Start = reverse [1,3..10]
// Start = reverse [5,4 .. -5]
// Start = isMember 0 []
// Start = isMember -1 [1..10]
// Start = isMember ([1..5]!!1) [1..5]



// some list patterns
// [x,y,z] -> x+y+z
triplesum :: [Int] -> Int
triplesum [] = 0
triplesum [a] = a
triplesum [a,b] = a+b
triplesum [a,b,c] = a+b+c
// triplesum list
// | list == [] = 0
// | lenght list == 1 = list!!0
// | length list == 2 = list!!0 + list!!1
// = list!!0 + list!!1 + list!!2


// Start = triplesum [1,2,4,6] // 7
// Start = triplesum [1,2,4,6] // 7  [1,2,3,4] error














head :: [Int] -> Int
head [x:xs] = x
// Start = head [1..5] // 1

tail :: [Int] -> [Int]
tail [x:xs] = xs
// Start = tail [1..5] // [2,3,4,5]

// omitting values
f :: Int Int -> Int
f _ b = b
// Start = f 4 5 // 5

// sum of first two elements
g :: [Int] -> Int
g [] = 0
g [a] = a
g [a,b:xs] = a+b

// Start = g [1, 2, 3, 4, 5] // 3

// patterns + recursively applied functions

lastof :: [a] -> a
lastof [x] = x
lastof [x:xs] = lastof xs

// Start = lastof [1..10] // 10



// Exercises

// 1. Evaluate the following expressions:

// Start = (take 3 [1..10]) ++ (drop 3 [1..10])

// Start = length (flatten [[1,2], [3], [4, 5, 6, 7], [8, 9]])

// Start = isMember (length [1..5]) [7..10]

//Start = [1..5] ++ [0] ++ reverse [1..5]


// 2. Generate lists
// from -10 to 10
// Start = [-10..10]
// even numbers from 1 to 100
// Start = [2,4..100]
// every 10th element from 0 to 100
// Start = [0, 10..100]


// 3. Operations with lists: write functions for the followings
// keep the head of every sublist e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [1, 3, 5]
heads :: [[Int]] -> [Int]
heads [] = []
heads [x] = [hd x]
heads [x:xs] = [hd x] ++ (heads xs)

// Start = heads [[1, 2, 3], [3, 4], [5, 7, 8, 9]]



// 4. Keep the tails of a list in 2 versions
// e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [[2, 3], [4], [7, 8, 9]]
// tails :: [[Int]] -> [[Int]]



//Start = tails [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

//tailsd :: [[Int]] -> [[Int]]

// Start = tailsd [[1, 2, 3], [3, 4], [5, 7, 8, 9]]


// 5. Rewrite flatten with ++
lc :: [[Int]] -> [Int]
lc [] = []
lc [x:xs] = x ++ (lc xs)


Start = lc [[1, 2, 3], [3, 4], [5, 7, 8, 9]] // [1, 2, 3] ++ lc ([[3, 4], [5, 7, 8, 9]]) // [1, 2, 3] ++ [3, 4] ++ lc ([[5, 7, 8, 9]])

 //  [1, 2, 3] ++ [3, 4] ++ [5, 7, 8, 9]



//TASK3 Write a function which calculates the length of a list WITHOUT using the length function
length1::[Int]->Int
length1 [] = 0
length1 [x:xs] = 1 + (length1 xs)

// Start=length1 [1..100]

//TASK4 Write a function which takes a list and returns a list containing the first and last two elements of that list.
//Handle the case when there are not enough elements (return empty list in that case!)
first2last2::[Int]->[Int]
first2last2 list = (take 2 list) ++ (drop ((length list ) - 2) list)
// Start=first2last2 [1,2,3,4,5,6]


//TASK5 Given a list of Integers, write a function which will sum the elements with even indexes only.(the index of the head of a list is 0->EVEN)
//Return 0 if the list is empty
onlyEvenIndex::[Int]->Int
onlyEvenIndex [] = 0
onlyEvenIndex [a] = a
onlyEvenIndex [x,y:xs] = x + onlyEvenIndex xs


// Start=onlyEvenIndex [0,1,2,3,4,5,6]
// Start=onlyEvenIndex [0,1,2]
// Start=onlyEvenIndex []


// 6. Test if a list is symmetrical
sim :: [Int] -> Bool
sim list = list == (reverse list)

// Start = sim [1, 2, 3, 2]



// 7. Don't Keep the first 2 and the last 2 elements of a list
droptake2 :: [Int] -> [Int]
// droptake2 list = take ((length list) - 4) (drop 2 list)
droptake2 list = init(init (tl (tl list)))
// Start = droptake2 [1, 2, 3, 4, 5, 6, 7, 8, 9]



//TASKS FOR YOU TO SOLVE(the solutions will be uploaded):

//TASK6 Given a list of integers, check if that list is symmetrical
//[1,2,3,2,1], [1,1,1,1], [1,2,3,3,2,1]... are symmetrical lists, lists which are the same starting from both left and right side
is_symmetrical :: [Int] -> Bool
is_symmetrical list = list == (reverse list)

//TASK7: Given a list of lists of integers, calculate the sum of all the elements of that list
//[[1,2,3],[1],[2,2]]=1+2+3+1+2+2=11
flatten_sum :: [[Int]] -> Int
flatten_sum list = sum (flatten list)

//TASK8: Given a list of integers. Find its middle element.(**GIven that the list has at least 1 element**)
//[1,2,3]->2
//[1,2,3,4]->2
middle :: [Int] -> Int
middle list = list!!((length list)/2)

//TASK2 Given a list of intgers with length at least 2. Write a function which will return the sum of the first 2 elements of that list
//solution1//
sumTwo1::[Int]->Int
sumTwo1 [a,b:xs] = a+b

sumTwo2::[Int]->Int
sumTwo2 list = (hd list) + (hd (tl list))