module C3JI5D_Homework4
import StdEnv

months :: Int -> [Int]
months x
| (x rem 4) > 0 = [31,28,31,30,31,30,31,31,30,31,30,31]
| (x rem 100) > 0 = [31,29,31,30,31,30,31,31,30,31,30,31]
| (x rem 400) > 0 = [31,28,31,30,31,30,31,31,30,31,30,31]
| otherwise = [31,29,31,30,31,30,31,31,30,31,30,31]

days::[Int] -> Int
days x = foldl (+) (x!!2) (take ((x!!1)-1) (months (x!!0))) 

days2wait :: [Int] [Int] -> Int
days2wait x y
| days x == days [hd x : tl y] = 0
| days x > days [hd x : tl y] = days [hd x : tl y] - days x + 365
| days x < days [hd x : tl y] = days [hd x : tl y] - days x

Start= days2wait [2019,3,10][1990,5,26]