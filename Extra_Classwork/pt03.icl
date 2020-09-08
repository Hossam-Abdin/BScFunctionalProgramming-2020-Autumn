module pt03
import StdEnv
//Write a function which takes a [Int] and checks 
//if the first two integers are equal to the last two
//Important note: if the list has less than 2 elements return False
firstLast::[Int]->Bool
firstLast list
|length list>=2= (take 2 list)==take 2 (reverse list)
=False
//Start = firstLast [1..10]//False
//Start = firstlast [1,4,3,4,3,1,4]//False
//Start = firstLast [1,2,1]//True
//Start = firstLast [1,1]//True
//Start = firstLast [1]//False

//Write a function which takes a [Int] and returns a
//[Int] containing the middle element of that list.
//Note: lists with odd number of elements will only
//return a list with one middle element, lists with
//even number of elements should return a list with
//two elements.
middle::[Int]->[Int]
middle list
|(length list) rem 2==0 = [ list!!halfLen, list!!(halfLen-1)]
=[list !! halfLen]
where
    len = length list
    halfLen = len / 2
//Start=middle [1..10]//-1 
//Start=middle [1,2,3,4,5]//3
//Start=middle []//-1


//Given a [[Int]], write a function that reverses
//sublists of odd length.
reverseLists :: [[Int]] ->[[Int]]
reverseLists [] = []
reverseLists [x:xs]
| (length x) rem 2 <> 0  = [reverse x: reverseLists xs]
= [x: reverseLists xs]
//Start = reverseLists [[1..10],[4..10],[5,4,3,2,1]] //[[1,2,3,4,5,6,7,8,9,10],[10,9,8,7,6,5,4],[1,2,3,4,5]]
//Start = reverseLists [[],[1,2,3],[4,5,6,7],[8,9,0]] // [[],[3,2,1],[4,5,6,7],[0,9,8]]
//Start = reverseLists [] // []