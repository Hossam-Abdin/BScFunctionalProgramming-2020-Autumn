module ex18
import StdEnv

//// Records

:: Point = {  x       ::  Real
            , y       ::  Real
            , visible ::  Bool
            }

:: Vector = { dx       ::  Real
            , dy       ::  Real
            }
  
Origo :: Point
Origo = { x = 0.0
        , y = 0.0
        , visible = True
        }
Dist :: Vector
Dist = { dx = 1.0
       , dy = 2.0
       }

IsVisible :: Point -> Bool
IsVisible {visible = True} = True
IsVisible _                = False

xcoordinate :: Point -> Real
xcoordinate p = p.x

hide :: Point -> Point
hide p = { p & visible = False }

Move :: Point Vector -> Point
Move p v = { p & x = p.x + v.dx, y = p.y + v.dy } 

// Start = Move (hide Origo) Dist

//// Trees

:: Tree a = Node a (Tree a) (Tree a)
          | Leaf

treesort :: ([a]-> [a]) | Eq, Ord a
treesort = collect o listtoTree

listtoTree :: [a] -> Tree a | Ord, Eq a
listtoTree [] = Leaf
listtoTree [x:xs] = insertTree x (listtoTree xs)

insertTree :: a (Tree a) -> Tree a | Ord a
insertTree e Leaf = Node e Leaf Leaf
insertTree e (Node x le ri)
   | e<=x = Node x (insertTree e le) ri
   | e>x  = Node x le (insertTree e ri)

collect :: (Tree a) -> [a]
collect Leaf = []
collect (Node x le ri) = collect le ++ [x] ++ collect ri

Start = treesort [3, 1, 5, 9, 2, 7, 0]


// Exercises

// 1. Compute the sum of the numbers placed in the nodes of a tree.
//sumT :: (Tree Int) -> Int

// 2. Test about 3 points if they can form a right-angled triangle.
//IsTriangle :: Point Point Point -> Bool

// 3. Write another sort algorithm for sorting a list
