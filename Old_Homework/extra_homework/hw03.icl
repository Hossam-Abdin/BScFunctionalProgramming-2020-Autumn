module hw03
import StdEnv

// Determine the prime factors of a given positive integer. Construct a flat list containing the prime factors in ascending order. 

primeFactors :: Int -> [Int]


// Start = primeFactors 0 // []
// Start = primeFactors -5 // []
// Start = primeFactors 1 // []
// Start = primeFactors 17 // [17]
// Start = primeFactors 614889782588491410 // [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]




// Write a function that takes a list of numbers and
// breaks it into two lists, which contain even and 
// odd elements from the original list.
// For example: [3,5,6,8,7,9] -> [ [3,5,7,9], [6,8] ]

splitList :: [Int] -> [[Int]]


//Start = splitList [56,3,87,5,234,5,0,-4] //[[3,87,5,5],[56,234,0,-4]]
//Start = splitList [1] //[[1],[]]
//Start = splitList [420] //[[],[420]]
//Start = splitList []//[[],[]]



// Write a function that takes a list of integers and gives their least common multiple.


lcmList :: [Int] -> Int

// Start = lcmList [1, 10, 400453, 58359, 5389538] // 89966928901863090
// Start = lcmList [] // 0
// Start = lcmList [5] // 5
// Start = lcmList [4,5] // 20
// Start = lcmList [1, 2, 3] // 6
