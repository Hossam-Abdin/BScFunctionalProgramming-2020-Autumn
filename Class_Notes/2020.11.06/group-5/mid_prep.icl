module mid_prep

import StdEnv
    
// qsort
qsort :: [Int] -> [Int]
qsort [a:xs] = qsort [x \\ x <- xs | x < a] ++ [a] ++ qsort [x \\ x <- xs | x >= a]

// Start = [(x,y) \\ x <- [1..10] , y <- [1..10] | isOdd x && isEven y]


// Start = qsort[5,4..1]

// mid_prep

/**1
  * Write a function, that takes a list of functions, and a list of
  * tuples (Int, Int) where the first Int indicates which function to
  * use and the second Int acts as a parameter and returns a list of
  * the results.
  * For example: Router [isEven,isOdd] [(1,2),(2,4),(1,57)] = [True, False, False]
*/

// applyFunc :: [(a -> b)] (Int,a) -> b
// applyFunc [functions] (a,b) = (functions!!(a-1)) b

// Router :: [(a -> b)] [(Int,a)] -> [b]
// Router functions tuples = map (\x = applyFunc functions x) tuples

// Router :: [(a->b)] [(Int,a)] -> [b]
// Router funcs args = [(funcs!!(func-1)) param \\ (func,param)<-args]


// Start = Router [isEven,isOdd] [(1,2),(2,4),(1,57)] //[True, False, False]

// Start = Router [((+)1),((*)2),((^)2),((rem) 100)] [(4,13),(2,23),(3,5),(1,1336),(4,23)] //[9,46,32,1337,8]

// Start = Router [(\x = [1..x]),(\x = [n\\n<-[1..x]|x rem n ==0]),(\x = [x,x*2..x*10])] [(2,36),(1,13),(3,5),(2,128),(3,1)]  //[[1,2,3,4,6,9,12,18,36],[1,2,3,4,5,6,7,8,9,10,11,12,13],[5,10,15,20,25,30,35,40,45,50],[1,2,4,8,16,32,64,128],[1,2,3,4,5,6,7,8,9,10]]

// Start = Router [] [(4,13),(2,23),(3,5),(1,1336),(4,23)] //[]

// Start = Router [isEven,isOdd] [] //[]


/**3
  * Write a function that checks if a list of numbers is odd,even,odd,even...
  * For exmaple: SeqCheck [1,2,3,4,6] = False because 4 is even, but 6 is not odd.
*/

SeqCheck :: [Int] -> Bool
// SeqCheck [] = True
// SeqCheck [a] = isOdd a
// SeqCheck [a,b:xs] = (isOdd a) && (isEven b) && (SeqCheck xs)
// SeqCheck list = and [(isOdd pos && isEven (list!!pos)) || (isEven pos && isOdd (list!!pos))  \\ pos <- [0..((length list)-1)]]
SeqCheck seq = and[isEven (x+y)\\x<-seq & y<-[1..]]

// Start = SeqCheck [1,2,4,3]
/**4 (modified)
  * Write a function that checks if each digit in the number appear even times.
  * For example, checkEven 1221 = True
*/

// Start = checkEven 1221 // = True


// /**6
// // Given a list of characters, split it into a tuple in which the first part only contains digits ('0'..'9'),
// // the second part contains the rest. */

// //Start = TwoLists  ['1', 'a', '2', 'b', '3'] // (['1','2','3'],['a','b'])

// /**9
// //Use foldr to check if the square root of each integer in a list are all integers. */

checkSquare :: Int -> Bool
checkSquare n = s == toReal(toInt(s))
    where   
        s = sqrt (toReal n)

f9 :: [Int] -> Bool
f9 list = foldr (\x y = True && y) True list
// f9 list = foldr && True [checkSquare x \\ x <- list]

// //Start = f9 [] //True
// Start = f9 [4,16,9] //True
// Start = f9 [1,8] //False


//4. Create a function which generates the first n Tribonacci sequence.
//0,0,1,1,2,4,7,13,24....
//an = a(n-1)+a(n-2)+a(n-3)
//See this link for more info
//https://www.geeksforgeeks.org/tribonacci-numbers/#:~:text=The%20Tribonacci%20Sequence%20%3A,%2C%20615693474%2C%201132436852%E2%80%A6%20so%20on
nthTri::Int->Int
nthTri 1=0
nthTri 2=0
nthTri 3=1
nthTri n= nthTri (n-1)+ nthTri (n-2) +nthTri (n-3)
task4::Int->[Int]
//task4 n =take n [nthTri a\\a<-[1..]]
task4 n = [nthTri a\\a<-[1..n]]
//Start = task4 5//[0,0,1,1,2]
//Start = task4 18//[0,0,1,1,2,4,7,13,24,44,81,149,274,504,927,1705,3136,5768]
//Start = task4 0//[]

isPrime n = isEmpty [x \\ x <- [2..(n-1)] | n rem x == 0]

listPrime n = take n [x \\ x <- [1..] | isPrime x]

// Start = listPrime 20

// Start = [(x,y) \\ x <- [1..4] & y <- [1..4]]

f1 :: Int -> Int
f1 n = n+1

// Start = f1 (~5564) //6

powers :: Int -> [Int]
powers x = takeWhile ((>)x) ([2^(a) \\ a <- [0..]])

// Start = powers 1000

// powers n = 1 + [x \\ x <- [2,4..] | (x < n == True)]