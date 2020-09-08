module lambdaFunctions
import StdEnv

//func1 x = 2*x
//Start = func1 3 //6
//Start = (\x = 2*x) 3
//func2 x y z = 2*x + y - z
//Start = func2 1 2 3
//Start = (\x y z = 2*x + y - z) 1 2 3
//func3 (a,b) = a-b
//Start = func3 (3,5)
//Start = (\(a,b) = a-b) (3,5)

//func4 a = func5 a 2 3
//func5 a b c = a + b + c
//Start = func4 5

//func6 a = (\b c = a + b + c) 2 3
//Start = func6 5

/*func7 a
| isEven a = 1
= 0*/
//Start = func7 48