module ex19
import StdEnv

//// Records

:: Person = { name :: String
            , birthdate :: (Int,Int,Int)
            , fpprogramer :: Bool
            }

IsfpUser :: Person -> String
IsfpUser {fpprogramer = True} = "Yes"
IsfpUser _                    = "No"

// Start = IsfpUser { name = "Me"
//                 , birthdate = (1,1,1999)
//                 , fpprogramer = True}    // "Yes"

GetName :: Person -> String
GetName p = p.name

GetName2 :: Person -> String
GetName2 {name} = name

ChangeN :: Person String -> Person
ChangeN p s = {p & name = s} 

//Start = ChangeN {name = "XY", birthdate = (1,1,2000), fpprogramer = True} "Alex" 


:: Tree a = Node a (Tree a) (Tree a)
          | Leaf

atree = Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)

//Start = atree

:: Tree2 a = Node2 a (Tree2 a) (Tree2 a)
           | Leaf2 a

nrNodes :: (Tree2 a) -> Int
nrNodes (Leaf2 y) = 1
nrNodes (Node2 x l r) = 1 + nrNodes l + nrNodes r

aTree2 :: Tree2 Int

aTree2 = Node2 4 (Node2 2 (Node2 1 (Leaf2 1) (Leaf2 1)) (Node2 3 (Leaf2 3) (Leaf2 3))) (Leaf2 5)

//Start = aTree2

//Start = nrNodes aTree2     // 9

:: Tree3 a b = Node3 a (Tree3 a b) (Tree3 a b)
             | Leaf3 b
 
aTree3 :: Tree3 Int Real

aTree3 = Node3 2 (Node3 1 (Leaf3 1.1) (Leaf3 2.5)) (Node3 3 (Leaf3 3.0) (Leaf3 6.9))

//Start = aTree3

sumLeaves :: (Tree3 Int Real) -> Real
sumLeaves (Leaf3 y) = y
sumLeaves (Node3 x le ri) = sumLeaves le + sumLeaves ri

//Start = sumLeaves aTree3 //13.5

// Triple branches
:: Tree4 a = Node4 a (Tree4 a) (Tree4 a) (Tree4 a)
          | Leaf4

// Rose-tree - tree with variable multiple branches
// No leaf constructor, node with no branches
:: Tree5 a = Node5 a [Tree5 a]

// Every node has one branch = list
:: Tree6 a = Node6 a (Tree6 a) 
           | Leaf6
           
// Tree with different types
:: Tree7 a b = Node7a Int (Tree7 a b) (Tree7 a b)
             | Node7b b (Tree7 a b)
             | Leaf7a b
             | Leaf7b Int

:: BTree a				= Bin (BTree a) (BTree a) | Tip a

mapbtree				:: (a -> b) (BTree a) -> BTree b
mapbtree f (Tip x)		= Tip (f x)
mapbtree f (Bin t1 t2)	= Bin (mapbtree f t1) (mapbtree f t2)

foldbtree				:: (a a -> a) (BTree a) -> a
foldbtree f (Tip x)		= x
foldbtree f (Bin t1 t2)	= f (foldbtree f t1) (foldbtree f t2)


aBTree = Bin (Bin (Bin (Tip 1) (Tip 1)) (Bin (Tip 3) (Tip 3))) (Tip 5)

//Start = aBTree
//Start = mapbtree inc aBTree
Start = foldbtree (+) aBTree // 13

/////////////////////////////

// Exercises

// 1. Finish the implementation of the Stack 

// 2. Build a FIFO ADT with the same list of the operations like for the stack.
// Chose a representation for the type and give the impelemnation details.

// 3. Implement the Q mathematical set in the given file.


