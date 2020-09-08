module ex22
import StdEnv

////////
// Define a type Tree for representing binary trees.
// 1. Write a function that returns the maximum value of all the values stored 
// in a binary tree. Assume all values are positive; return -1 if the tree is empty.
//f1 :: (Tree Int) -> Int

//Start = f1 (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) (Node 6 (Node 4 Leaf (Node 5 Leaf Leaf)) (Node 1 Leaf Leaf)))


// 2. Compute the average of all the numbers placed in the nodes of a tree.
//f2 :: (Tree Int) -> Real

//Start = f2 (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) (Node 6 (Node 4 Leaf (Node 5 Leaf Leaf)) (Node 1 Leaf Leaf)))


// 3. Build a search tree form a list then insert a number in the tree.
//f3 :: Int [Int] -> Tree Int

//Start = f3 13 [1..10]


////////
// Define a type Q for rational numbers.
// 4. Write a function to test the equality of rational numbers.
//f4 :: Q Q -> Bool

//Start = f4 {nom = 12, denom = 6} {nom = 39, denom = 18}


// 5. Add two rational numbers.
//f5 :: Q Q -> Q

//Start = f5 {nom = 3, denom = 4} {nom = 3, denom = -3}


// 6. Given two rational numbers multiply them.
//f6 :: Q Q -> Q

//Start = f6 {nom = 3, denom = 4} {nom = 3, denom = -3}


////////
// 7. Given 4 points of type Point (with the real fields x and y), check if they form a rectangle.
//f7 :: [Point] -> Bool

//Start = f7 [{x = 1.0, y = 1.0}, {x = 5.0, y = 5.0}, {x = 1.0, y = 5.0}, {x = 5.0, y = 1.0}]


////////
// 8. Generate an array that has as elements 1,2,2,3,3,3,4,4,4,4,...,10,..,10.
//f8 :: {Int}

//Start = f8


// 9. For a given n and i generate an array like
// for n=4 and i=1 the result is {1,1,2,1,2,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1}
//f9 :: Int Int -> {Int}

//Start = f9 4 1


////////
// 10. Is x a power of 2? 
//f10 :: Int -> Bool

//Start = f10 10
//Start = f10 32


// 11. Delete from a list all the numbers that are prime.
//f11 :: [Int] -> [Int]

//Start = f11 [1,3,4,6,9,17,8,10,21,23,41,100]


// 12. Compute the factorial of a number x using foldr.
//f12 :: Int -> Int

//Start = f12 5


// 13. Add the last number of a list to every element before that (the list has min 2 elements)
//f13 :: [Int] -> [Int]

//Start = f13 [1, 3, 4, 2, 10]


// 14. Check in a list if every second element of a list is even.
//   [1,1,1,2,11,4] -> 
//f14 :: [Int] -> Bool

//Start = f14 [1,1,1,2,11,4] // False
//Start = f14 [1,12,3,44,5] // True
//Start = f14 [] // True 


// 15. Generate the first 100 positive integer elements that are not prime.
//f15 :: [Int]

//Start = f15