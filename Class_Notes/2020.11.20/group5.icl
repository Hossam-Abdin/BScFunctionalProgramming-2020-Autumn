module group5

import StdEnv

// instances (moved to next week)

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
		(==) a b = (a.name == b.name) && (a.age == b.age)

//Start = Nikola == Hossam
//Start = Hossam2 == Hossam

// Trees

:: Tree a = Node a (Tree a) (Tree a) | Leaf

:: Gender = Male | Female

ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))

simpleTree :: (Tree Int)
simpleTree = Node 10 (Node 7 (Node 5 Leaf Leaf) Leaf) (Node 11 Leaf Leaf)

sizeT :: (Tree a) -> Int
sizeT Leaf = 0
sizeT (Node x l r) = 1 + sizeT l + sizeT r

// Start = sizeT ourTree
// Start = sizeT simpleTree

// From here, let's study TreeReview in the consultation notes folder
// https://github.com/Hossam-Abdin/BScFunctionalProgramming-2020-Autumn/blob/master/Consultation_Notes/old_notes/TreeReview.icl