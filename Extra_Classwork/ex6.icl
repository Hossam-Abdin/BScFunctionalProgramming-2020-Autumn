module ex6

import StdEnv

// Start = filter isEven [1..10] // [2,4,6,8,10]

odd x = not (isEven x)
// Start = odd 23 // True

// Start = filter (not o isEven) [1..100] // [1,3,5,..,99]

// Start = takeWhile isEven [2,4,6,7,8,9] // [2, 4, 6]

// Start = dropWhile isEven [2,4,6,7,8,9] // [7, 8, 9]

plus x y = x + y

successor :: (Int -> Int)
successor = plus 1

// Start = successor 4 // 5

succ = (+) 1

//Start =  succ 5 // 6

// the function adding 5 to something
// Start = map (plus 5) [1,2,3] // [6,7,8]


// Start = until ((<)10) ((+)2) 0 // 12

// iteration of a function

// Start = iterate inc 1 // infinite list [1..]

// Start = map inc [1, 2, 3]        // [2, 3, 4]

// Start = map double [1, 2, 3]     // [2, 4, 6]

// lambda expressions
// Start = map (\x = x*x+2*x+1) [1..10] // [4,9,16,25,36,49,64,81,100,121]

// Start = foldr (+) 10 [1, 2, 3]   // 16

product [] = 1
product [x:xs] = x * product xs

product1 = foldr (*) 1

// Start = product1 [1, 2, 3] // 6

and1 [] = True
and1 [x:xs] = x && and xs

and2 = foldr (&&) True

// Start = and2 [True, True, False] // False

sum1 = foldr (+) 0

Start = sum1 [1, 2, 3] // 6


///////////////
//Exercises
// 1. Map a list of functions to a value. E.g. mapfun [f,g,h] x = [f x, g x, h x]
//mapfun :: [Int -> Int] Int -> [Int]


//Start = mapfun [inc, inc, inc] 3 // [4, 4, 4]


// 2. compute n! factorial using foldr
//f :: Int -> Int


//Start = f 5 // 120


// 3. rewrite flatten using foldr 
// (for the following list [[1,2], [3, 4, 5], [6, 7]] => [1,2,3,4,5,6,7])
//flat :: [[Int]] -> [Int]


//Start = flat [[1,2], [3, 4, 5], [6, 7]] // [1,2,3,4,5,6,7]


// 4. using map and foldr compute how many elements are altogether in the following list 
// [[1,2], [3, 4, 5], [6, 7]] => 7
//g :: [[Int]] -> Int


//Start = g [[1,2], [3, 4, 5], [6, 7]] // 7


// 5. using map extract only the first elements of the sublists in 
// [[1,2], [3, 4, 5], [6, 7]] => [1,3,6]
//firsts :: [[Int]] -> [Int]


//Start = firsts [[1,2], [3, 4, 5], [6, 7]] // [1,3,6]


// 6. compute the squares of the elements of a list using map
// [1, 2, 3] -> [1, 4, 9]
//sq :: Int -> Int


//sqrs :: [Int] -> [Int]


//Start = sqrs [1, 2, 3] // [1, 4, 9]


// 7. same as 6. with lambda expression 
//sqrs_lambda :: [Int] -> [Int]


//Start = sqrs_lambda [1, 2, 3] // [1, 4, 9]


