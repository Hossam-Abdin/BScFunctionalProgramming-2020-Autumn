module ex1
import StdEnv 

// Start = 4+5 // 9
// Start = 42 // 42
// Start = 3+10*2 // 23
// Start = sqrt 3.0 // 1.73...

double x = x + x
quadruple x = double (double x)
// Start = double 2
// Start = quadruple 2

// factorial n = prod [1 .. n]
// Start = factorial 5

// two cases 
abs1 x
| x<0 = ~x
| otherwise = x

// Start = abs1 -4 // 4

// otherwise can be omitted 
abs2 x
| x<0 = ~x
= x

// Start = abs2 4 // 4

// more then two guards or cases
signof x
| x>0 = 1
| x==0 = 0
| x<0 = -1
 
// Start =  signof -8 // -1

factor :: Int -> Int
factor n
| n==0 = 1
| n>0 = n * factor (n-1)

// Start = factor 5

power :: Int Int -> Int
power x n
| n == 0 = 1
= x * power x (n-1)

Start = power 5 2

//Exercises lab 1
// 1. Define a function maxi with two arguments that delivers the maximum of the two.
//maxi :: Int Int -> Int


//Start = maxi 34 56


// 2. Define a function mini that has two arguments that delivers the minimum of the two.
//mini :: Int Int -> Int


//Start = mini 34 56


// 3. Triple a number.
//triple :: Int -> Int

//Start = triple 3


// 4. Check if a number is odd.
//isoddnr :: Int -> Bool


//Start = isoddnr 6


// 5. Check if a number is the sum of two other given numbers.
//issum :: Int Int Int -> Bool


//Start = issum 10 6 3


// 6. Add 100 to a number.
//add100 :: Int -> Int


//Start = add100 5


// 7. Check if a number is multiple of 10.
//ismult10 :: Int -> Bool


//Start = ismult10 20


// 8. Add the numbers from 1..N in a recursive function.
//addn :: Int -> Int


//Start = addn 5


// 9. Compute the cube of a number
//cube :: Int -> Int


//Start = cube 4


// 10. Check if an integer is even - in two ways. To divide integer use /, for remainder use rem
//even1 :: Int -> Bool


//Start = even1 34
//Start = even1 45

//version 2.
//even2 :: Int -> Bool


//Start = even2 34
//Start = even2 45


// 11. Add the digits of a number e.g. for 123 is 6
//isum :: Int -> Int


//Start = isum 1234