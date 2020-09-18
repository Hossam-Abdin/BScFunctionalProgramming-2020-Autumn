module man01
import StdEnv

Start = 11

Start = 0

Start = -23

Start = 9.8

Start = 2 + 3

Start = 3 - 2

Start = 2 * 3

// Math functions

start = sqrt 4

Start = sin 60.0

// we have also the exp


Start = true // write sth to generate True (write correctly)

/* boolean operators : <, <=, ==, <>, &&, || */

// simple functions

// guards

// 1. Define a function maxi with two arguments that delivers the maximum of the two.
//maxi :: Int Int -> Int


//Start = maxi 34 56

// 2. Check if a number is odd.
//isoddnr :: Int -> Bool


//Start = isoddnr 6

// 3. Check if a number is the sum of two other given numbers.
//issum :: Int Int Int -> Bool


//Start = issum 10 6 3

// simple recursion

// 4. Add the numbers from 1..N in a recursive function.
addn :: Int -> Int
addn n = addnaux 1 n

// addnaux :: Int Int -> Int

// Start = addn 5