module lists
import StdEnv

// Implement Init
myInit :: [Int] -> [Int]
myInit [x] = []
myInit [x:xs] = [x] ++ myInit xs

// Start = myInit [1,2,3,4] // [1,2,3]
                

// Implement Last

myLast :: [Int] -> Int
myLast [x] = x
myLast [x:xs] = myLast xs

myLast2 :: [Int] -> Int
myLast2 list = hd(reverse list)

// Start = myLast2  [1,2,3] // 3

myLast3 :: [Int] -> Int
myLast3 x
| (length x) == 1 = hd x
= myLast3 (tl x)
// Start = myLast3 [ 1,2,3]

// Implement myFlatten

myFlatten :: [[Int]] -> [Int] //type signature
myFlatten [] = []
myFlatten [x:xs] = x ++ myFlatten xs

// Start = myFlatten [[1, 2], [2, 3]]

flatt :: [[Int]] -> [Int]
flatt [] = []
flatt [head:tails] = head ++ flatt tails

// Start = flatt [[1, 2], [2, 3]]

// Implement reverse
myReverse :: [Int] -> [Int]
myReverse [] = []
myReverse [head:tail] = myReverse tail ++ [head] 

// Start = myReverse [1,2,3,4]

// Get the biggest element in a list
getBiggest :: [Int] -> Int
getBiggest [x] = x
getBiggest [x:xs]
| x > getBiggest xs = x
= getBiggest xs

// Start = getBiggest [3,1,2]

// check if a list symmetric
isSym :: [Int] -> Bool
isSym list = list == (reverse list)

// Start = isSym [1,2,1]

// check if all the elements are even

checkEven :: [Int] -> Bool
checkEven [] = True
checkEven [x:xs] = (isEven x) && checkEven xs   
        
// Start = checkEven [2,4,6,5]
