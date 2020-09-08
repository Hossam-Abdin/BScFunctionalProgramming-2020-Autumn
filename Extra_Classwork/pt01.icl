module pt01
import StdEnv

//Define a function which finds the maximum of two numbers
maximum :: Int Int -> Int
maximum thisNumber thatNumber
| thisNumber > thatNumber = thisNumber
| thatNumber > thisNumber = thatNumber
= abort "Something's wrong here bro!"

Start = maximum 9001 42 //9001