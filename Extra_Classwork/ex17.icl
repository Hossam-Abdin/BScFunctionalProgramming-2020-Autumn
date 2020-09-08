module ex17
import StdEnv


qsort :: [a] -> [a] | Ord a
qsort [] = []
qsort [c : xs] = qsort [x \\ x <- xs | x <  c] ++ [c] ++
                 qsort [x \\ x <- xs | x >= c]

// Start = qsort [2,1,5,3,6,9,0,1] // [0,1,1,2,3,5,6,9]

// sort is the built in operation for sorting

// Start = sort [3,1,4,2,0] // [0,1,2,3,4]

// inserting in already sorted list
Insert :: a [a] -> [a] | Ord a
Insert e [] = [e]
Insert e [x : xs]
| e <= x = [e , x : xs]
| otherwise = [x : Insert e xs]

// Start = Insert 5 [2, 4 .. 10] // [2,4,5,6,8,10]

mysort :: [a] -> [a] | Ord a
mysort [] = []
mysort [a:x] = Insert a (mysort x)

// Start = mysort [3,1,4,2,0] // [0,1,2,3,4]

// Start = Insert 3 (Insert 1 (Insert 4 (Insert 2 (Insert 0 [] ))))

merge1 :: [a] [a] -> [a] | Ord a
merge1 [] ys = ys
merge1 xs [] = xs
merge1 [x : xs] [y : ys]
| x <= y = [x : merge1 xs [y : ys]]
| otherwise = [y : merge1 [x : xs] ys]

// Start = merge1 [2,5,7] [1,5,6,8] // [1,2,5,5,6,7,8]
// Start = merge1 [] [1,2,3] // [1,2,3]
// Start = merge1 [1,2,10] [] // [1,2,10]
// Start = merge1 [2,1] [4,1] // [2,1,4,1]
// Start = merge1 [1,2] [1,4] // [1,1,2,4]

msort :: [a] -> [a] | Ord a
msort xs
| len <= 1 = xs
| otherwise = merge (msort ys) (msort zs)
where
   ys = take half xs
   zs = drop half xs
   half = len / 2
   len = length xs

// Start = msort [2,9,5,1,3,8] // [1,2,3,5,8,9]

fromn :: Int -> [Int]
fromn n = [n : fromn (n+1)]

//Start = fromn 8

//Start = map ((^)3) [1..] 

//Start = takeWhile ((>) 1000) (map ((^)3) [1..])

repeat1 :: a -> [a]
repeat1 x = list 
where list = [x:list]

//Start = repeat1 5

repeatn1 ::  Int a -> [a]
repeatn1 n x = take n (repeat x)

//Start = repeatn1 5 8

iterate1 :: (a->a) a -> [a]
iterate1 f x = [x: iterate1 f (f x)]

//Start = iterate1 inc 5 // [5,6,7,8,9,...]

//Start = iterate1 ((+)1) 5 // [5,6,7,8,9,...]

//Start = iterate1 ((*)2) 1 // [1,2,4,8,16,...]

//Start = iterate1 (\ x= x/10) 54321 // [54321,5432,543,54,5,0,0...]

// Prime numbers

divisible :: Int Int -> Bool
divisible x n = x rem n == 0

denominators :: Int -> [Int]
denominators x = filter (divisible x) [1..x]

prime :: Int -> Bool
prime x = denominators x == [1,x]

primes :: Int -> [Int]
primes x = filter prime [1..x]

//Start = primes 100 // [2,3,5,7,...,97]

sieve :: [Int] -> [Int]
sieve [p:xs] = [p: sieve [ i \\ i <- xs | i rem p <> 0]]

//Start = take 100 (sieve [2..]) 

// Define a function CountOccurrences that counts the number of times a given element is
// occurring in a given list.

CountOccurrences :: a [a] -> Int | == a
CountOccurrences a [x : xs] = f a [x : xs] 0
where
      f a [] i = i
      f a [x : xs] i
        | a == x = f a xs i+1
                 = f a xs i

//Start = CountOccurrences 2 [2, 3, 4, 2, 2, 4, 2, 1] // 4

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

:: Q = { nom :: Int
       , den :: Int
       } 
       
QZero :: Q       
QZero = { nom = 0, den = 1 }    
QOne :: Q
QOne = { nom = 1, den = 1 }

simplify :: Q -> Q
simplify {nom=n,den=d}
  | d == 0 = abort " denominator is 0"
  | d < 0  = { nom = ~n/g, den = ~d/g}
  | otherwise =  { nom = n/g, den = d/g}
  where g = gcdm n d

gcdm :: Int Int -> Int
gcdm x y = gcdnat (abs x) (abs y)
  where gcdnat x 0 = x
        gcdnat x y = gcdnat y (x rem y)

mkQ :: Int Int -> Q
mkQ n d = simplify { nom = n, den = d } 

//Start = mkQ 81 90

MyArray :: {Int}
MyArray = {1,3,5,7,9}

// Start = MyArray.[2] // 5

MapArray1 f a = {f e \\ e <-: a}

// Start :: {Int}
// Start = MapArray1 inc MyArray

:: Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

:: Tree a = Node a (Tree a) (Tree a)
          | Leaf

sizeT :: (Tree a) -> Int
sizeT Leaf = 0
sizeT (Node x l r) = 1 + sizeT l + sizeT r

aTree :: Tree Int

aTree = Node 4 (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) Leaf

//Start = aTree

//Start = sizeT aTree     // 4

atree = Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)

depth :: (Tree a) -> Int
depth Leaf = 0
depth (Node _ l r) = (max (depth l) (depth r)) + 1

Start = depth atree // 2
 

/////////////////////////////

// Exercises

// 1. Create arrays using comprehensions for the followings:

// - powers of 10 from 1st to the 10th

//Start :: {Int}

// - {(0,0),(1,1),..., (10,10)}

//Start :: {(Int, Int)}

// - one number at its halfs until is 0 e.g. {100, 50, 25, 12, 6, 3, 1, 0} 


// 2. Create a tree and write the elements of it in 3 ways: inorder, preorder, postorder

// 3. Write a function to test the equality of rational numbers.
//IsEqual :: Q Q -> Bool


