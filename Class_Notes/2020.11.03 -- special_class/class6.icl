module class6
import StdEnv

//1. Given a list of lists of Integers, 
//for each sublist keep only the numbers which have at most 3 divisors
numDiv::Int->Int
numDiv n = length [a\\a<-[1..n]| n rem a ==0]
numDivB::Int->Bool
numDivB n = length [a\\a<-[1..n]| n rem a ==0]<=3
max3div::[[Int]]->[[Int]]
//max3div list = map (\x= filter numDivB x) list//gives the same output as the next line
max3div list =[ filter numDivB x \\x<-list]
//Start = max3div [[],[2,1,6,5],[4],[8,9,18]]
//[[],[2,1,6,5],[4],[8,9,18]]


//2.Given a list of numbers, generate a list of triples like
//(num,product,sum), where product and sum are the product and sum of the digits of num
numToList::Int->[Int]
numToList x
|x<10 =[x]
=numToList (x/10) ++ [x rem 10]
aux1::Int->(Int,Int,Int)
aux1 n =(n, prod num, sum num)
where 
	num = numToList n

task2::[Int]->[(Int,Int,Int)]
//task2 list =[aux1 x\\x<-list]//gives the same output as the next line
task2 list =map aux1 list
//Start = task2 [4,34,2342,23,123,325]
//2342->prod [2,3,4,2]

//3.Create a multiplication table like:
//[[1*1,1*2,....,1*n],[2*1,2*2,....,2*n]...[n*1,n*2,....,n*n]]
//where n is a given Int
multTab::Int->[[Int]]
//multTab n = [[x*y] \\ x<-[1..n], y<-[1..n] ]
multTab n = [[x*y\\x<-[1..n]]\\y<-[1..n]]

//Start = multTab 5
//for y=0 y<5;y++
//	for x=0;x<3;x++

//4.Given an Int, find the sum of its digit on power of the position of the digit
//Example = 863=8^3+6^2+3^1
//Start = reverse (numToList 234223)
//  a<-digits & b<-[1..]
sumPowDig::Int->Int
sumPowDig n = sum [ a^b \\a<- reverse (numToList n) & b<-[1..]]
//sum [5^1, 3^2...]=5^1 +3^2..
//Start = sumPowDig 123//8
//Start = sumPowDig 435

//5.Given a list of triples (Int,Int,Int), give back a list containing 
//only the triples which have exactly 2 prime numbers
isPrime::Int ->Bool
isPrime n =length [a\\a<-[1..n]| n rem a ==0] ==2
//Start = isPrime 2
has2Prime::(Int,Int,Int)->Bool
has2Prime (a,b,c) = length(filter isPrime [a,b,c]) ==2
//Start = has2Prime (2,4,1)
//condtion ->has exactly 2 prime elements
task5::[(Int,Int,Int)]->[(Int,Int,Int)]
task5 list = filter has2Prime list
//Start = task5 [(2,3,1),(5,4,4),(6,5,11),(2,2,2)]

/*6.Given a list of Ints and a unary function defined on Ints
Write a function which will find the element  which will be maximal after the given function is applied to it
For [] give back -1
[1,2,3,4,5] ((*) (~1))  -> 1
[1,2,3,4,5] ((*) 2)  -> 5
*/
f6 :: [Int] (Int->Int) -> Int
f6 []  _ = -1
f6 [a] _ = a
f6 [a,b:rest] f
|f a <f b = f6 [b:rest] f
=f6 [a:rest] f
//Start = f6 [1,2,3,4,5] ((*) (~1))  //1
//Start = f6 [1,2,3,4,5] ((*) 2)  //5
//f x = (-1)*(3-x)^2
//Start = f6 [1,2,3,4,5] f //3  


/*7.Given a list and an Int n,
regroup the list into a list of lists of length n
e.g. [1,2,3,4,5] 2 -> [[1,2],[3,4],[5]]
*/
f7::[Int] Int -> [[Int]]
f7 [] _ =[]
f7 list n
|n > length list = [list]
=[take n list] ++f7 (drop n list) n
//Start = f7 [1,2,3,4,5] 2 //[[1,2],[3,4],[5]]
//Start = f7 [1..10] 6 //[[1,2,3,4,5,6],[7,8,9,10]]





















