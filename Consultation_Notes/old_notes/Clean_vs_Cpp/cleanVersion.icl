module cleanVersion
import StdEnv //same as #include<iostream>

isXEven :: Int -> Bool
//isXEven of type (Int -> Bool)
isXEven x = x rem 2 == 0

isXEven2 :: Int -> Bool
isXEven2 x
| x rem 2 == 0 = True
| otherwise = False 


isXEven3 x = flag
    where
        flag = x rem 2 == 0

variableX = 4

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib x = fib (x-1) + fib (x-2)

fibonacci :: Int -> Int
fibonacci x = fibAux x 0 1

fibAux :: Int Int Int -> Int
fibAux 1 _ b = b
fibAux x a b = fibAux (x-1) b (a+b)

Start = fibonacci 8
//int main() 
// return 0;