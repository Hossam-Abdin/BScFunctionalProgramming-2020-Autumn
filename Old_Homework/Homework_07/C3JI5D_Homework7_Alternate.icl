module C3JI5D_Homework7_Alternate
import StdEnv

/*
aux1 :: [Int] Int -> [Int]
aux1 []x = []
aux1 list x = [x, ( length( filter ( (==) x ) list ) ), toInt(toReal(100)*(toReal(length( filter ( (==) x) list )) / toReal((length list)))) ]
*/

//MakeFrequenceTable x = removeDup( map (aux1 x) x )

//Start = toInt(toReal(100)*(toReal(length( filter ( (==) 2) [1,2,3,4,2] )) / toReal((length [1,2,3,4,2]))))


MakeFrequenceTable a = removeDup( map ( (\ list x = [x, ( length( filter ( (==) x ) list ) ), toInt(toReal(100)*(toReal(length( filter ( (==) x) list )) / toReal((length list)))) ]) a) a )

Start = MakeFrequenceTable  [1,3,2,3,2] 