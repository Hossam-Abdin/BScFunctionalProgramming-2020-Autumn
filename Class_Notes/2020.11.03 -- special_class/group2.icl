module group2
import StdEnv

//1. Given a list of lists of Integers,
//for each sublist keep only the numbers which have at most 3 divisors

number_of_divisors :: Int -> Int
number_of_divisors n = length [a \\ a <- [1..n] | n rem a ==0 ]

max3div::[[Int]]->[[Int]]
max3div list = map (\sublist = filter (\x = number_of_divisors x <= 3) sublist) list

//Start = max3div [[],[2,1,6,5],[4],[8,9,18]]

//2.Given a list of number, generate a list of triples like
//(num,product,sum), where product and sum are the product and sum of the digits of num

digits :: Int -> [Int]
digits x
| x < 10 = [x]
=  [x rem 10] ++ digits (x/10)

generate_triple :: Int -> (Int, Int, Int)
generate_triple n = (n, prod digits_of_n, sum digits_of_n)
where
	digits_of_n = digits n

task2::[Int]->[(Int,Int,Int)]
task2 list = map generate_triple list

//Start = task2 [4,34,2342,23,123,325]
// 2342 -> (2342, 2*3*4*2, 2+3+4+2)

//3.Create a multiplication table like:
//[[1*1,1*2,....,1*n],[2*1,2*2,....,2*n]...[n*1,n*2,....,n*n]]
//where n is a given Int
multTab::Int->[[Int]]
multTab n = [[a*b \\ b <- [1..n]] \\ a <- [1..n]]

//Start = multTab 5

//4.Given an Int, find the sum of its digit on power of the position of that digit
//Example = 863=8^3+6^2+3^1
sumPowDig::Int->Int
sumPowDig n = sum [x^y \\ x <- digits n & y <- [1..]]

//Start = sumPowDig 111
//Start = sumPowDig 2435
//5.Given a list of triples (Int,Int,Int), give back a list containing
//only the triples which have exactly 2 prime numbers

is_prime :: Int -> Bool
is_prime 1 = False
is_prime n = [a \\ a<-[1..n] | n rem a == 0] == [1,n]
// is_prime n = sum [1 \\ a<-[1..n] | n rem a == 0] == 2

has_two_primes :: (Int, Int, Int) -> Bool
has_two_primes (a,b,c) = length (filter is_prime [a,b,c]) == 2

task5::[(Int,Int,Int)]->[(Int,Int,Int)]
task5 list = filter has_two_primes list

//Start = task5 [(2,3,1),(5,4,4),(6,5,11),(2,2,2)]

/*6.Given a list of Ints and a unary function defined on Ints
Write a function which will find the element  which will be maximal after the given function is applied to it
For [] give back -1
[1,2,3,4,5] ((*) (~1))  -> 1
[1,2,3,4,5] ((*) 2)  -> 5
[2,4,6,8,10] -> 10
*/
// f6 :: [Int] (Int->Int) -> Int
// f6 [] _ = -1
// f6 [a] _ = a
// f6 [a,b:xs] f
// | f a < f b = f6 [b:xs] f
// = f6 [a:xs] f

f6Aux :: [Int] (Int->Int) Int -> Int
f6Aux [x] f our_max = x
f6Aux [x:xs] f our_max
| f x == our_max = x
= f6Aux xs f our_max

f6 :: [Int] (Int->Int) -> Int
f6 [] f = -1
f6 list f = f6Aux list f (maxList (map f list))

//Start = f6 [1,2,3,4,5] ((*) (~1))  //1
//Start = f6 [1,2,3,4,5] ((*) 2)  //5


/*7.Given a list and an Int n,
regroup the list into a list of lists of length n
e.g. [1,2,3,4,5] 2 -> [[1,2],[3,4],[5]]
*/
f7::[Int] Int -> [[Int]]
f7 [] _  = []
f7 list n
= [take n list] ++ f7 (drop n list) n

// Start = f7 [1,2,3,4,5] 2
// [[1,2]] ++ f7 [3,4,5] 2 = [[1,2]] ++ [[3,4]] ++ f7 [5] 2 = [[1,2]] ++ [[3,4]] +[[5]] ++ [[]] = [[1,2],[3,4],[5]]

// Start = f7 [1,2,3,4,5] 2
// Start = drop 2 [5] // []
// Start = f7 [1,2,3,4,5] 2 //[[1,2],[3,4],[5]]
// Start = f7 [1..10] 6 //[[1,2,3,4,5,6],[7,8,9,10]]




//Given a list of football teams and a boolean, if the latter is:

//True: generate matches in which all teams face each other twice (home and away matches).

//False: generate matches in which all teams face each other once.

//Use list comprehensions. If the number of teams is less than 2, return an empty list, since there can't be any matches.

// GenerateMatches :: [Char] Bool -> [(Char,Char)]
// GenerateMatches list m
// | m = [(a, b) | a <- list, b <- list | a <> b]
// = [(a, b) | a <- list, b <- list | a < b]

//Start = GenerateMatches ['A', 'B', 'C', 'D'] True // [('A','B'),('A','C'),('A','D'),('B','A'),('B','C'),('B','D'),('C','A'),('C','B'),('C','D'),('D','A'),('D','B'),('D','C')]

//Start = GenerateMatches ['A', 'B', 'C', 'D'] False // [('A','B'),('A','C'),('A','D'),('B','C'),('B','D'),('C','D')]

//Start = GenerateMatches [] True // []

//Start = GenerateMatches ['A'] False // []

//Given a list of non-negative numbers arrange them from smallest to largest

//so that each item will be bigger than the previous one exactly by 1.

//It may need some additional numbers to be able to accomplish that.

//Determine the minimum number of additional numbers needed.

// makeListConsecutive2 :: [Int] -> Int
// makeListConsecutive2 l = num (sort l )

// num :: [Int] -> Int
// num [] = 0
// num [x] = 0
// num [x,y:xs] = (y-x-1) + num [y:xs]

// makeListConsecutive2 :: [Int] -> Int
// makeListConsecutive2 list = (maxList list - minList list) + 1 - (length list)

// Example: makeListConsecutive2 [6, 2, 3, 8] -> 3, We need to add 4, 5 and 7.
// [2,3,4,5,6,7,8] 8-2+1
//Start = makeListConsecutive2 [6, 2, 3, 8] // 3

//Start = makeListConsecutive2 [0, 3] // 2

//Start = makeListConsecutive2 [5, 4, 6] // 0

//Start = makeListConsecutive2 [6, 3] // 2

//Start = makeListConsecutive2 [1] // 0


leastfactorial :: Int -> Int
leastfactorial n = check n (product n)

check :: Int [Int] -> Int
check n [x:xs]
|n <= x = x
=check n xs

product :: Int -> [Int]
product n = map (\x = prod [1..x]) [1..n]

// Start = product 6 // gives factorials of 1,2,..6

// foldr (*) 1 == prod
// dropWhile

// about \x
// I know the role of \\ , but \
map (\x = x*2) list
