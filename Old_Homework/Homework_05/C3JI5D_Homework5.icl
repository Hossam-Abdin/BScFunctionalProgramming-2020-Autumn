module C3JI5D_Homework5
import StdEnv

/*
Write three functions f1, f2, f3.

f1. Insert x as second element in every sublist of a list.
If the sublist was empty then x will be the only element in the new sublist.

[[1,2], [3,4,5], [6,5,9,7], [], [8]] 10 -> [[1,10,2], [3,10,4,5], [6,10,5,9,7], [10], [8,10]]

f2. Check if a list contains 2 equal elements one after the other
(they can be anywhere in the list)

for [1,2,3,3,2,4,5] is True for [1 .. 5] is False

f3. Extract the second element of the sublists (if there is no such element, ignore that sublist)

[[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]]-> [2,4,7,9]

You can test the functions separately as you wish,
but at the end please include the following start expression as well:

Start = (f1 [[1,2], [3,4,5], [6,5,9,7], [], [8]] 66, f2 [1,2,3,4,2,2], f3 [[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]])
*/


f1_aux :: Int [Int] -> [Int]
f1_aux x [] = [x]
f1_aux x [h:t] = [h:[x:t]]

Start = f1_aux 1337 [1..10]


f1 :: [[Int]] Int -> [[Int]]
f1 x y = map (f1_aux y) x

//Start = f1 [[1,2], [3,4,5], [6,5,9,7], [], [8]] 10

f2_aux :: Int [Int] -> Bool
f2_aux x [] = False
f2_aux x [h:t]
| x == h = True
| x <> h = f2_aux x t

//Start = f2_aux 10 [1..10]

f2 :: [Int] -> Bool
f2 [] = False
f2 [h:t]
| f2_aux h t = True
| otherwise = f2_aux (hd t) (tl t)

//Start = f2 [1,2,2,3,4,5]

f3_aux :: [Int] -> [Int]
f3_aux [] = []
f3_aux [x] = []
f3_aux [a:b] = [hd b]

//Start = f3_aux [1..5]
//Start = f3_aux []

f3 :: [[Int]] -> [Int]
f3 [] = []
f3 x = flatten (map (f3_aux) x)

//Start = f3 [[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]]

Start = (f1 [[1,2], [3,4,5], [6,5,9,7], [], [8]] 66, f2 [1,2,3,4,2,2], f3 [[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]])

