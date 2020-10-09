module fourthClass
import StdEnv


//Function that converts integer to a list(hw2)
numToList::Int->[Int]
numToList num
|num<10=[num]
=numToList (num/10)++ [num rem 10]

//Start=numToList 123
//Start=numToList 12343412

//Function that converts list of digitis to a number [1,2,3]=123 = 1*10^2+2*10^1+3*10^0
listToNum::[Int]->Int
listToNum [] = 0
listToNum list= last list + 10*(listToNum (init list))
/*Start=listToNum [1,2,3,4]
4+10*(listToNum [1,2,3])=4+10*(3+10*(listToNum [1,2]))=4+10*(3+10*(2 +10(listToNum [1]))
=4+10*(3+10*(2 +10(1+10*0))=1234*/
//Start=listToNum [2,1,2]


//Fibonacci sequence: 1,1,2,3,5,8,13,21,34,55.....
//The first two elements are 1's and every other element equals to the sum of its 2 predecessors(the 2 previous number in the Fib seq)

//Calculate the nth Fibonacci number:
nthFib::Int->Int
nthFib 1=1
nthFib 2=1
nthFib n=nthFib (n-1) + nthFib (n-2)
//nthFib 4=nthFib 3+nthFib 2=nthFib 2+nthFib 1+nthFib 2=1+1+1=3
//Start=nthFib 4
//Start=nthFib 12

//Give the first n Fibonacci numbers
firstNFib::Int->[Int]
firstNFib n
|n==0=[]
=firstNFib (n-1)++[nthFib n]
//Start=firstNFib 10

//Given two lists of Int. Write a function which will return a list containing 
//at each position the bigger number from those lists at that position
//Example: [2,3,6] [1,7,0]->[2,7,6]
//version 1: The list have same length
version1::[Int] [Int]->[Int]
version1 [] [] =[]
version1 [x:xs] [y:ys]
|x>y=[x]++ version1 xs ys
=[y]++ version1 xs ys
//Start=version1 [2,3,6] [1,7,0] 

//version 2: The list can have different length  [2,3,4] [5,2] ->[5,3]
version2::[Int] [Int]->[Int]
version2 [] [] =[]
version2 _  [] =[]
version2 []  _ =[]
version2 [x:xs] [y:ys]
|x>y=[x]++ version2 xs ys
=[y]++ version2 xs ys
//Start=version2 [2,3,3,6] [1,7,0,8,656,56,56] 

//Higher order functions

//map
//map func list ->applies func to each element of the list
//map func [1,2,3]=[func 1,func 2, func 3]
//Task: Given a list of Integers, increment each element by 5
inc5::Int->Int
inc5 a=a+5

incEachElem::[Int]->[Int]
incEachElem list =map inc5 list
//Start=incEachElem [1,2,3]

//Using lambda function
incEachElemLambda::[Int]->[Int]
incEachElemLambda list=map (\any=any+5) list
//Start=incEachElemLambda [1,2,3]
//Start=map length [[1,2],[3,4],[123123,2,2,2,2,2,2]]//=[f [1,2],f [3,4],f [123123]]
//Start=map length 34234//doesnt work!!!!
rem2Each::[Int]->[Int]
rem2Each list=map  (\x= x rem 2)  list
//Start=rem2Each [2,4,5,3,4,4]
//LAMBDA FUNCTION : (\parameter=whatever u do with it)

//filter
//filter condition list -> keeps only the elements of list for which condition is true 
//filter isEven [1,2,3,4,5] =[2,4]
//Task: Given a list of Integers , keep only the once greater than 5
greaterThan5::Int->Bool
greaterThan5 x=x>5
keepGreater5::[Int]->[Int]
keepGreater5 list =filter greaterThan5 list
keepGreater5L::[Int]->[Int]
keepGreater5L list =filter (\x=x>5) list
keepGreater5third::[Int]->[Int]
keepGreater5third list =filter ((<)5) list//=filter ((<)5) [6,5,7]  =(5<6) (5<5) (5<7)
//5<6 or 6<5 ->5<6 is correct
//Start=keepGreater5L [12,1,6,4,8,5,6,8]
//Start=keepGreater5third [12,1,6,4,8,5,6,8]

//takeWhile
//takeWhile condition list -> takes element by element all until it doesn't find one for which the condition is False
//Start=takeWhile isEven [2,4,6,7,8,10] //=[2,4,6]
//Start=dropWhile isEven [2,4,6,7,8,10] //=[7,8,10]
//Start=dropWhile isEven [2,4,6,8,10]// =[]
//Start=takeWhile isEven [1,2,4,6,7,8,10] //=[]
//Task: Given a list of Integers, get all the elements until the first that is less than 5
takeWhileEx::[Int]->[Int]
takeWhileEx list=takeWhile(\x=x>5) list
takeWhileEx1::[Int]->[Int]
takeWhileEx1 list=takeWhile ((<)5) list
//Start=takeWhileEx1 [6,7,8,5,3,4,67]

//dropWhile
//dropWhile condition list ->similar to takeWhile but instead of taking the elements it drops them
//Task: Given a list of Integers, get all the elements after the first that is less than 5
//dropWhileEx::[Int]->[Int]
//Start=dropWhileEx [6,7,4,4,45,23]

//foldr
//Start = foldr (-) 0 [1,2,3]//(1-(2-(3-0)) 

//foldl
//Start = foldl (-) 0 [1,2,3]
//(((0+1)+2)+3)==(1+(2+(3+0)) 
//Start =foldr (+) 10 [1,2,3]==foldl (+) 10 [1,2,3]
//foldl (+) 0 list==sum list ==foldr (+) 0 list

/*Start=foldl (&&) True [True,True]==foldr (&&) True [True,True]
False && _=False
True &&_=_
and[True,False,True]=False
*/
/*Start=foldr (&&) False [True,True]
(True&&(True&&False))=False*/
//EXTRA TASKS:
//1.Write a function which decides if a number is Prime

//2. Find the middle element of a list

//3.Find the average element of a list

//4.Given two numbers, check if there first 2 digits are equal(given that the numbers have at least 2 digits)


/*
f::[Int]->[String]
f []=[]
f [x:xs]
|x rem 2==0=["even"]++f xs
=["odd"]++f xs
Start= f [1,2,3,4]
*/
Start = (not o (5==4))











