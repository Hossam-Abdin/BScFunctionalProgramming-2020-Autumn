module group1
import StdEnv




:: Tree a = Node a (Tree a) (Tree a) | Leaf
//:: Tree = Node | Leaf
//:: Tree = Node Tree Tree | Leaf
//:: Tree a = Node a (Tree a) (Tree a) | Leaf | Nothing | Shit | Poop

//:: Tree = Node [Tree] | Leaf

/*
            8
         /    \
        6     12
       / \    / \
      3  7  10   L
     L 5 LL LL
       LL
*/
// treeToList tree = treeToList 6     + [8] + treetoList 12 = treeToList 3 + [6] + treeToList 7 + [8] + treetoList 10 + [12] + treetoList Leaf
// =  [3] + treetoList 5 + [6] + [7] + [8] + [10] + [12] = [3,5,6,7,8,10,12]

//binary search tree
smallTree :: (Tree Int)
smallTree = Node 8 (Node 6 Leaf Leaf) (Node 12 Leaf Leaf)

//       8
//    6     12
// L    L  L   L
//[6,8,12]

extractNode :: (Tree a) -> a
extractNode (Node x leftSubtree rightSubtree) = x
extractNode Leaf = abort "Leaf encountered\n"

//Start = smallTree //(Node 8 (Node 6 Leaf Leaf) (Node 12 Leaf Leaf))
//Start = extractNode smallTree //8
//Start = extractNode Leaf



//Start = treeToList smallTree //[6,8,12]

ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))
//Start = ourTree

// Graphs > Tree
// Tree: Connected, Acylic graph
// B Trees, B+ trees, B- trees, AVL trees, Rose trees
// Binary Trees > Binary Search Tree

// Binary Search Tree:


getNode :: (Tree a) -> a
getNode (Node x l r) = x
// Start = getNode ourTree

getLeft :: (Tree a) -> (Tree a)
getLeft (Node x l r) = l
// Start = getLeft (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // (Node 0 (Node -1 Leaf Leaf) Leaf)

getRight :: (Tree a) -> (Tree a)
getRight (Node x l r) = r
// Start = getRight (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // (Node 0 (Node -1 Leaf Leaf) Leaf) // (Node 5 Leaf Leaf)


SumTree :: (Tree Int) -> Int
SumTree Leaf = 0
SumTree (Node x l r) = x + (SumTree l) + (SumTree r)


// Start = SumTree (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // 5

isLeaf :: (Tree a) -> Bool
isLeaf Leaf = True
isLeaf _ = False

// Get minimum of BST
getMin :: (Tree a) -> a
getMin (Node x l r)
| isLeaf l = x
= getMin l

// Start = getMin (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // -1

reverseTree :: (Tree a) -> (Tree a)
reverseTree Leaf = Leaf
reverseTree (Node x l r) = (Node x (reverseTree(r)) (reverseTree(l)))


// Start = reverseTree (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // (Node 0 (Node -1 Leaf Leaf) Leaf) // (Node 5 Leaf Leaf)



getMax :: (Tree a) -> a
getMax (Node x l r)
| isLeaf r = x
= getMax r

// Start = getMax (Node 1 (Node 0 (Node -1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) // 5

// Add a new node to a BST
addNode :: a (Tree a) -> (Tree a) | Ord, Eq a
addNode n Leaf = Node n Leaf Leaf
addNode n (Node x l r)
| n == x = (Node x l r)
| n < x = addNode n l
= addNode n r

// [2,41,2,31,3,1,2,20]

listToBST :: [Int] -> (Tree Int)
listToBST [] = Leaf
listToBST [x:xs] = addNode x (listToBST xs)

// Start = listToBST [2,41,2,31,3,1,2,20]




treeToList :: (Tree a) -> [a]
treeToList Leaf = []
treeToList (Node x l r) = (treeToList l) ++ [x] ++ (treeToList r)

// treeSort :: [Int] -> [Int]
// treeSort list = treeToList (listToBST list)

// treeSort :: ([Int] -> [Int])
// treeSort = treeToList o listToBST

// Start = treeSort [1,2,7,4,5,3]



/*
Given a Tree with nodes of type Person,
return the number of people who are older than 18.
That is, people born on or before 2002.11.20
*/
// ::Person = { name::String
// 			,birthday::(Int,Int,Int)
// 	}

// t1::Tree Person
// t1 = Node {name = "hh", birthday = (2001,11,22)} Leaf Leaf
// t2::Tree Person
// t2 = Node {name = "hh", birthday = (2001,11,22)} (Node {name = "hr", birthday = (2001,11,21)} Leaf Leaf)(Node {name = "ht", birthday = (2001,11,23)} Leaf Leaf)
// t3::Tree Person
// t3 = Node {name = "hh", birthday = (2001,11,22)} (Node {name = "hr", birthday = (2001,11,21)} (Node {name = "hh", birthday = (2002,11,22)} Leaf Leaf) (Node {name = "hh", birthday = (1998,11,22)} Leaf Leaf))(Node {name = "ht", birthday = (2001,11,23)} Leaf Leaf)
// //f2 :: (Tree Person) -> Int
//Start = f2 t2 // 3
//Start = f2 t3  // 4
