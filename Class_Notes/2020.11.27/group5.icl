module group5
import StdEnv

// instances

:: Student = {name :: String, age :: Int}
Nikola :: Student
Nikola = {name = "Nikola", age = 18}
Hossam = {name = "Hossam", age = 23}
Hossam2 = {name = "Hossam", age = 23}


/*
Write an instance of type Student, such that two students are equal
if their gpa differs in less than 0.3 and they have the same favorite teacher
*/

instance == Student
    where
        (==) a b = (a.age == b.age) && (a.name == b.name)

instance < Student
    where
        (<) a b = a.age < b.age

instance ~ Student
    where
        (~) a = {a&age = ~a.age}

// Start = sort [Hossam, Hossam2, Nikola]

// Start = ~Hossam
// Start = Nikola < Hossam
// Start = Hossam2 == Hossam

// Let's continue the tree

:: Tree a = Node a (Tree a) (Tree a) | Leaf

// Start = Node Nikola Leaf (Node Hossam Leaf Leaf)