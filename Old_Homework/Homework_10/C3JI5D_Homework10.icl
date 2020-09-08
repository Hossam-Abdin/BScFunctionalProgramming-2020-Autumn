module C3JI5D_Homework10
import StdEnv

::Tree a = Node a (Tree a) (Tree a)|Leaf

testTree = Node 4 (Node 2 (Node 6 Leaf Leaf) (Node 5 Leaf Leaf)) (Node 3 (Node 7 (Node 3 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 2 (Node 3 Leaf Leaf) (Node 1 (Node 9 (Node 10 (Node 11 (Node 5 Leaf Leaf) (Node 8 Leaf Leaf)) Leaf) Leaf) (Node 5 Leaf Leaf))))
//Start = testTree

// For ex 1,2,3 use the Tree Int type defined in the class.

// 1. Check if a number is a node of a tree.

isNode :: (Tree Int) Int -> Bool
isNode Leaf a = False
isNode (Node x left right) a
| x==a = True
= isNode left a || isNode right a

//Start = isNode testTree 1337

// 2. Count how many times is a node in a tree.

nrNode :: (Tree Int) Int -> Int
nrNode Leaf a = 0
nrNode (Node x left right) a
| x==a = 1 + (nrNode left a) + (nrNode right a)
= (nrNode left a) + (nrNode right a)

//Start=nrNode testTree 2

// 3. If a number is an a tree, then give the list of its children in the form of (left child, right child).

// if the children are leaves then (0,0) are its children.

nodeReturn :: (Tree Int) -> (Int, Int)
nodeReturn (Node a Leaf Leaf) = (0,0)
nodeReturn (Node a Leaf (Node c _ _)) = (0,c)
nodeReturn (Node a (Node b _ _) Leaf) = (b,0)
nodeReturn (Node a (Node b _ _) (Node c _ _))= (b,c)

//Start = nodeReturn  (Node 924 Leaf Leaf)
 
child :: (Tree Int) Int -> [(Int, Int)]
child Leaf a = []
child (Node x left right) a
| x==a = [ nodeReturn (Node x left right) ] ++ (child left a) ++ (child right a)
= (child left a) ++ (child right a)

Start = child testTree 3

// eg. for aTree = Node 4 (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) (Node 2 Leaf Leaf)

// has 2 as node two times, and the result for Start = child aTree 2 is [(1,3),(0,0)]