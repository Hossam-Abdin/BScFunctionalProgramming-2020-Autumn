module C3JI5D_Homework8
import StdEnv

// 1. Generate the following list: [[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5],[1,2,3,4,5,6],[1,2,3,4,5,6,7],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9,10]]

f1 :: Int -> [[Int]]
f1 y = take y [ [1..x] \\ x<-[1..]]

//Start = f1 10

// 2. Generate pairs like in the following: [[1,2,3], [4,5], [6,1,8], []] -> [(1,6),(2,20),(3,48),(4,1)]

f2 :: [[Int]] -> [(Int, Int)]
f2 zeta = [ (x,y) \\ x<-[1..]&y<-(map (foldr (*) 1) zeta) ]
//Start = f2 [[1,2,3], [4,5], [6,1,8], []]

// 3. Generate the first 100 positive elements in a list in which a number is multiple of 25, but is not multiple of 100.

f3 :: [Int]
f3 = take 100 [ x*25 \\ x<-[1..] | (x rem 4) <> 0 ]
Start = f3