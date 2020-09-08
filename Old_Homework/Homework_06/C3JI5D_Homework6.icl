module C3JI5D_Homework6
import StdEnv

func1 :: Int [Int] -> [Int]
func1 x [] = []
func1 x [h:t] = [h:[x: (func1 x t)]]

//Start = func1 5 [1..10]

func2 :: [Int] -> [Int]
func2 [] = []
func2 [x] = [x]
func2 [h:t] = [h: (func2 (tl t)) ]

//Start = func2 [1..10]
//Start = func2 [1]

Start = func2 (func1 1337 [1..100])