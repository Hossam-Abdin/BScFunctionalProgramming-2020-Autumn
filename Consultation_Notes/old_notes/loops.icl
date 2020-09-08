module loops
import StdEnv

/*
input x y
for i = 0 to y
x * 2
*/

func :: Int Int -> Int
func x y = ourLoop x y 0 

ourLoop :: Int Int Int -> Int
ourLoop x y i
| i < y = ourLoop (x*2) y (i+1)
= x

//Start = func 3 2

func2 :: Int Int -> Int
func2 x y = x* prod[ 2 \\ n<-[1..y] ]
//[ whatgoesintolist \\ ranges | conditions]
//Start = func2 3 2

func3 :: Int Int -> Int
func3 x y = (iterate ((*)2) x)!!y 

//Start = func3 3 2
//iterate ((*)2) 1 -> [1,2,4,8,16...]

//x * 2 == (*) x 2

//[1,2,3,4]!!2 = 3


fibo :: Int -> Int
fibo x = fibA x 0 1
fibA :: Int Int Int -> Int
fibA x a b
| x == 0 = a
= fibA (x-1) b (a+b)

fibList :: Int -> [Int]
fibList x = takeWhile ((>)x) [fibo n\\n<-[1..]]


Start = fibList 1000000000