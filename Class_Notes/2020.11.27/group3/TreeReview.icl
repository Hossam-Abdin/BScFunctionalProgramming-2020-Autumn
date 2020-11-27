module TreeReview
import StdEnv

/*
This is the standard definition of Binary Tree.
The Tree can be of a given type 'a'.
At each Node, it will contain a key value of type 'a',
and two subtrees, which are Trees of the same type 'a'.
*/
:: Tree a = Node a (Tree a) (Tree a) | Leaf

//Below are some convenient trees to work with for
//exercises and testing.
ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))
//Start = ourTree

messyTree :: (Tree Int)
messyTree = Node 5(Node 12(Node 8 Leaf (Node 1 Leaf Leaf))(Node 6 (Node 9 Leaf Leaf) Leaf))(Node 2 (Node 3 Leaf (Node 13(Node 100 Leaf Leaf)(Node 21 Leaf Leaf)))(Node 40 (Node 60 (Node 70 (ourTree) Leaf) Leaf) Leaf))
//Start = messyTree

//Functions for a Binary Search Tree

//Getting the value at the node
extractNode :: (Tree a) -> a
extractNode (Node x l r) = x

//Going down left/right subtree
goL :: (Tree a) -> (Tree a)
goL (Node x l r) = l
goR :: (Tree a) -> (Tree a)
goR (Node x l r) = r

//Checking if we're at a leaf
isLeaf :: (Tree a) -> Bool
isLeaf Leaf = True
isLeaf _ = False

//Get a list of subtrees from a node.
getSubTrees :: (Tree a) -> [(Tree a)]
getSubTrees (Node x l r) = [l,r]
//Start = getSubTrees ourTree

//Get the min value of a BST
minTree :: (Tree a) -> a | Ord a 
/*var1::a
var2::a
Ord a  ---> var1<var2 is defined and var1>var2 is defined*/
//Eq a -->var1==var2 is defined
minTree tree//(Node a l r)
| isLeaf(goL tree)= extractNode tree
= minTree (goL tree)
//Start = minTree ourTree

//Reverse a tree
reverseTree :: (Tree a) -> (Tree a)
reverseTree Leaf = Leaf
reverseTree (Node x l r) = (Node x (reverseTree r) (reverseTree l))
Tree3 ::Tree Int
Tree3 = Node 0 (Node 1 (Node 3 Leaf (Node 8 Leaf Leaf)) Leaf)  (Node 2 Leaf Leaf)
//Start = reverseTree Tree3

//Get the max value of a BST
maxTree :: (Tree a) -> a | Ord a
maxTree tree //= minTree(reverseTree tree)
| isLeaf(goR tree)= extractNode tree
= maxTree (goR tree)
//It can also be done in a similar way as minTree
//Start = maxTree ourTree

//Create a list of all subtrees
subTreeList :: (Tree a) -> [(Tree a)]
subTreeList Leaf = []
subTreeList tree = subTreeList(goL tree) ++ [tree] ++ subTreeList(goR tree)
//Start = subTreeList ourTree 

//Extract sublists of trees containing a specific element
extractSubLists :: a (Tree a) -> [(Tree a)] | Eq a
extractSubLists n tree = [subtree\\subtree<-(subTreeList tree)|(extractNode subtree)==n]
//Start = extractSubLists 3 ourTree

//Get a list of children of a node
getChildren :: a (Tree a) -> [a] | Eq a
getChildren n tree
| isLeaf(goL subtree)&&isLeaf(goR subtree)=[]
| isLeaf(goL subtree) = [extractNode(goR subtree)]
| isLeaf(goR subtree) = [extractNode(goL subtree)]
= [extractNode(goL subtree)]++[extractNode(goR subtree)]
    where
        subtree = hd(extractSubLists n tree)
//Start = getChildren 20 ourTree


//Make a list from a BST
treeToList :: (Tree a) -> [a]
treeToList Leaf = []
treeToList tree = treeToList(goL tree)++[extractNode tree]++treeToList(goR tree)
//Start = treeToList newTree

/*
*
*
Move on from here
*
*
*/

//Make a BST from a list
//Everything on the right
listToTree :: [a] -> (Tree a) | Ord, Eq a  //<,>,= on type a is defined 
listToTree [] = Leaf
listToTree list = (Node (hd sortedList) Leaf (listToTree (tl sortedList)))
    where
        sortedList =  (removeDup(sort list))
//Start = listToTree [4,2,6,5,23,7] 

//Check if a Binary Tree is actually a BST
//checking if the treeToList gives back sorted list
checkBST :: (Tree a) -> Bool | Ord,Eq a
checkBST t = l == (sort l)
where
    l = treeToList t
//Start = checkBST ourTree
//Start = checkBST messyTree

//Get the parent of a node
//finParentAux 
findParent :: a (Tree a) -> a | Eq a
findParent n tree = hd(findParentAux n tree)

findParentAux n tree
| isLeaf tree = []
| n==extractNode tree = abort "No Parent\n"
| isMember n (getChildren (extractNode tree) tree) = [extractNode tree]
//if n is children of the node value
= findParentAux n (goL tree) ++ findParentAux n (goR tree)
//Start = findParent 13 ourTree
//Start = findParent 15 ourTree
//Start = findParent 19 ourTree

//Add a new node to a BST
addNode :: a (Tree a) -> (Tree a) | Ord, Eq a
addNode n Leaf = (Node n Leaf Leaf)
addNode n (Node x l r)
| n == x = (Node x l r)//we can not have duplicates
| n < x = (Node x (addNode n l) r)
| n > x = (Node x l (addNode n r))

newTree = addNode 17 ourTree
//Start = newTree

//Remove the minimum node of a binary search tree
remMin :: (Tree a) -> (Tree a) | Ord, Eq a
remMin (Node x Leaf r) = r
remMin (Node x l r)
| extractNode l == minTree (Node x l r) = (Node x (goR l) r)
= (Node x (remMin l) r)
//Start = remMin ourTree

//Remove the root of a binary search tree
remRoot :: (Tree a) -> (Tree a) | Ord, Eq a
remRoot Leaf =abort "No root"
remRoot (Node x l r)
| isLeaf l && isLeaf r = Leaf
| isLeaf l = r
| isLeaf r = l
= (Node (minTree r) l (remMin r))
//Start = remRoot ourTree

//Filter a binary search tree
filterTree :: (a -> Bool) (Tree a) -> (Tree a) | Ord, Eq a
filterTree cond Leaf = Leaf
filterTree cond (Node x l r)
| cond x = (Node x (filterTree cond l) (filterTree cond r))//[x]++func xs
= remRoot (Node x (filterTree cond l) (filterTree cond r))
//Start =  filterTree isEven (levelBalance [1..10])


//Reorganize a messy(binary) tree into a BST
reorganize :: (Tree a) -> (Tree a) | Ord, Eq a
reorganize tree = listToTree(removeDup(treeToList tree))
//Start = reorganize messyTree

//Find min of a messy tree
minMess :: (Tree a) -> a | Ord, Eq a
minMess tree = minList(treeToList tree)
//Start = minMess messyTree

//Find max of a messy tree
maxMess :: (Tree a) -> a | Ord, Eq a
maxMess tree = maxList(treeToList tree)
//Start = maxMess messyTree

//Create a level balanced Binary search tree from a list
levelBalance :: [a] -> (Tree a) | Ord, Eq a
levelBalance list
| isEmpty list = Leaf
= (Node (sorted!!mid) (levelBalance (take mid sorted)) (levelBalance (drop (mid+1) sorted)))
    where
        sorted = sort (removeDup list)
        mid = (length sorted)/2
//Start = levelBalance [5,2,4,9,6,8,7,1,3]
//Start = levelBalance [4,5,8,1,7,5,2,8,1,7,9,3,5,7,2,4,6,2,7,8,4]