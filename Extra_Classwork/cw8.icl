module cw8
import StdEnv

/*
1. Given a tree and an integer n, find the nodes equal to n and replace by '0'
*/

:: Tree a = Node a (Tree a) (Tree a)
          | Leaf

f1 :: Int (Tree Int) -> (Tree Int) 



//Start = f1 3 atree  //(Node 4 (Node 2 (Node 1 Leaf Leaf) (Node 0 Leaf Leaf)) (Node 6 (Node 0 Leaf Leaf) (Node 7 Leaf Leaf)))
//atree = Node 4 (Node 2 (Node 1 Leaf Leaf)(Node 3 Leaf Leaf)) (Node 6 (Node 3 Leaf Leaf)(Node 7 Leaf Leaf))


/*
2. Given a tree, find the level between max node and min node
*/
btree = Node 4 (Node 2 (Node 1 Leaf Leaf)(Node 3 Leaf Leaf)) (Node 6 (Node 5 Leaf Leaf)(Node 7 Leaf Leaf))

ctree =  Node 4 (Node 2 (Node 8 Leaf Leaf)(Node 9 (Node 4 (Node 16 Leaf Leaf) Leaf) Leaf)) (Node 7 (Node 3 Leaf Leaf)(Node 2 Leaf Leaf))





f2 :: (Tree Int) ->Int

//Start = f2 ctree //3


/*
3. 
Define algebraic type : Day (Mon,Tue,Wed,Thu,Fri,Sat,Sun).
And define function IsWeekend :: Day -> Bool to check if it is Sat or Sun.
if it is weekend, then output "Happy day!",Otherwise,"Oh my god"
*/


:: Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

f3 :: Day -> String

//Start = f3 Sun  // "Happy day!"
//Start = f3 Tue  // "Oh my god"
