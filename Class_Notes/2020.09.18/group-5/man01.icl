module man01
import StdEnv

// Start = 11

// Start = 0

// Start = -23

//Start = 9.8

// Start = 2 + 3.0

//Start = 3 - 2

//Start = 2 * 3

// Math functions

// Start = inc 2

// Start = sqrt 4.0

// Start = sin 60.0

// we have also the exp


// Start = True // write sth to generate True (write correctly)

// True or False

/* boolean operators : <, <=, ==, <>, &&, || */

// 5 == 5

// 5 <> 4 / 5 != 4

// Start = False || False

// simple functions

// f(x) = x + 1 // f(3) = 4

// (2+3)*4

// guards

mo :: Int Int -> Int
mo x y = x+y

// 1. Define a function maxi with two arguments that delivers the maximum of the two.
// + :: Int Int -> Int // + 3 3.4
maxi :: Int Int -> Int
maxi x y
| x > y = x
| False = 2
= y


// Start = maxi 2 56

// Start = "Hello World"

// 2. Check if a number is odd.
isoddnr :: Int -> Bool
isoddnr x = (x rem 2) <> 0

//Start = isoddnr 6


// 3. Check if a number is the sum of two other given numbers.
issum :: Int Int Int -> Bool
issum x y z = ((x + y) == z) || ((y + z) == x) || ((x + z) == y)

//Start = issum 10 6 3

// simple recursion

power :: Int Int -> Int // should behave like 2^3 = 8
power x y
| y == 0 = 1
| y == 1 = x
= x * power x (y-1)

// Start = power 0 3


// 4. Add the numbers from 1..N in a recursive function.
//addn :: Int -> Int

// addnaux :: Int Int -> Int

// Start = addn 5

addn :: Int -> Int
addn x = addnaux x 1

addnaux :: Int Int -> Int
addnaux x y
| y == x = x
= y + addnaux x (y+1)  
 


Start = addn 5























