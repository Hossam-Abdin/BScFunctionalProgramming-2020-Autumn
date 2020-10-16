module hof_comp

import StdEnv

//2. A positive number in the form like: 10, 200, 8, 1000, 40, 1, 9, 7000, 30000000
// (which has only one non-zero digit at first place) is called a "clean number"(0 is not included)
// find all clean numbers in the list of lists and write to a list

isClean :: Int -> Bool
isClean 0 = False
isClean n
| n < 0 = False
| n < 10 = True
= (n rem 10) == 0 && isClean (n/10)

f2Aux :: [Int] -> [Int]
f2Aux list = filter isClean list

f2 :: [[Int]] -> [Int]
f2 list = flatten (map (f2Aux) list)

// Start = f2 [[1,2,7,10,50,102,33],[],[0,9,90],[11,980,20]] //[1,2,7,10,50,9,90,20]
// Start = f2 [[1..20],[10,20..60],[30,20.. -10]]//[1,2,3,4,5,6,7,8,9,10,20,10,20,30,40,50,60,30,20,10]


//3. find the middle element of each sublists of list.(hint:use !!)
// list of even length like [0,1,2,3] choose 2
// add them together using foldr
f3 :: [[Int]] -> Int
f3 list = foldr (+) 0 (map (f3Aux) list)

f3Aux :: [Int] -> Int
f3Aux list = list!!((length list)/2)


// Start = f3 [[1,2,3], [1..4]] //5


// Tuples
// fst, snd, splitAt, zip
// Start = snd("HOSSAM", 29)
// Start = zip (["A", "B", "c"], [1, 2, 3])

// Start = fst (splitAt 3 ['a'..'z'])

// Start = zip ([1..3],[4..6])

// toInt, toReal
// Start = toInt(sqrt(toReal(sum [1..5])))

// lambda expression
isPrime x = [x \\ i <- [2..(x-1)] | x rem i == 0] == []

// Start = isPrime 7

isEvPr :: Int -> Bool
isEvPr n = isEven n && isPrime n

// Start = filter (\a = isEven a && isPrime a) [1..10]

// Start = map (\any_name = any_name+1) [1..10]

/*
	delete 2 elements after the n-th element of each sublist in the list.
  solve it using map
*/

// Start = del [[1,2,3],[3],[4,5,6,7],[],[0,1,6,3,5]] 3  //[[1,2,3],[3],[4,5,6,7],[],[0,1,6]]
//Start = del [[1,2,6,8,3],[9,3],[0,5,0,6,7],[],[0,1,6,3,5,8]] 2  //[[1,2,6],[9,3],[0,5,7],[],[0,1,5,8]]
//Start = del [[0],[3],[4which has only one non-zero digit at first plac,5,6],[],[0,1,6,9,7,3,5]] 0  //[[0],[3],[6],[],[6,9,7,3,5]]

del_nth :: [Int] Int -> [Int]
del_nth list n 
| length(list) < (n+2) = list
= take n list ++ drop (n+2) list 

del :: [[Int]] Int -> [[Int]]
del [] _ = []
del list n = map (\sub_list = del_nth sub_list n) list

// Start = del [[1,2,3],[3],[4,5,6,7],[],[0,1,6,3,5]] 3  //[[1,2,3],[3],[4,5,6,3,7],[],[0,1,6]]

// List comprehension

// Start = [x \\ x <- [1..5] | isEven x]

//Some special cases
// Start = [(a, b) \\ a<-[1..10] & b<-[1..10]]
// Start = [(a, b) \\ a<-[1..10] , b<-[1..10]]

/**4
  * Write a function that checks if each elements in the list appear even times.
  
  * For example, checkEven [1,1,2,2,2,2,3,5,3,5] = True
  */

//checkEven :: [Int] -> Bool

//Start = checkEven [1,1,2,2,2,2,3,5,3,5] // True

//Start = checkEven [1,1,2,2,1] // False

//Start = checkEven [] //False

// qsort

f :: [Int] -> Int
f list = length even_list
  where
    even_list = filter isEven list

// Start = f [1..10]

isEven4 :: Int -> Bool
isEven4 n
| n < 4 = False
| otherwise = (n rem 2) == 0  

Start = isEven4 2