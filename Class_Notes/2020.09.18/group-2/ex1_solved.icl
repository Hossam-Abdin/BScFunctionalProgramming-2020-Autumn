module ex1_solved

import StdEnv

//Start = 43

//Start = 4*56+7

//Start = 4+5

//Start = sqrt 3.0

double x = x + x

//Start = double 2

quadruple x = double (double x)

//Start = quadruple 2

factorial n = prod [1..n]
// n! = 1*2*3*..*(n-1)*n

//Start = factorial 5

//Start = abs 5

abs1 x
| x < 0 = ~x
| otherwise = x

//Start = abs1 -4

abs2 x
| x < 0 = ~x
= x

//Start = abs2 5

signof x
| x > 0 = 1
| x == 0 = 0
| x < 0 = -1

//Start = signof -10

maxi :: Int Int -> Int 
maxi x y
| x > y = x
= y

//Start = maxi 5 44

mini :: Int Int -> Int
mini x y
| x < y = x
= y

//Start = mini 5 44

even1 :: Int -> Bool
even1 x
| x rem 2 == 0 = True
= False

//Start = even1 22
//Start = even1 23

even2 :: Int -> Bool
even2 x = (x rem 2 == 0)

//Start = even2 22
//Start = even2 23

even3 :: Int -> Bool
even3 x = (x / 2)*2 == x

//Start = even3 22
//Start = even3 23

sq :: Int -> Int
sq x = x * x

//Start = sq 4

sq1 :: Int -> Int
sq1 x = x^2

//Start = sq1 5

cubic :: Int -> Int
cubic x = x^3

//Start = cubic 3

power :: Int Int -> Int
power x n = x^n

//Start = power 2 5

power1 :: Int Int -> Int
power1 x n 
| n == 0 = 1
| n > 0 = x * power1 x (n-1)

//Start = power1 2 5

div9 :: Int -> Bool
div9 x = x rem 9 == 0

//Start = div9 11
//Start = div9 81

isum :: Int -> Int
isum x
| x == 0 = 0
= (x rem 10) + isum (x / 10)

// 123 3 + isum 12
// 2 + isum 1
// 1 + isum 0
// 0
// 3+2+1+0 = 6

//Start = isum 123 // 6
//Start = isum 12345 // 15

div91 x = (isum x) rem 9 == 0

//Start = div91 11
Start = div91 81