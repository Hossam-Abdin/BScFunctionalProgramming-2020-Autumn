module C3JI5D_Homework2
import StdEnv

abs_sub :: Int Int -> Int
abs_sub x y
| x > y = x-y
| x < y = y-x
| x == y = 0

modulus :: Int Int -> Int
modulus x y
| y <= 0 = 0
| otherwise = abs_sub x ( y * (x/y))

my_gcd :: Int Int -> Int
my_gcd x y
| y == 0 = x
| otherwise = my_gcd y (modulus x y)

Start = my_gcd 60 82
