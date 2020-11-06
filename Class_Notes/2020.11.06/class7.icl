module class7
import StdEnv

/*
    Given a list of integers, for each element do the following:
    if the element is even, check if this integer appears even amount of times in the list
    if the element is odd, check if this integer appears odd amount of times in the list
*/
func::Int [Int]->Bool
func x list 
|isEven x = isEven(length ([a\\a<-list|a==x]))
=isOdd(length (filter ((==)x) list))
//((==)x)  ==(\a=a==x)
check :: [Int] -> [Bool]
check list = map (\2=func 2 [1,2,2,1]) [1,2,2,1]
//Start = check [1,2,2,1] // [False,True,True,False]
//Start = check [1,1,1,2,2,2,3,5,3,3,5] // [True,True,True,False,False,False,True,False,True,True,False]






//Record/Structures-> type that has one or more fields in it
//The fields can be of any type (including another record type)
//Example:
::Box ={dim::Dimension, weight::Real}
::Dimension ={width::Real, height::Real}
::Sth = {a::Int,b::Char}
//Recall: you have probably already covered it in C++ or C (or both)
/*struct sth{
int a;
char b;
}*/
::Person= {name::String,age::Int}
Mark::Person
Mark={name="MARK", age=10}
Peter::Person
Peter={name="PETER", age=13}
//Accessing fields: using . operator
//Start = Mark.name
//Start = Mark.age

//1.Write a function which takes a Person and returns True if his/her age equals to 10
checkAge10::Person->Bool
checkAge10 {age=10} = True
checkAge10 _ = False
checkSecAge10::Person->Bool
checkSecAge10 a = a.age == 10
//Start = checkSecAge10 Mark
//Start = checkAge10 Peter

//2.Write a function which takes a Person and  Integer and 
//returns True if his/her age equals to the given number
/*fun2::Person Int->Bool
fun2 {age=n} n= True
fun2 _ n = False*/
checkEvenAge::Person Int->Bool
checkEvenAge p n = p.age == n

//Start = checkEvenAge Mark 10
//Start = checkEvenAge Peter 10
::Vector ={x::Real, y::Real}
One::Vector
One = {x=1.0,y=1.0}
Two::Vector
Two = {x=2.0,y=2.0}

//3.Given two 2d vectors. Write a function which adds them up
add2vec::Vector Vector->Vector
add2vec a b = {a & x=a.x+b.x, y=a.y+b.y}
//Start = add2vec One Two


//Arrays
//list->[a],[Int],[[Real]]....
//array->{a},{Int},{{Real}}....
//[sth]  -  {sth}
//The built in functions like hd, tl, reverse, length DO NOT WORK ON ARRAYS
//[a\\a<-list] --list comp
//[a\\a<-:array] --array comp
//array to list
arrayToList::{Int} -> [Int]
arrayToList arr = [a\\a<-:arr]
//Start= arrayToList {1,2,3,4}
listToArray::[Int]->{Int}
listToArray list ={a\\a<-list  }
//Start::{{Int}}->[{Int}]
//Start= arrayToList {{1,2},{3,4,5,5},{}}//empty array makes issue withoutthe above line
//Start = listToArray [1,2,3,4]

//Accessing elements in arrays:
//list!![index]
//arrayName.[index]
myArray::{Int}
myArray = {1,2,3}
//Start = myArray.[1] 
















