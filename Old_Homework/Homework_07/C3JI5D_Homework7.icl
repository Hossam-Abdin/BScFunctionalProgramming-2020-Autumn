module C3JI5D_Homework7
import StdEnv


aux1 :: [Int] Int -> [Int]
aux1 []x = []
aux1 list x = [x, ( length( filter ( (==) x ) list ) ), toInt(toReal(100)*(toReal(length( filter ( (==) x) list )) / toReal((length list)))) ]

aux2 :: [Int] [Int] -> [[Int]]
aux2 [] y = [ ]
aux2 x y = [ aux1 y (hd x): aux2 (filter ((<>) (hd x) ) x) y]

MakeFrequenceTable x = aux2 x x

Start = MakeFrequenceTable  [1,3,2,3,2] 

//Start = aux2 [1,3,2,3,2] [1,3,2,3,2]

//Start = toInt(toReal(100)*(toReal(length( filter ( (==) 2) [1,2,3,4,2] )) / toReal((length [1,2,3,4,2]))))
