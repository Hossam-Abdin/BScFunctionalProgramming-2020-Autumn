module class10
import StdEnv
//INSTANCES--->
//Defining the behaviour of some types for different operators

//Start = "Hello "+"World"
instance + String 
where 
	+ a b=a+++b
//Start = "Hello "+++"World"

//Make an instance of the operator - for 
//lists of Int such that [1,2,3]-[2,2,2,3]=1
//overloading=== creating an instance
//Start = [1,2,3]-[2,2,2,3]
instance - [Int]
where
	- list1 list2 =[x\\x<-list1| isMember x list2 ==False]
//Start = [1,2,3]-[2,2,2,3,1,6]	

//Write an instance of operator + for 
//lists of Int such that [1,2,3]+[2,2,2,3]=[1,2,3]
instance + [Int]
where
	+ list1 list2 = sort(removeDup (list1++list2))
//Start = [1,2,3]+[2,2,2,3]	

::Student={name::String,uni::String,grades::[Int]}
Mark::Student
Mark={name="Mark",uni="ELTE",grades=[3,4,5,4,2]}
Mark2::Student
Mark2={name="Mark2",uni="ELTE",grades=[3,4,5,4,2]}
Peter::Student
Peter={name="Peter",uni="BME",grades=[4,5,5,5,5]}

//1.Write an instance of == which compares 2 students based on their average(gpa)
gpa::Student->Real
gpa student = toReal (sum student.grades)/toReal( length student.grades)
instance == Student
where
	== s1 s2 = gpa s1 == gpa s2
//Start = Mark == Mark2
//Start = Mark == Peter

//2. Given a list of Students, sort them using the sort function(overload < operator)sort
instance < Student
where
	< a b =gpa a< gpa b
//Start = sort [Mark2,Mark,Peter]
//Start = sort [Peter,Mark]

//3. Write an instance of == on (Tree a) such that two trees are equal 
//if and only if they have the same number of nodes
//P.S. The trees can be of different type
::Tree a=Node a (Tree a) (Tree a)|Leaf
Tree1::Tree Int
Tree1 = Node 1 (Node 2 Leaf Leaf) Leaf
Tree1b::Tree Int
Tree1b = Node 1 Leaf Leaf
numNodes::(Tree a)->Int
numNodes Leaf = 0
numNodes (Node a l r) = 1+numNodes l+numNodes r
instance == (Tree a)
where
	== t1 t2 = numNodes t1 == numNodes t2
//Start = Tree1 ==Tree1
//Start = Tree1b ==Tree1

//4.Write an instance of + which sums triples of any type that has instance for +(for which + is defined)

instance + (a,b,c)| +a & +b & +c //by adding the |.... part we make sue that + is defined on types:a b c (causes internal overloading error)
where
	 + (a1,b1,c1) (a2,b2,c2) = (a1+a2,b1+b2,c1+c2)
//Start = (1,2.3,1) + (4,3.2,3)
//Start = (2.3,2.3,2) + (1.2,2.2,1)
//Start = (2.3,2.3,"string1") + (1.2,2.2,"string2")
//Start = (2.3,2.3,Mark) + (1.2,2.2,Peter)
instance + Student 
where 
	+ a b ={a&uni=b.uni}
//(+) a a->a
//If you dnt have + defined on a or b or c it will cause no instance of + defined for that type
//ABSTRACT DATA TYPES
//Defined by its behaviour from the point of view of a user
//The user knows which operations are defined but nothing else
//Our task is to define those operations
//SEE TupleOverloading.icl and TupleOverloading.dcl

//TASKS FOR YOU:
//1.Write an instance of + which will do pairwise summation of its elements
//[1,2,3]+[1,2]=[2,4]
//Start = [1,2,3]+[1,2]
//Start = [1..10]+[3..12]

//2.Write an instance of ~ of a list of Int, which negaes each element of the given list
//Start = ~ [1..10]