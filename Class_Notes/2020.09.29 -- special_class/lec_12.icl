module lec_12
import StdEnv

// *Recrusion

// **recap

/*
find factorial of N
N! = 1 * 2 * 3... * (N-1) * N = (N-1)! * N
0! = 1
5! = 5 * 4* 3 * 2 * 1
*/

factorialN :: Int -> Int
factorialN 1 = 1
factorialN n = n * factorialN (n-1)

// Start = factorialN 5 // 120

// Given integer number, find sum of its digits
sumDigits :: Int -> Int
sumDigits n 
| n < 0 = sumDigits ((-1) * n)
| n < 10 = n
= (n rem 10) + sumDigits (n/10)

// Start = sumDigits 12345 // 15
// Start = sumDigits 5 // 5
// Start = sumDigits -54 // 9
        
            

/*
Write a function to decide if a number is a Magic number
INFO : Magic number has a special properity the first n of its digits, 
should be multiple of n.
Note : 0 is not a magic number
i.e : 120 is Magic number since 12 is multiple of 2 and 120 is multiple of 3. 
On the other hand 118 is not since 11 is not multiple of 2.
*/

digitsNum :: Int -> Int
digitsNum n 
| n < 10 = 1
= 1 + digitsNum (n/10)

isMagicNum :: Int -> Bool
isMagicNum 0 = False
isMagicNum n 
| n < 10 = True
= (n rem (digitsNum (n)) == 0) && isMagicNum (n/10)

// Start = isMagicNum 0 // False


// *Lists
// ** why lists are important

// ** How can we write lists

// Start = [1.0, 2.2, toReal(3)]

anything :: Int -> Bool
anything n = True

// Start = [5>2, 5==2, (anything 5)]

// ** dot-dot expression

// Start = [1..5]
