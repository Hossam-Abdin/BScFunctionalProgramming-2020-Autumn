module C3JI5D_Homework3
import StdEnv

breakdown :: Int -> [Int]
breakdown x
| x == (x rem 10) = [x]
| otherwise = breakdown (x/10) ++ [x rem 10]

modify :: [Int]->[Int]
modify []=[]
modify [x:xs]
| x==0 = [0 : modify xs]
| otherwise = [x-1 : modify xs]

rebuild :: [Int] -> Int
rebuild [] = 0
rebuild x = ( 10 * rebuild (init x)) + (last x)

encode :: Int -> Int
encode x = rebuild ( modify ( breakdown x ) )

Start = encode 45605

