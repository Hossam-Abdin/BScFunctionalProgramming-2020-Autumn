module group3
import StdEnv
//RECAP:

/*We have covered basics of binary
and binary search trees last time,
but if you have issues understanding them 
here are two linkss where you can have the most
basic and important information*/
//Binary tree: https://www.geeksforgeeks.org/binary-tree-data-structure/
//Binary seach tree: https://www.geeksforgeeks.org/tag/binary-tree/

//Examples from last time
::Tree a=Node a (Tree a) (Tree a) | Leaf//recursive data structure
//Tree1 see link: http://graphonline.ru/en/?graph=RDODcKkbEjpzIbIh
Tree1 ::Tree Int
Tree1 = Node 7 Leaf Leaf
//Tree2 see link: http://graphonline.ru/en/?graph=apYgfCbqYeaQRHNL
Tree2::Tree Int
Tree2 = Node 0 (Node 1 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf))  (Node 2 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf)) 
//Tree3 see link: http://graphonline.ru/en/?graph=YMMkGtZycajcoXEU
Tree3 ::Tree Int
Tree3 = Node 0 (Node 1 (Node 3 Leaf (Node 8 Leaf Leaf)) Leaf)  (Node 2 Leaf Leaf)
//Given a tree, find the number of it's nodes(non leafs)
/*
Node a l r
a ---> node value
l ---> left subtree
r ---> right subtree
*/
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
Start = sizeOfTree Tree3

//Today we will go through this file, where we can see a lot of useful functions related to trees
//https://github.com/Hossam-Abdin/BScFunctionalProgramming-2020-Autumn/blob/master/Consultation_Notes/old_notes/TreeReview.icl

//Given a tree, find its depth
//depth of Leaf is 0
//depthOfTree::(Tree a)->Int
//Start = depthOfTree Tree1
//Start = depthOfTree Tree2
//Start = depthOfTree Tree3

//Given a tree with key of type Int, find the sum of its nodes(Leaf is 0)
//sumNodes::(Tree Int)->Int
//Start = sumNodes Tree1
//Start = sumNodes Tree2
//Start = sumNodes Tree3

//Tree traversal(different ways of converting given tree into a list):
//Tree2 see link: http://graphonline.ru/en/?graph=apYgfCbqYeaQRHNL
//1 Inorder: Left, Root, Right
inorder::(Tree a)->[a] 
inorder Leaf =[]
inorder (Node a l r) = inorder l ++ [a]++inorder r 
//Start = inorder Tree2

//2 Preorder: Root, Left, Right
preorder::(Tree a)->[a] 
preorder Leaf = []
preorder (Node a l r) = [a]++preorder l ++preorder r
//Start = preorder Tree2

//3 Postorder: Left, Right, Root
postorder::(Tree a)->[a] 
postorder Leaf = []
postorder (Node a l r) = postorder l ++postorder r++[a]
//Start = postorder Tree2



//1. Given a (Tree Int), and a list of Ints.
//Check if every element from the list is in the tree
treeToList::(Tree Int)->[Int]
treeToList Leaf =[]
treeToList (Node a l r) =treeToList l++[a]++treeToList r
task1::(Tree Int) [Int]->Bool
task1 tree list = length [x\\x<-treeList| isMember x list  ==False] ==0
where
	treeList = treeToList tree
task1snd::(Tree Int) [Int]->Bool
task1snd Leaf list = True
task1snd (Node a l r) list
|isMember a list =True && task1snd l list && task1snd r list
=False
//T && T&& t.... &&F......--->False

//Start = task1snd Tree2 [1..4]//False
//Start = task1 Tree2 [1..10]//False

//2.Given a (Tree Int) and an Int, 
//write a function which counts how many times
//the given number occurs in the tree
Tree3fiveTimes::Tree Int
Tree3fiveTimes = Node 3 (Node 3 Leaf (Node 3 Leaf (Node 2 Leaf Leaf))) (Node 3 (Node 3 Leaf Leaf) (Node 7 Leaf Leaf))
task2::(Tree Int) Int->Int
task2 tree n = 	length(	filter ((==)n) list)
where
	 list = treeToList tree
//Start = task2 Tree3fiveTimes 3
//Start = task2 Tree2 (-10)
task2snd::(Tree Int) Int->Int
task2snd Leaf _ = 0
task2snd (Node a l r) n
|a==n =1+task2snd l n+ task2snd r n
=0+task2snd l n+ task2snd r n
//Start = task2snd Tree2 (-10)

//3.Given a (Tree Int), write a function which gives back a list of tuples,
//where each tuple contains the left and the rigth child of only the
//odd numbers from the tree in preorder traversal
//Leaf is considered to have value of -1
//task3::(Tree Int)->[(Int,Int)]
//Start = task3 Tree2 
//Start = task3 Tree3 

//PT7
::Person={name::String, mass::Real, height::Real, bmi::Real}
Rose::Person
Rose={name="Rose", mass=147.71, height=1.72, bmi=0.0}
Jack::Person
Jack={name="Jack", mass=158.73, height=1.93, bmi=0.0}
Emilia::Person
Emilia={name="Emilia", mass=121.25, height=1.60, bmi=0.0}
Leo::Person
Leo={name="Leo", mass=85.98, height=1.75, bmi=0.0}
Grace::Person
Grace={name="Grace", mass=112.43, height=1.65, bmi=0.0}
Harry::Person
Harry={name="Harry", mass=169.76, height=1.80, bmi=0.0}

/*
    Given an array of Persons, write a function which calculates the BMI of each Person
    BMI: body mass index = m / h^2
    m	=	mass (in kilograms)
    h	=	height (in meters)
    note: the mass given in the records are in pounds, you need to convert before using the formula 
    hint: 1 pound = 0.453592kg
*/

calcBMI :: {Person} -> {Person}
calcBMI array = { {a & bmi= a.mass* 0.453592 /a.height^2.0 }\\a<-:array}

//Start = calcBMI {Rose,Jack,Emilia} // {(Person "Rose" 67 172 22.6473769605192),(Person "Jack" 72 193 19.3293779698784),(Person "Emilia" 55 160 21.484375)}
//Start = calcBMI {Leo,Grace,Harry} // {(Person "Leo" 39 175 12.734693877551),(Person "Grace" 51 165 18.732782369146),(Person "Harry" 77 180 23.7654320987654)}
//Start = calcBMI {} // {}















