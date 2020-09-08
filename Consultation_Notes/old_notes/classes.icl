module classes
import StdEnv

/*
Class is a way of declaring a set of functions.
Note: This is NOT the same as a class in C++,
JAVA, Python, etc...
*/

FirstOp :: a -> a | +, one a
FirstOp x = x + one

//Start = FirstOp 3 //4
//Start = FirstOp 3.14 //4.14

class TestOp someType :: someType -> someType
/*There is a CLASS of functions that will
be named TestOp*/
instance TestOp Int
where
    TestOp x = x + 1

//Start = TestOp 3 //4

instance TestOp Real
where
    TestOp x = x * (acos -1.0)
//Start = TestOp 2.0 //6.28318530717959

instance TestOp Bool
where
    TestOp x = not x
//Start = TestOp True //False

instance TestOp String
where
    TestOp x = x +++ x
//Start = TestOp "Hello " //"Hello Hello "

class func a
where
    f1 :: a -> a | PlusMin, one a
    f1 a :== a + one
    f2 :: a -> Bool | Ord, zero a
    f2 a :== a < zero

//Start = f1 4
//Start = f1 (-1.0 *(acos -1.0))
//Start = f2 -3.125
//Start = f2 10
/*
class Eq a | instance == a
where
	(<>) infix 4 :: !a !a -> Bool | Eq a
	(<>) x y :== not (x == y)

class IncDec a | instance + ainstance - ainstance one ainstance zero a
where
	inc :: !a -> a | + a & one a
	inc x :== x + one
    dec :: !a -> a | - a & one a
	dec x :== x - one

class Ord a	| < a
where
  (>) infix  4 :: !a !a	-> Bool | Ord a
  (>) x y  :== y < x 
  (<=) infix 4 :: !a !a -> Bool | Ord a
  (<=) x y :== not (y<x)
  (>=) infix 4 :: !a !a -> Bool | Ord a
  (>=) x y :== not (x<y) 
  min::!a !a ->	a | Ord a
  min x y  :== case (x<y) of True = x; _ = y
  max::!a !a ->	a | Ord a
  max x y  :== case (x<y) of True = y; _ = x

*/