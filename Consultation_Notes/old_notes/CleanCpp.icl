module CleanCpp
import StdEnv

// Start :: Int
// Start = 1

// x::Int
// x = 3
// Start :: Int
// Start = x

addTwo :: Int -> Int
addTwo 0 = -1
addTwo x
| x < 10 = x+1
= x + 2

// Start = addTwo (addTwo 9)

fac :: Int -> Int
fac 0 = 1
fac n = n * fac(n-1)

// Start = fac 5

fac2 :: Int -> Int
fac2 n
| n < 0 = abort "blah"
= facAux n 1

facAux :: Int Int -> Int
facAux 0 acc = acc
facAux n acc = facAux (n-1) (acc * n)

//Start = fac2 5

fib :: Int -> Int
fib n
| n<=0 = abort "1"
= fibAux n 1 1

fibAux :: Int Int Int -> Int
fibAux 1 a b = b
fibAux n a b = fibAux (n-1) b (a+b)

//Start = fib 30
//Start = take 100[fib n \\ n<-[1..]| isEven n]


rainfall2 :: [Int] -> Real
rainfall2 list = avg[toReal x\\x<-(takeWhile ((<>)999) list)|x>=0]