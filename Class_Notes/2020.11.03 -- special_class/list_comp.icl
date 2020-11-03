module list_comp

import StdEnv

// List comprehension

// Start = [x+1 \\ x <- [1..5] | isEven x]


//Some special cases
// Start = [(a, b) \\ a<-[1..10] & b<-[1..10]] // also how zip works in list comp
// Start = [(a, b) \\ a<-[1..12] , b<-[1..31]]

// filter with list comp
// Start = filter isEven [1..10] // [2,4..10]

myFilter :: (Int -> Bool) [Int] -> [Int]
myFilter cond list = [x \\ x<-list | (cond x)]

// Start = myFilter isEven [1..10]

// map with list comp
myMap :: (a -> b) [a] -> [b]
myMap func list = [func x \\ x <- list]

// Start = myMap inc [1..10]

// zip with list comp

/**4
  * Write a function that checks if each elements in the list appear even times.
  
  * For example, checkEven [1,1,2,2,2,2,3,5,3,5] = True
  */

isEvenAppearence :: Int [Int] -> Bool
isEvenAppearence a list = isEven (length [x \\ x <- list | x == a])

checkEven :: [Int] -> Bool
checkEven [] = False
checkEven list = and (map (\x = isEvenAppearence x list) list)

// Start = checkEven [1,1,2,2,2,2,3,5,3,5] // True
// Start = checkEven [1,1,2,2,1] // False
// Start = checkEven [] //False

/**3
  * Write a function that checks if a list of numbers is odd,even,odd,even...
  
  * For exmaple: SeqCheck [1,2,3,4,6] = False because 4 is even, but 6 is not odd.
  */

// SeqCheck :: [Int] -> Bool

// Start = SeqCheck [1..10] //True

// Start = SeqCheck [1,2,3] //True

// Start = SeqCheck [2,3,4] //False

// Start = SeqCheck [1,3,4,5] //False

// Start = SeqCheck [1,2,3,4,6,7] //False

// Start = SeqCheck [] //False

// qsort