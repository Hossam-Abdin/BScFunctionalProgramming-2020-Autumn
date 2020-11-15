module group3
import StdEnv
//arrays exercises with records 
//algebraic data types(trees-basics)
::Student={id::Int,uni::String,grades::[Int]}
David::Student
David={id=111111,uni="ELTE", grades =[2,3,4]}
David2::Student
David2={id=222222,uni="ELTE", grades =[3,4,5]}
Peter::Student
Peter = {id=123456,uni="ELTE",grades=[1,2,3,1,3,4,2,3,4,5]}
Mark::Student
Mark = {id=134326,uni="ELTE",grades=[1,2,5,5,5,5,3,3,4,2,3,4,5]}
John::Student
John = {id=133526,uni="BME",grades=[1,1,1,1,1,5,3,3,4,2,3,4,5]}
Sara::Student
Sara = {id=444326,uni="BME",grades=[1,2,5,5,5,2,2,3,4,5,1,1,1,1,2,4,5]}
Ana::Student
Ana = {id=134326,uni="Corvinus",grades=[1,1,1,1,1,2,2,2,2,1,1,4,4,4,4,5,5,5,5]}
Leo::Student
Leo = {id=555555,uni="ELTE",grades=[1,2,5,5,5,5,3,3,2,2,2,2,2,2,2,2,3,4,5]}
Jane::Student
Jane = {id=134536,uni="Corvinus",grades=[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]}
//Arrays exercises 
arrayToList::{a}->[a]
arrayToList array = [x\\x<-:array]
listToArray::[a]->{a}
listToArray list = {x\\x<-list}
thisIsArray::{Int}
thisIsArray ={1,2,3,4,5}
//Start = thisIsArray.[2]
//1.Given an array of students, return an array of the names of 
//the universities(remove the duplicate names)
uniNames::{Student}->{String}
uniNames arrOfS = listToArray (removeDup (map (\x=x.uni) listOfS))
where
	listOfS= arrayToList arrOfS
//removeDup [1,1,2,4]=[1,2,4]
//Start = uniNames {Leo,Jane,Sara,Sara,Mark,John}
//Start = uniNames {Leo\\a<-[1..10]}

//2.Given an array of Students and an integer n, 
//return a list of tuples like (id,uni) of the students that have more than n grades
moreThanNGrades::{Student} Int ->[(Int,String)]
moreThanNGrades array n =   map  (\x=(x.id,x.uni)) (filter (\x=length(x.grades)>n) list)
where
	list = arrayToList array
//Start = moreThanNGrades {Jane, David, David2, Peter} 3

//3. Given an array of Students. Find the id of the student with the lowest gpa. 
gpa::Student->Real
gpa s = toReal(sum (s.grades)) /  toReal(length (s.grades))
//version 1
//Start = gpa Ana
lowestGpa1::{Student}->Int
lowestGpa1 array = lowestGpa1L (arrayToList array)
lowestGpa1L::[Student]->Int
lowestGpa1L []= 0
lowestGpa1L [a]= a.id
lowestGpa1L [a,b:rest]
| gpa a > gpa b = lowestGpa1L [b:rest]
= lowestGpa1L [a:rest]
//Start = [gpa Mark, gpa John]
//Start = lowestGpa1 {Mark,John}//133526
//Start = lowestGpa1 {Leo,Jane,Ana}//134536
//Start = lowestGpa1 {Leo\\a<-[1..10]}//555555
//version 2
findSmallestGPA::[Student]->Real
findSmallestGPA list = minList ([ gpa a\\a<-list])
lowestGpa2::{Student}->Int
lowestGpa2 array = (hd (filter (\x=gpa x == findSmallestGPA list) list)).id
where 
	list = arrayToList array
//Start = lowestGpa2 {Mark,John}//133526
//Start = lowestGpa2 {Leo,Jane,Ana}//134536
//Start = lowestGpa2 {Leo\\a<-[1..10]}//555555

//4.Write a function which takes a University name and array of students 
//and calculates the total gpa of the University
//Gpa of a University is the sum of all the grades of all the students over 
//the total number of grades
gpaUni::String {Student}->Real
gpaUni u array = toReal(sum grades)/toReal (length grades)
where
	students = filter (\x=x.uni ==u) (arrayToList array)
	grades =  flatten (map (\x=x.grades) students)

//flatten [[1,2,3],[3,3,3]]= 	[1,2,3,3,3,3]
//Start = gpaUni "ELTE" {David,David2,Jane,Ana,Sara}
//Start = gpaUni "ELTE" {Mark,Jane,Mark}


//5.Given an array of Students, return a tuple containing 
//the names of the universities with the lowest and highest gpa
//(LowestGpa,HighestGpa)
//hint: Use the previous function
//The inputted list is not empty
minMaxUni::{Student}->(String,String)
minMaxUni array = (uniMinGpa list array,uniMaxGpa list array)
where 
	list = arrayToList array

uniMinGpa::	[Student] {Student}->String
uniMinGpa [a] _= a.uni
uniMinGpa [a,b:rest] array
|gpaUni a.uni array < gpaUni b.uni array =uniMinGpa [a:rest] array
=uniMinGpa [b:rest] array

uniMaxGpa::	[Student] {Student} ->String
uniMaxGpa [a] _= a.uni
uniMaxGpa [a,b:rest] array
|gpaUni a.uni array > gpaUni b.uni array =uniMaxGpa [a:rest] array
=uniMaxGpa [b:rest] array
//Start = minMaxUni {Mark,Jane,David,David2,Leo,Ana,Sara}

//ALGEBRAIC DATA TYPES->SIMILAR TO ENUM IN C OR C++
//enum fp ={class=0,exam=1,hw=2}
//enum bool = {False=0,True=1}
//Examples:
//::BinaryDigtis =1|0//discrete
// x  ::Real = 12.123214|12.1232145//continious
::Day = Mon|Tue|Wed|Thu|Fri|Sat|Sun
::Exam=Midterm|Endterm|MidtermRetake|EndtermRetake
//Given two exams, check if they are the same
//By intuition (True or False? What do you think? VOTE)
compareExamsGood::Exam Exam ->Bool
compareExamsGood Midterm Midterm = True
compareExamsGood Endterm Endterm = True
compareExamsGood MidtermRetake MidtermRetake = True
compareExamsGood EndtermRetake EndtermRetake = True
compareExamsGood _ _ = False
//Start = compareExamsGood Midterm Midterm
//Start = compareExamsGood Midterm Endterm
toString::Exam->String
toString Midterm ="Midterm"
toString Endterm ="Endterm"
toString MidtermRetake ="MidtermRetake"
toString EndtermRetake ="EndtermRetake"
//Start = "MMidterm" == toString (Midterm)
//Start =compareExamsGood Midterm Midterm
//Start =comapreExamsGood EndtermRetake EndtermRetake
//Start =comapreExamsGood Midterm Endterm
::Class={className::String,day::Day}
Math::Class 
Math = {className = "MATH", day=Mon}
IMP::Class
IMP = {className = "IMP", day =Tue}
FP::Class
FP = {className = "FP", day = Fri}
PRO::Class
PRO = {className = "PRO", day = Mon}
CS::Class
CS = {className = "CS", day = Fri}

//5.Given a list of Classes(see above) and a Day n
//Return a list containing only the Classes that are 
//held on Day n
//The compare days function is given
compareDays::Day Day->Bool
compareDays Mon Mon =True
compareDays Tue Tue =True
compareDays Wed Wed =True
compareDays Thu Thu =True
compareDays Fri Fri =True
compareDays Sat Sat =True
compareDays Sun Sun =True
compareDays _ _ =False

classesOnDay::[Class] Day->[String]
classesOnDay classes day = map  (\x=x.className)  (filter (\x= compareDays x.day day) classes)
//Start = classesOnDay [Math,IMP,CS,PRO,FP] Fri


//TREES-recursive algebraic type
//Concept of subtrees 
//binary trees->Trees having exactly 2 children in the non-leaf nodes

//I practice we will work with binary and binary search trees
::Tree a=Node a (Tree a) (Tree a) | Leaf
//Examples
//Tree1 see link: http://graphonline.ru/en/?graph=RDODcKkbEjpzIbIh
Tree1 ::Tree Int
Tree1 = Node 7 Leaf Leaf
//Tree2 see link: http://graphonline.ru/en/?graph=apYgfCbqYeaQRHNL
Tree2::Tree Int
Tree2 = Node 0 (Node 1 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf))  (Node 2 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf)) 
//Tree3 see link: http://graphonline.ru/en/?graph=YMMkGtZycajcoXEU
Tree3 ::Tree Int
Tree3 = Node 0 (Node 1 (Node 3 Leaf (Node 8 Leaf Leaf)) Leaf) (Node 2 Leaf Leaf)

//Binary search trees-> https://www.geeksforgeeks.org/binary-search-tree-data-structure/
//For each node(non-leaf), 
//the left subtree has elements less than the node value
//the right subtree has elements greater than the node value
//the left and right subtrees are also binary search trees


//Given a tree, find the number of it's nodes(non leafs)
sizeOfTree::(Tree a)->Int
sizeOfTree Leaf = 0
sizeOfTree (Node a l r) =1+ sizeOfTree l+ sizeOfTree r
//Node a l r ->a(value/key), l (left subtree->Tree a) , r(right subtree->Tree a)
/*
=1 
+sizeOfTree (Node 1 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) 
+sizeOfTree (Node 2 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf))
=
1
+1 +sizeOfTree (Node 3 Leaf Leaf) +sizeOfTree (Node 4 Leaf Leaf)
+1+sizeOfTree (Node 5 Leaf Leaf) +sizeOfTree (Node 6 Leaf Leaf)
=
1
+1+(1+sizeOfTree Leaf+sizeOfTree Leaf)+(1+sizeOfTree Leaf+sizeOfTree Leaf)
+1+(1+sizeOfTree Leaf+sizeOfTree Leaf)+(1+sizeOfTree Leaf+sizeOfTree Leaf)
=
...
=1
+1+(1+0+0)+(1+0+0)
+1+(1+0+0)+(1+0+0)
=7
*/
//Start = sizeOfTree Tree1
//Start = sizeOfTree Tree2
//Start = sizeOfTree Tree3

//Given a tree, find its depth
//depthOfTree::(Tree a)->Int
//Start = depthOfTree Tree1
//Start = depthOfTree Tree2
//Start = depthOfTree Tree3

//Given a tree with key of type Int, find the sum of its nodes(leaf is 0)
//sumNodes::(Tree Int)->Int
//Start = sumNodes Tree1
//Start = sumNodes Tree2
//Start = sumNodes Tree3