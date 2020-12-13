module group1
import StdEnv


:: Router = { nodeName :: String, activeStatus :: Bool}
:: Network = Node Router Network Network | Termination

r1 :: Router
r1 = {nodeName = "PL1", activeStatus = True}
r2 :: Router
r2 = {nodeName = "PL2", activeStatus = True}
r3 :: Router
r3 = {nodeName = "PL3", activeStatus = False}
r4 :: Router
r4 = {nodeName = "PL4", activeStatus = True}
r5 :: Router
r5 = {nodeName = "PL5", activeStatus = False}
r6 :: Router
r6 = {nodeName = "PL6", activeStatus = True}
r7 :: Router
r7 = {nodeName = "PL7", activeStatus = True}
r8 :: Router
r8 = {nodeName = "PL8", activeStatus = False}
r9 :: Router
r9 = {nodeName = "PL9", activeStatus = False}
r10 :: Router
r10 = {nodeName = "PL10",  activeStatus = False}
r11 :: Router
r11 = {nodeName = "PL11",  activeStatus = True}
r12 :: Router
r12 = {nodeName = "PL12",  activeStatus = True}
r13 :: Router
r13 = {nodeName = "PL13",  activeStatus = False}
r14 :: Router
r14 = {nodeName = "PL14",  activeStatus = True}
r15 :: Router
r15 = {nodeName = "PL15",  activeStatus = True}
r16 :: Router
r16 = {nodeName = "PL16",  activeStatus = True}
r17 :: Router
r17 = {nodeName = "PL17",  activeStatus = True}
r18 :: Router
r18 = {nodeName = "PL18",  activeStatus = False}
r19 :: Router
r19 = {nodeName = "PL19",  activeStatus = True}
r20 :: Router
r20 = {nodeName = "PL20",  activeStatus = False}
r21 :: Router
r21 = {nodeName = "PL21",  activeStatus = False}
r22 :: Router
r22 = {nodeName = "PL22",  activeStatus = True}

noNetwork :: Network
noNetwork = Termination
oneNetwork :: Network
oneNetwork = Node r1 Termination Termination
smolNetwork :: Network
smolNetwork = Node r1 (Node r2 (Node r4 Termination Termination)(Node r5 Termination Termination))(Node r3 (Node r6 Termination Termination) (Node r7 Termination Termination))
bigNetwork :: Network
bigNetwork = Node r11 (Node r4 (Node r3 (Node r1 Termination Termination) Termination) (Node r6 (Node r5 Termination Termination) Termination)) (Node r16 (Node r14 Termination (Node r15 Termination Termination)) (Node r19 (Node r18 Termination Termination) (Node r21 (Node r20 Termination Termination) (Node r22 Termination Termination))))

/*
Would you kindly write a function, that takes a Network
and a name of a Router, and returns a Bool indicating
if that Router is sucessfully connected.
A Router is successfully connected if ALL NODES
from the root to the router node have activeStatus of True.
If the Router is not found, return False.
*/

pathCheck :: Network String -> Bool
pathCheck Termination _ = False
pathCheck (Node x left right) r
| x.nodeName == r && x.activeStatus = True
= (pathCheck left r) || (pathCheck right r)


//Start = pathCheck smolNetwork "PL4" //True
//Start = pathCheck smolNetwork "PL69" //False
//Start = pathCheck bigNetwork "PL15" //True
//Start = pathCheck bigNetwork "PL22" //False
//Start = pathCheck oneNetwork "PL1" //True
//Start = pathCheck noNetwork "HelloGoodBye" //False


array_to_list :: {Int} -> [Int]
array_to_list array = [i \\ i <-: array]

list_to_array :: [Int] -> {Int}
list_to_array list = {i \\ i <- list}


/*
Given an array find the maximum value and return new array which has all occurrences of
the maximum value removed.
For example, if given array is {1,4,5,3,3,2,4,5,1,3,4}, maximum is 5,
so answer should be {1,4,3,3,2,4,1,3,4}.
*/

remMaxList :: [Int] -> [Int]
remMaxList list = [elem \\ elem <- list | elem <> max]
where
    max = maxList list

remMax :: {Int} -> {Int}
remMax array =  list_to_array (remMaxList (array_to_list array))


// Start = remMax {1,4,5,3,3,2,4,5,1,3,4} // {1,4,3,3,2,4,1,3,4}
// Start = remMax {1,42,42,52,452,4} // {1,42,42,52,4}
// Start = remMax {5} // {}
// Start = remMax {} // {}


/*
Given a list of Integer arrays, your task is to sum up all of them and return
a new array. (Sum first elements of arrays, second elements of arrays and so on).
You can assume that all arrays have the same length.
*/

sumTwoLists :: [Int] [Int] -> [Int]
sumTwoLists l1 l2 = [i + j \\ i <- l1 & j <- l2]

// Start = sumTwoLists [1,2,3] [1,2,3]

sumLists :: [[Int]] -> [Int]
sumLists [] = []
sumLists [a] = a
sumLists [x, y:xs] = sumLists [(sumTwoLists x y):xs]


sumArrays :: [{Int}] -> {Int}
sumArrays list_of_arrays = list_to_array (sumLists (map array_to_list list_of_arrays))


// Start = sumArrays [{1,2,3}, {1,2,3}] // {2,4,6}
// Start = sumArrays [{}, {}] // {}
// Start = sumArrays [{1}, {5}] // {6}
// Start = sumArrays [{1,0,0}, {0,1,0}, {0,0,1}] // {1,1,1}



/*
Create an * instance of lists such that list1 * list2 will give a
list of pairwise product of the two lists and if the length
of one list is greater than the other one just add the
remaining elements to the end of the new list
*/

instance * [a] | * a
where
    (*) [] [] = []
    (*) a b
    | length a <= length b = [x*y \\ x<-a & y <-b] ++ [x \\ x <- (drop (length a) b)]
    = (*) b a

// Start = [1,2] * [3,4,5,6,0] // [3,8,5,6,0]
// Start = [1,2,3,1,3,12,312] * [2,3] // [2,6,3,1,3,12,312]
//Start :: [Int]
//Start = [] * [] // []




/*
A teacher in a high school is trying to choose the student of the year, in his school
so let's help him doing that, the teacher want the student who has highest gpa.
The teacher is adding 0.1 to the gpa if the student was good.
*/

:: Status = Good | Bad

:: Student = {student_name :: String, gpa :: Real, status :: Status}

instance == Status
where
    (==) Good Good = True
    (==) Bad Bad = True
    (==) _ _ = False

instance < Student
    where
        (<) a b = a.gpa < b.gpa

change_gpa :: Student -> Student
change_gpa student
| student.status == Good = {student & gpa = student.gpa + 0.1}
= student

bestStudent :: [Student] -> Student
bestStudent students = maxList (map change_gpa students)



// Start = bestStudent [{student_name = "Khalid Walid", gpa = 4.0, status = Good},{student_name = "Peter", gpa = 3.7, status = Good},{student_name = "Yoko", gpa = 2.9, status = Bad}] // {student_name = "Khalid Walid", gpa = 4.0, status = Good}
// Start = bestStudent [{student_name = "Khalid Walid", gpa = 3.7, status = Bad},{student_name = "Peter", gpa = 3.7, status = Good},{student_name = "Yoko", gpa = 2.9, status = Bad}] // {student_name = "Peter", gpa = 3.7, status = Good}



// Array is monotonic if it is either monotone increasing or monotone decreasing
// A is monotone increasing if for all i<=j, A[i]<=A[j]
// A is monotone decreasing if for all i<=j, A[i]>=A[j]
// Given array, your task is to decide if it is monotonic.

isMonotonic :: {Int} -> Bool
isMonotonic array = isMonotonicList (array_to_list array)

isMonotonicList :: [Int] -> Bool
isMonotonicList list = (list == sorted_list) || (list == (reverse sorted_list))
where
    sorted_list = sort list


// Start = isMonotonic {6,5,4,4} // True
// Start = isMonotonic {1,3,2} // False
// Start = isMonotonic {1,2,4,5} // True
// Start = isMonotonic {1,1,1} // True

