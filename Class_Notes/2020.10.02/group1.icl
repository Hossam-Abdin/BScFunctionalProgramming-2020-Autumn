module group1
import StdEnv


init :: [a] -> [a]
init [x] = []
init [x:xs] = [x: init xs] // [x] ++ init xs

// Start = init [1,2,3,4,5] = [1: init [2,3,4,5]] = [1 : [2: init [3,4,5]]] = [1: [2: [3: init [4,5]]]]
// = [1: [2: [3: [4: init [5]]]]] = [1, 2, 3, 4]

Start = [1..-5]

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

// Start = fib 45

// fib :: Int Int Int -> Int
// fib a b 0 = a
// fib a b c = fib b (a+b) (c-1)

// Start = fib 1 1 5

// fib 1 1 5 = fib 1 2 4 = fib 2 3 3 = fib 3 5 2
// fib 5 8 1 = fib 8 13 0 = 8

// fib :: Int -> (Int, Int)
// fib 1 = (1, 1)
// fib n = (b, a+b)
// where
//     (a,b) = fib (n-1)

// Start = fib 5 = (5, 8)

//     (a1, b1) = fib 4 = (3, 5)

//                 (a2, b2) = fib 3 = (2, 3)

//                             (a3, b3) = fib 2 = (1, 2)
//                                     (a4, b4) = fib 1 = (1, 1)



(f) infix 4 :: [a] [a] -> Bool | == a
(f) [] [] = True
(f) [] [y:ys] = False
(f) [x:xs] [] = False
(f) [x:xs] [y:ys] = (x==y) && (xs==ys)

// Start = [1,2] f [1,2]