module group1
import StdEnv


something :: {Int}
something = {1,2,3,4,5}

//Start = something.[2] //gets us the index 2 element

//with an array you can not use .. constructor

//Start = {1,3..5} //does not work

//Start = something
//Start :: {Int}
//Start = {1,2,3,4,5}

//arrays can not use the : constructor
//[a:b]  [a,b,c:d]

//arrays CAN use the , constructor and the \\ constructor

blah :: {Int}
blah = {x \\ x<-[1..100] | isOdd x}

//Start = blah

lol :: {Int}
lol = {x \\x <-: blah  | x>50 }

//Start = size lol

//[1,2,3,4,5]
//{1,2,3,4,5}

//string is actually #{Char}

myName = "Evan"

initial :: String -> Char
initial x = x.[0]

//Start = initial myName //'E'

//Start = size myName

reverseString :: String -> String
reverseString x = result
where
    l = [ elem  \\ elem <-: x ] //built a list from an array
    m = reverse l
    result = { elem \\ elem <- m} //construct an array from a list

//Start :: String
//Start = reverseString myName

isPal :: String -> Bool
isPal x = l == reverse l
where
    l = [e\\e<-:x]

numDigits :: Int -> Int
numDigits x = size (toString x)

// isPal :: Int -> Bool
// isPal n
// where
//     s = toString n


// arrayToList
// listToarray


Start =