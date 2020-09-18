module practice1
import StdEnv

//Start = 123 * 123
//Start = (sin 12.0)
//Start = 12 / 7 // 1
//Start = 12.0 / 7.0 // 1.71428571428571 

f x = x * x

//Start = f 5 // Start = 25
// f 5
// f x = x * x
// => 5 * 5
// => 25

//Function-Name Argument1 Arg2 Arg3... = Calculation
g x = 2 * (f x) + 3 

//Start = g 3
// 2 * (f x) + 3
// 2 * (f 3) + 3
// 2 * (x * x) + 3
// 2 * (3 * 3) + 3
// 21

greater x y = (x > y)

//Start = greater 3 2
//Start = (12 * 3) == (4 * 7)

//Start = "answer1"

isOdd x = (x rem 2) == 1
//Start = isOdd 12

// Int, Real, String...

absolute x 
	| x >= 0.0 = x
	| x < 0.0 = ~x // -x !! ~x (0-x) (0~X)!!


func x
	| x == 1 = "one"
	| x == 2 = "two"
	| x == 2 = "two two" // Never reachable
	| otherwise = "other"

neg1 x = 0 - x  //
neg2 x = ~x     // This two are same

div3 :: Int -> String
div3 x 
	| (x rem 3) == 0 = "Divisible by 3"
	= "Not divisble"

//Start = div3 9.3

// Recursion

fact n 
	| n <> 1 = n * (fact (n-1))
	= 1

// Start = fact 3

// fact 3 = 3 * (fact 2) 
// fact 2 = 2 * (fact 1)
// fact 1 = 1 
// fact 2 = 2 * 1 
// fact 3 = 3 * 2
// 6

// 123 -> 1+2+3=6
// 100 -> 1+0+0=1
// 1234 -> 10

//sumOfDigits :: Int -> Int
sumOfDigits x
		| x < 10 = x
		= sumOfDigits (x / 10) + (x rem 10)
		
//Start = sumOfDigits 123 // 6
//Start = sumOfDigits 12.5

//func2 :: Int Int -> String
func2 x y
	| x == 1 = "case1"
	| y > 1 = "case2"
	= "case3"
	
//Start = func2 1 2.5

isPrime :: Int -> String
isPrime x 
	| x <= 1 = "X should be greater than 1"
	= isPrimeAux x (x-1)

isPrimeAux :: Int Int -> String
isPrimeAux x y
			| y == 1 = "It is prime"
			| (x rem y) == 0 = "Not a prime"
			= isPrimeAux x (y-1)

// Start = isPrime 5 => "It is prime"
// isPrime 5 = isPrimeAux 5 4 => "It is prime"
// isPrimeAux 5 4 = isPrimeAux 5 3 => "It is prime"
// isPrimeAux 5 3 = isPrimeAux  5 2 => "It is prime"
// isPrimeAux 5 2 = isPrimeAux 5 1 => "It is prime"
// isPrimeAux 5 1 = "It is prime"

// Start = "Not a prime"
// isPrime 4 = isPrimeAux 4 3 => "Not a prime"
// isPrimeAux 4 3 = isPrimeAux 4 2 => "Not a prime"
// isPrimeAux 4 2 = "Not a prime"


//isPrimeAux 5 0
//isPrimeAux 5 -1
//isPrimeAux 5 -2
//......
//......

Start = isPrime 1



  
