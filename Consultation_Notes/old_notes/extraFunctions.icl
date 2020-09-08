module extraFunctions
import StdEnv

/*
This is an extra practice file.
*/


/*
Below is a function, where given a Tree and an Int,
it will return a Bool.

The function returns True if the node is found AND
every node from the node to the root is an Even number.

The function returns False if the node is not found OR
any of the nodes from the node to the root is an Odd number.

Note how we traverse the tree and check the values.
Turning the tree to a list will NOT work here since 
we need to check the path back to the root node so
we need the connections.
*/
:: Tree a = Node a (Tree a) (Tree a) | Leaf

testTree :: (Tree Int)
testTree = Node 10 (Node 4 (Node 3 (Node 2 Leaf Leaf) Leaf) (Node 8 (Node 6 Leaf Leaf) Leaf)) (Node 16 (Node 13 Leaf (Node 14 Leaf Leaf)) (Node 18 (Node 17 Leaf Leaf) (Node 22 (Node 20 Leaf Leaf) (Node 23 Leaf Leaf))))

evenCheck :: (Tree Int) Int -> Bool
evenCheck Leaf _ = False
evenCheck (Node x l r) n
| x == n && isEven x = True
| isOdd x = False
= or[evenCheck l n, evenCheck r n]

//Start = evenCheck testTree 6 //True
//Start = evenCheck testTree 2 //False
//Start = evenCheck testTree 14 //False
//Start = evenCheck testTree 20 //True
//Start = evenCheck testTree 23 //False
//Start = evenCheck Leaf 9001 //False


/*
Below are functions that will break up
a string into  the individual words, and
put them back together again.
*/
parse :: String -> [String]
parse s
| size s == 0 = [] //if we have no letters left, we stop recursion.
= [word : parse rest]
where
    l = [x\\x<-:s] //convert string to list.
    (w,r) = span (\x = x <> ' ') l
    //span combines takeWhile and dropWhile to give us the first word and everything else.
    word = {x\\x<-w} //converting the first word back to a string.
    rest
    | isEmpty r = "" //handles the end case.
    = {x\\x<-(tl r)} //converting the rest back to a string for recursion. tl to remove the ' ' character.
//Start = parse "Joy to the World!" //["Joy","to","the","World!"]

concatStrings :: [String] -> String
concatStrings list = foldr (\ x y = x +++ " " +++ y) "" list
//Start = concatStrings ["Joy","to","the","World!"]
