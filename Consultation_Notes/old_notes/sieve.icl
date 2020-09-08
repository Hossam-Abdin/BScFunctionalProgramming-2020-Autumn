module sieve
import StdEnv

isPrime x = x == last(sieve2 x)

sieve2 :: Int -> [Int]
sieve2 x = [1] ++ sieveY [2..x] 1

sieveY :: [Int] Int -> [Int]
sieveY numList index
| isEmpty numList = numList
| index == len = [a] ++ sieveY (tl numList) 1
| b rem a  == 0 = sieveY (removeAt index numList) index
= sieveY numList (index+1)
    where
    len = length numList
    a = hd numList
    b = numList!!index

sieve :: Int -> [Int]
sieve n = sieveX (repeatn n True) n 2 4

sieveX :: [Bool] Int Int Int -> [Int]
sieveX boolList n i j
| j > n = sieveX boolList n (i+1) ((i+1)^2)
| i > toInt(sqrt(toReal n)) = [i\\i<-[1..n]|boolList!!(i-1)]
| boolList!!(i-1) = sieveX (updateAt (j-1) False boolList) n i (j+i)
= sieveX boolList n (i+1) ((i+1)^2)

Start = sieve2 10000
//Start = sieve 10000

