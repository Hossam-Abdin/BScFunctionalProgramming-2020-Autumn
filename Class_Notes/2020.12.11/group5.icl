module group5

import StdEnv

// :: Person = { name :: String, birthday :: Date}
// Sarah :: Person
// Sarah = { name = "Sarah Muddle", birthday = SarahBday }
// James :: Person
// James = { name = "James Potter", birthday = JamesBday}
// Evan :: Person
// Evan = { name = "Evan Sitt", birthday = EvanBday}
// Mina :: Person
// Mina = { name = "Mina Harken", birthday = MinaBday}
// Aoife :: Person
// Aoife = { name = "Aoife", birthday = AoifeBday}
// Vlad :: Person
// Vlad = { name = "Vlad Tepes", birthday = VladBday}


// ListOPeople :: [Person]
// ListOPeople = [Sarah, James, Evan, Mina, Aoife, Vlad]

// :: Address :== String
// :: AddressBook :== [(Person, Address)]
// DormRegister :: AddressBook
// DormRegister = [
//                 (Mina, "N Elston Hall"),
//                 (Aoife, "S Kensington Plaza"),
//                 (Vlad, "N Elston Hall"),
//                 (Evan, "W Yung Street"),
//                 (James, "E Soho Square"),
//                 (Sarah, "W Rochester Lane")
//                ]


// /*
// Given an AddressBook and a Char representing a cardinal direction,
// return a list of all unique addresses that are not in that direction.
// The cardinal direction of an address is represented by its first character.
// */
// filterAddresses :: AddressBook Char -> [Address]
// filterAddresses address_book ch = removeDup [a \\ (name, a) <- address_book | a.[0] <> ch]


/*
Declare and define the Tree type.
Given a list of Person, create a Binary Search Tree
based on their age.
*/

// :: Tree a = Node a (Tree a) (Tree a) | Leaf

// instance < Date
// where
//     (<) {year = y1, month = m1, day = d1} {year = y2, month = m2, day = d2} = [y1, m2, d2] < [y2, m1, d1]

// PersonTree :: [Person] -> (Tree Person)
// PersonTree [] = Leaf
// PersonTree [a:b] = Node a (PersonTree [x \\ x <- b | x.birthday < a.birthday]) (PersonTree [x \\ x <- b | x.birthday >= a.birthday])
// Start = PersonTree ListOPeople //(Node (Person "Sarah Muddle" (Date 2004 5 13)) (Node (Person "Aoife" (Date 2015 5 25)) Leaf Leaf) (Node (Person "James Potter" (Date 2002 5 30)) Leaf (Node (Person "Evan Sitt" (Date 1989 1 29)) (Node (Person "Mina Harken" (Date 2000 12 9)) Leaf Leaf) (Node (Person "Vlad Tepes" (Date 1900 10 31)) Leaf Leaf))))

::University={uniName::String,students::[Student],teachers::[Teacher]}
::Teacher={tname::String,subject::String}
::Student={studentName::String,age::Int,grades::{Int},favoriteTeacher::Teacher}
ELTE::University
ELTE={uniName="ELTE",students=[Marko,Nikola,Josh,Dame],teachers=[Mary,Peter,John]}
BME::University
BME={uniName="BMI",students=[Ana,Josh,Sofi,Nikola],teachers=[Viktor,John,Peter]}
EmptyUni::University
EmptyUni={uniName="Empty",students=[],teachers=[]}
Peter::Teacher
Peter={tname="Peter",subject="Functional"}
Viktor::Teacher
Viktor={tname="Viktor",subject="Math"}
Mary::Teacher
Mary={tname="Mary",subject="OOP"}
John::Teacher
John={tname="John",subject="Functional"}
Marko::Student
Marko={studentName="Marko",age=19,grades={4,4,4,5},favoriteTeacher= Mary}
Sofi::Student
Sofi={studentName="Sofi",age=22,grades={5,5,4,5,5},favoriteTeacher=John}
Dame::Student
Dame={studentName="Dame",age=21,grades={2,3,4,5},favoriteTeacher=Peter}
Ana::Student
Ana={studentName="Ana",age=18,grades={5,5,5,5},favoriteTeacher=Viktor}
Nikola::Student
Nikola={studentName="Nikola",age=19,grades={4,4,4,4,2},favoriteTeacher=Peter}
Nik::Student
Nik={studentName="Nik",age=20,grades={4,4,4,4,3},favoriteTeacher=Peter}
Nik2::Student
Nik2={studentName="Nik2",age=22,grades={4,4,4,4,5},favoriteTeacher=Peter}
Josh::Student
Josh={studentName="Josh",age=22,grades={4,5,5},favoriteTeacher=John}


/*2 Given a University, return an array of all the 
students or teachers names which are shorter than 6*/

toList :: {a} -> [a]
toList arr = [x \\ x<-:arr]

toArr :: [a] -> {a}
toArr l = {x \\ x <- l}

shorterThan6::University->{String}
shorterThan6 u = toArr ((toList students) ++ (toList teachers))
    where
        students = { x.studentName \\ x <-u.students | size(x.studentName) < 6} 
        teachers = { x.tname \\ x <-u.teachers | size(x.tname) < 6}

// Start=shorterThan6 BME//{"Ana","Josh","Sofi","John","Peter"}
//Start=shorterThan6 ELTE//{"Marko","Josh","Dame","Mary","Peter","John"}
// Start=shorterThan6 EmptyUni//{}

/*3 Write a function which will take an array of Universities and return the University 
with the highest overall gpa (the average of the average of each student)*/

average :: Student -> Real
average s = avg [toReal x \\ x <- (toList s.grades)]

// Start = average Marko

inHelper :: University University -> Bool
inHelper a b
| isEmpty(a.students) = True
| isEmpty(b.students) = False
= (<) (avg [average x \\ x <- a.students]) (avg [average x \\ x <- b.students])

instance < University
    where
        (<) a b = inHelper a b

highestGpa::{University}->String
highestGpa arr 
| size(arr) == 0 =  "No universities given"
= (maxList (toList arr)).uniName

// Start=highestGpa {ELTE,BME,EmptyUni}//"BMI"
// Start=highestGpa {ELTE,BME} //"BMI"
// Start=highestGpa {EmptyUni,EmptyUni}//"Empty"
// Start=highestGpa {ELTE} //"ELTE"
// Start=highestGpa {}//"No universities given"


/*4	Create a toString instance for Student such that for given student ex. Nikola={studentName="Nikola",age=19,grades={4,4,4,4,2},
favoriteTeacher=Peter} it gives "Nikola 3.6 Peter" where 3.6 is the student's gpa and Peter is the student's favorite teacher's name*/
instance toString Student
    where
       toString x = x.studentName +++ " " +++ toString(average x) +++ " " +++ x.favoriteTeacher.tname 

// Start=toString Nikola//"Nikola  3.6  Peter"
//Start=toString Marko//"Marko  4.25  Mary"
//Start=toString Nik//"Nik  3.8  Peter"
//Start=toString Dame//"Dame  3.5  Peter"

//6. Given two arrays, return new array such that i-th element of it is maximum of i-th element of first and second arrays.
// So for example, when we calculate 5th element of result array, we look at 5th element of first and 5th element of second arrays
// And choose maximum of the two.
// You can assume that arrays have same length. 

maxOfTwo :: {Int} {Int} -> {Int}
maxOfTwo a b = {maxList [x,y] \\ x <-: a & y <-: b}

// Start = maxOfTwo {} {} // {}
// Start = maxOfTwo {1} {5} // {5}
// Start = maxOfTwo {1,5,4} {2,3,6} // {2,5,6}
// Start = maxOfTwo {1,2,3,4,5} {1,2,3,4,5} // {1,2,3,4,5}

//7. You are given array of integers.
// Your function should return true if each value appears at least twice in the array, and it should return false
// if any element is distinct.

countApp :: Int [Int] -> Int
countApp x l = length [a \\ a <- l | a == x]

// Start = f7Aux [1,2,3,1,3,2,2,2]

f7Aux :: [Int] -> [Int]
f7Aux l = map (\x = countApp x l) l

f7 :: {Int} -> Bool
f7 arr = (length [ x \\ x <- (f7Aux l) | x == 1]) == 0
    where
        l = toList arr

// Start = f7 {1,2,3,1,3,2,2,2} // True
// Start = f7 {1,2,3,4,3,2,1} // False
// Start = f7 {1,1,1,3,3,4,3,2,4,2} // True

//8.Array is monotonic if it is either monotone increasing or monotone decreasing
// A is monotone increasing if for all i<=j, A[i]<=A[j]
// A is monotone decreasing if for all i<=j, A[i]>=A[j]
// Given array, your task is to decide if it is monotonic.

// isMonotonic :: {Int} -> Bool


// Start = isMonotonic {6,5,4,4} // True
// Start = isMonotonic {1,3,2} // False
// Start = isMonotonic {1,2,4,5} // True
// Start = isMonotonic {1,1,1} // True
