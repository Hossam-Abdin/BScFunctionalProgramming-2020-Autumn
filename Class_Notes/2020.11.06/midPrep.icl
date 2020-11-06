module midPrep
import StdEnv

//SHORT MIDTERM PREP
//1.Given an Int, Check if the number is either prime and greater than 100 or not prime and odd
isPrime::Int->Bool
isPrime x = length [a\\a<-[1..x]|x rem a== 0] == 2
isPrime2::Int Int ->Bool
isPrime2 _ 1 =True
isPrime2 1 _ =False
isPrime2 num ite
|num rem ite ==0 =False
=isPrime2 num (ite-1)
task1::Int->Bool
task1 x = isPrime x && x>100 || isPrime x==False && isOdd x
//Start = task1 3 //False
//Start = task1 131//True
//Start = task1 213//True
//Start = task1 0 //False

//2.Given a list of Reals, keep the elements which have odd 
//sum of the digits of the toInt version of that number

numToList::Int ->[Int]
numToList n
|n<10=[n]
=numToList (n/10) ++ [n rem 10]
isOddSumDigits::Real->Bool
isOddSumDigits n = isOdd(sum (numToList (toInt n)))
task2::[Real]->[Real]
task2 list = filter isOddSumDigits list
//Start = task2 [3.2,	5.234,	4.3,	2.3,	32.345435]//[3.2,5.234,32.345435]
//Start = task2 [4.5,6.7]//[6.7] because toInt 4.5 = 4, toInt 6.7 = 7
//Start = task2 [4.51,6.5] //[4.51] because toInt 4.51 = 5, toInt 6.5 = 6

//3.Given a list of numbers and two Ints a and b,
//write a function which removes all the elements which are in the [nthFib a,nthFib b] interval
//nthFib is a function that we have already solved in class:
//gives back the nth Fibonacci number
//a<b
//Input-->List a b
nthFib::Int->Int
nthFib 1=1
nthFib 2=1
nthFib n = nthFib (n-1)+nthFib (n-2)
//Start = nthFib 4
task3::[Int] Int Int->[Int]
//task3 list a b =[x\\x<-list|  (x>nthFib b) || (x<nthFib a)]
task3 list a b = filter (\x=(x>nthFib b) || (x<nthFib a)) list
//Start = task3 [3,5,6,3,4,7,8,6] 3 5//[6,7,8,6] because nthFib 3= 2 and nthFib 5 =5
//Start = task3 [1..200] 1 20//[]
//Start = nthFib 20
//Start = task3 [1..10] 1 5//[6,7,8,9,10]

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

//5.Given a list of tuples of Ints.
//Write a function which will generate a tuple of two lists like
//[(1,2),(3,4),(5,6)]->([1,3,5],[2,4,6])
task5::[(Int,Int)]->([Int],[Int])
task5 list = ([fst a\\a<-list],[snd a\\a<-list])
//Start = task5 [(1,2),(3,4),(5,6)]
//Start = task5 [(3,2)]//([3],[2])
//Start = task5 [(a,a+5)\\a<-[1..10]]//([1,2,3,4,5,6,7,8,9,10],[6,7,8,9,10,11,12,13,14,15])













