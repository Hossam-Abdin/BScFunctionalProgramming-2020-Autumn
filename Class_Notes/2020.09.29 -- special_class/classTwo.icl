module classTwo
import StdEnv
//Note from last class:

//Logical operators in Clean (from previous class):
// && ->and
// || ->or
// == -> equal
// <> -> not equal !=

//Start=6 <> 7//True
//Start= 2 <> 2 //False

//GENERAL INFORMATION
/*Lists-sequence of objects of same type
, separated values
[] -> empty list->list of whatever
*/

//EXAMPLES:
//Start=[1,2,3]//[Int]//list of integers
//Start=[1..100]//[Int]
//Start=[1,6..16]//[Int]
//Start=[1,3..14]//[Int]
//Start=[1.4,3.2,5.4,5.5]//[Real]
//Start=[True,True,False,True]//[Bool]
//Start=['a','b','c']//[Char]
//Start=["Welcome","to","the","second","practice","class"]//[String]
//Start=[[1..7],[1,3,5],[1,4]]//[[Int]] this is called list of lists
//list1 is basically a function which takes no parameters and returns a list
list1::[Int]
list1 =[1,2,3,4,5,6]
//Start=list1

//BUILD IN FUNCTIONS OVER LISTS
//Start=[0,1,2,3,4,5,6,7,8]!!7//RETURNS THE ELEMENT AT INDEX 5->***THE INDEX OF THE FIRST ELEMENT IS 0
//Start = hd [1, 2, 3, 4, 5]//1 			-RETURNS THE FIRST ELEMENT OF A LIST
//Start = tl [1,2,3,4,5]//[2, 3, 4, 5]	-RETURNS THE LIST OBTAINED BY REMOVING THE FIRST ELEMENT OF A LIST      
//Start = drop 2 [1,2,3, 4, 5] //[3,4,5]	-drop N List ->  RETURNS THE LIST OBTAINED BY REMOVING THE FIRST N ELEMENTS OF A LIST
//Start = take 2 [1, 2, 3, 4, 5] //[1,2]	-take N List ->  RETURNS A LIST OF THE FIRST N ELEMENTS OF THE GIVEN LIST  
//Start = take 2 [1..10]++drop 2 [1..10] //[1,2,3,6,7]	-LIST1 ++ LIST2 ->LISTS CONCATINATION 
//Start = take 2 [1..10]++drop 2 [1..10]
//Start = reverse [1, 2, 3]  //[3,2,1]      -RETURNS THE GIVEN LIST IN REVERSED ORDER      
//Start = length [0,1,2,3] //4     		-RETURNS HE LENGTH OF A GIVEN LIST
//Start = length []
//Start = last [1, 2, 3]//3         		-RETURNS THE LAST ELEMENT OF A LIST
//Start = init [1, 2,3] //[1,2] 				-RETURNS THE LIST OBTAINED BY REMOVING THE LAST ELEMENT OF A LIST 	       
//Start = isMember 2 [1, 2, 3] //True    
//Start = isMember 5 [1,3,7,9] //False		-isMember elem list -> RETURNS True or False DEPENDING ON IF elem IS PART OF list OR NOT
//Start = flatten [[1,2], [3, 4, 5], [6, 7]] //[1,2,3,4,5,6,7] ->CREATES A LIST OUT OF A LIST OF LISTS  
//Start = sum [1,2,3,4]//10					
//Start = sum [1.2,3.4]//4.6				-SUM OF A LIST
//Start = and [True,True,False] //=True && True && False=False
//Start = or [True,False,True]//=True||True||False=True

//Question 1: How to express hd using last(and the other way around)
//Start = last(reverse [1,2,3]) == hd [1,2,3]//= last [3,2,1]=1

//LET'S PREDICT THE OUTPUT (compilation error is also an option)
//Start = take 2 []  //[]              
//Start = drop 5 [1,2,3] //[]  
//Start = drop 5 [1,3..11] //[11] <> 11       
//Start = take 2 [1 .. 10]         
//Start = drop ([1..5]!!2) [1..5] //[4,5]
//Start = [1..5]!!2 //=1,2,3,4,5
//Start = reverse [1,3..10]=[9,7,5,3,1]           
//Start = [5,4 .. -5]  == reverse [-5..5]       
//Start = isMember 0 []     //False          
//Start = isMember -1 [1..10]//False         
//Start = isMember ([1..5]!!1) [1..5] //True
//Start = isMember 1 [1,2,3] && isMember 2 [1,2,3] //are 1 and 2 members of a list
//Start = isMember [1] [1,2,3] //True
//Start = isMember [1,2] [[1,2],[1,2,3]]//True

/*
[1,2,3,4,5]=[1,2,3:[4,5]]
[1,2,3]=[1:[2,3]]=[1,2:[3]]=[1,2,3:[]]
list
[x:rest]
[1,2,3,4,5]=[x:rest]
x=1
rest =[2,3,4,5]
*/
//[1,2,3,4,5]=[x:y]
//x=1, y=[2,3,4,5]

//[1,2,3,4,5]=[x,y:z]
//x=1,y=2,z=[3,4,5]

//[1]=[x:y]
//x=1, y=[]

//GENERATE THE FOLLOWING LISTS:
//numbers from 10 to -10
//Start=[10,9 .. -10] 
//even numbers from 1 to 20
//Start = [2,4,..20]
//odd numbers from 1 to 20
//Start = [1,3..20]
//TASK1 Given a list of 3 integers.Find the sum of it WITHOUT using the sum function
mySum::[Int]->Int
mySum [first,second,third]=first+second+third
//Start=mySum [2,3,5]//10

//TASK2 Given a list of intgers with length at least 2. Write a function which will return the sum of the first 2 elements of that list
//solution1
sumTwo1::[Int]->Int
sumTwo1 [x,y:z]=x+y
//solution2
sumTwo2::[Int]->Int
sumTwo2 list = sum (take 2 list)

//There are also other possible solutions of course
//Start=sumTwo1 [1..10]
//Start=sumTwo2 [2,3,4]
//Start=sumTwo1 [2..6]==sumTwo2 [2..6]

//TASK3 Write a function which calculates the length of a list WITHOUT using the length function
length1::[Int]->Int
length1 []=0
length1 [x:y]=1+length y
//Version 2
length1Two::[Int]->Int
length1Two []=0
length1Two list=1+ length1Two(tl list)
//Start=length1 [1..100]

//TASK4 Write a function which takes a list and returns a list containing the first and last two elements of that list.
//Handle the case when there are not enough elements (return empty list in that case!)
first2last2::[Int]->[Int]
first2last2 list
|length list<2=[]
=take 2 list ++ drop ((length list) - 2) list

//Start=first2last2 [1,2,3,4,5,6]
//Start=first2last2 [1,2]
//Start=first2last2 [1]

//TASK5 Given a list of Integers, write a function which will sum the elements with even indexes only.(the index of the head of a list is 0->EVEN)
//Return 0 if the list is empty
onlyEvenIndex::[Int]->Int
onlyEvenIndex []=0
onlyEvenIndex [x]=x
onlyEvenIndex [x,y:z]=x+onlyEvenIndex z

//Start=onlyEvenIndex [0,1,2,3,4,5,6]
//Start=onlyEvenIndex [0,1,2]
//Start=onlyEvenIndex []

//TASKS FOR YOU TO SOLVE(the solutions will be uploaded):

//TASK6 Given a list of integers, check if that list is symmetrical
//[1,2,3,2,1], [1,1,1,1], [1,2,3,3,2,1]... are symmetrical lists, lists which are the same starting from both left and right side
isSim::[Int]->Bool
isSim list1 = list1 == (reverse list1)
//Start = isSim [1,2,3,2,1]//True
//Start = isSim [1,2,3]
//TASK7: Given a list of lists of integers, calculate the sum of all the elements of that list
//[[1,2,3],[1],[2,2]]=1+2+3+1+2+2=11
sumListOfLists::[[Int]]->Int
sumListOfLists listOfLists =sum(flatten listOfLists)
//Start =  sumListOfLists [[1,2],[4,4,4,4,5]]
//TASK8: Given a lis of integers. Find its middle element.(**GIven that the list has at least 1 element**)
//[1,2,3]->2
//[1,2,3,4]->2
middle::[Int]->Int
middle list =  hd (drop ((length list)/2) list)
//Start = middle [1,2,3,4]
//Start = middle [1,2,3]

