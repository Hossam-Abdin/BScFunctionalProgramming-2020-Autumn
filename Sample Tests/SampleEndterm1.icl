module SampleEndterm1
import StdEnv

// Solve as many functions as you can. Each exercise is of 10%, to pass min. 40% is necessary.
// marks: 40%-2,60%-3,80%-4,100%-5. 
//1.
//Define a tree type and use the followings for testing your solution.

tree1 = Node 10 (Node 7 (Node 3 Leaf Leaf) (Node 15 Leaf Leaf)) (Node 5 Leaf (Node 10 Leaf Leaf))
tree2 = Node 9 (Node 1 (Node 0 (Node 7 Leaf Leaf) Leaf) (Node 15 Leaf Leaf)) (Node 4 (Node 4561 Leaf Leaf) (Node 8 (Node 1663 Leaf Leaf) Leaf))
unitTree = Node 1337 Leaf Leaf
noTree = Leaf

:: Tree a = Node a (Tree a) (Tree a) | Leaf


//Write a function that takes a tree as a parameter and returns a list of nodes which have at least one prime child.
//An empty tree will return [].

extractNode :: (Tree a) -> a
extractNode (Node x _ _ ) = x

goL :: (Tree a) -> (Tree a)
goL (Node _ l _ ) = l

goR :: (Tree a) -> (Tree a)
goR (Node _ _ r ) = r

isLeaf :: (Tree a) -> Bool
isLeaf Leaf = True
isLeaf _ = False

getChildren :: (Tree a) -> [a]
getChildren (Node _ Leaf Leaf) = []
getChildren (Node _ (Node a _ _) Leaf) = [a]
getChildren (Node _ Leaf (Node b _ _)) = [b]
getChildren (Node _ (Node a _ _) (Node b _ _)) = [a,b]

/*
getChildren t
| isLeaf(goL t) && isLeaf(goR t) = []
| isLeaf(goL t) = [extractNode(goR t)]
| isLeaf(goR t) = [extractNode(goL t)]
= [extractNode(goL t),extractNode(goR t)]
*/

isPrime :: Int -> Bool
isPrime n
| n <= 1 = False
= isEmpty[x\\x<-[2..(n-1)]|n rem x == 0]

primeChildren :: (Tree Int) -> [Int]
primeChildren Leaf = []
primeChildren t
| or(map isPrime (getChildren t)) = primeChildren (goL t) ++ [extractNode t] ++ primeChildren (goR t)
= primeChildren (goL t) ++ primeChildren (goR t)
//Start = primeChildren tree1 //[10,7]
//Start = primeChildren tree2 //[0,4,8]
//Start = primeChildren unitTree //[]
//Start = primeChildren noTree //[]

//2.
//Given a tuple of arrays, representing sets of integers, return a list containing the result of their symmetric-difference.
//The symmetric-difference between two sets is equivalent to the difference between their union and their intersection.
symmetricDiff :: ({Int}, {Int}) -> [Int]
symmetricDiff (a1, a2) = [x\\x<-l1| not(isMember x l2)] ++ [x\\x<-l2| not(isMember x l1)]
where
    l1 = [x\\x<-:a1]
    l2 = [x\\x<-:a2]

//Start = symmetricDiff ({1,2,3,4},{3,4,5,6}) //[1,2,5,6]
//Start = symmetricDiff ({1,2,3,4},{-2,-4,13,0}) //[1,2,3,4,-2,-4,13,0]
//Start = symmetricDiff ({1,2,3,4},{1,2,3,4}) //[]
//Start = symmetricDiff ({1,2,3,4},{}) //[1,2,3,4]
//Start = symmetricDiff ({},{1,2,3,4}) //[1,2,3,4]
//Start = symmetricDiff ({},{}) //[]

//3.
//Define a Q type for rational numbers.
//Write a function that receives two fractions and calculates their division. Simplify the fraction before returning.
//In case the nominator is zero, set the denominator to zero as well.

:: Q = {nom :: Int, den :: Int}

simplify :: Q -> Q
simplify {nom = a, den = b}
| b == 0 = abort "Division by Zero Error"
| b < 0 = simplify {nom = -1 * a, den = -1 * b}
= {nom = a/g, den = b/g}
where
    g = gcd a b

//Start = simplify {nom=36, den= -4}

instance / Q
where
    / x y = simplify{nom = x.nom * y.den, den = x.den * y.nom}

fracDivision :: Q Q -> Q
fracDivision a b = a/b

//Start = fracDivision {nom=5, den=1} {nom=6, den=5} //{nom=25, den=6}
//Start = fracDivision {nom=10, den=2} {nom=3, den=4} //{nom=20, den=3}
//Start = fracDivision {nom=0, den=2} {nom=100, den=4} //{nom=0, den=1}
//Start = fracDivision {nom=15, den=2} {nom=3, den=12} //{nom=30, den=1}

half = { nom=1, den=2 }
third = { nom=1, den=3 }
fourth = { nom=1, den=4 }
fifth = { nom=1, den=5 }
sixth = { nom=1, den=6 }
threehalf = { nom=3, den=2 }
twothird = { nom=2, den=3 }
ninefourth = { nom=9, den=4 }
threefifth = { nom=3, den=5 }

miniTree = Node fifth (Node sixth Leaf Leaf)(Node third (Node fourth Leaf Leaf) Leaf)			
smallTree = Node half (Node fourth Leaf Leaf) (Node ninefourth Leaf Leaf)
bigTree = Node half (Node fifth (Node sixth Leaf Leaf)(Node third (Node fourth Leaf Leaf) Leaf))(Node threehalf (Node threefifth Leaf (Node twothird Leaf Leaf))(Node ninefourth Leaf Leaf))
badTree = Node third (Node fourth Leaf Leaf)(Node ninefourth (Node sixth Leaf Leaf) Leaf)

//4.
//Write a function that will return the sum of a tree's nodes.
//Return the sum as a simplified Q.

instance + Q
where
    + x y = simplify{nom = (x.nom * y.den) + (y.nom * x.den), den = x.den * y.den}

instance zero Q
where
    zero = {nom = 0, den = 1}

sumTree :: (Tree Q) -> Q
sumTree Leaf = zero //NOTE: this line is possible because I defined the instance for Q -and- we know the output type is Q.
sumTree (Node x l r) = sumTree l + x + sumTree r

//Start = sumTree smallTree //{nom=3,den=1}
//Start = sumTree bigTree //{nom=97,den=15}
//Start = sumTree miniTree //{nom=19, den=20}

//5.
//Write a function that will check if a tree of Q is a Binary Search Tree.

treeToList :: (Tree a) -> [a]
treeToList Leaf = []
treeToList (Node x l r) = treeToList l ++ [x] ++ treeToList r

instance == Q
where
    == x y = x.nom * y.den == x.den * y.nom

instance < Q
where
    < x y = x.nom * y.den < y.nom * x.den

checkTree :: (Tree Q) -> Bool
checkTree t = l == sort l 
/*this line made possible by treeToList organizing the nodes in the correct order,
and instance of == and < on Q*/
where
    l = treeToList t
//Start = checkTree bigTree //True
//Start = checkTree smallTree //True
//Start = checkTree badTree //False
:: Color = Red | Yellow | Green | Blue | Purple | Violet
:: ColorCombo = { color1 :: Color, color2 :: Color}

instance == Color
where
    == Red Red = True
    == Yellow Yellow = True
    == Green Green = True
    == Blue Blue = True
    == Purple Purple = True
    == Violet Violet = True
    == _ _ = False

colorList :: [Color]
colorList = [Red,Yellow,Green,Blue,Purple,Violet]

//6.
//Write a function that when given a color, returns its complement.
//That is:
//Red -> Blue, Yellow -> Purple, Green -> Violet, Blue -> Red, Purple -> Yellow, Violet -> Green
colorComp :: Color -> Color
colorComp c = newColor
where
    index = hd[i\\n<-colorList & i<-[0..]| n == c] //the integer mapped to our color input
    newColorIndex = (index + 3) rem 6
    newColor = colorList!!newColorIndex

/*
This solution utilizes a technique called mapping
in which I used a list to map the colors to integers,
which are conveniently provided by the list's indices.
*/


//Start = colorComp Red //Blue
//Start = colorComp Blue //Red
//Start = colorComp Green //Violet
//Start = colorComp Purple //Yellow

//7.
//Write a function that when given a Color, creates a list of possible color combos.
//Valid color combos can not have duplicate colors.
colorCombo :: Color -> [ColorCombo]
colorCombo c = colorComboList
where
    index = hd[i\\n<-colorList & i<-[0..]| n == c] //the integer mapped to our color input
    otherColors = [n\\n<-colorList & i<-[0..]| i<>index] //list of the other colors to match to our color
    colorComboList = [{color1 = c, color2 = n}\\n<-otherColors]
//Start = colorCombo Red //[{color1=Red, color2=Yellow},{color1=Red, color2=Green},{color1=Red, color2=Blue},{color1=Red, color2=Purple},{color1=Red, color2=Violet}]
//Start = colorCombo Blue //[{color1=Blue, color2=Red},{color1=Blue, color2=Yellow},{color1=Blue, color2=Green},{color1=Blue, color2=Purple},{color1=Blue, color2=Violet}]

//8.
//Amicable numbers are two different numbers so related that the sum of the proper divisors of each 
//is equal to the other number. (A proper divisor of a number is a positive factor of that number other than the number itself. 
//For example, the proper divisors of 6 are 1, 2, and 3.) 
//Check if two integers are amicable pairs and put them together with the answer in a bag.
//amicable pair: 1184 and 1210 
//proper divisor of 1184 :  1, 2, 4, 8, 16, 32, 37, 74, 148, 296, 592 -> their sum == 1210
//proper divisor of 1210 : 1, 2, 5, 10, 11, 22, 55, 110, 121, 242, 605 -> their sum == 1184

properDiv :: Int -> [Int]
properDiv n = [x\\x<-[1..(n-1)]|n rem x == 0]

:: Bag a :==[((Int,Int),Bool)]

amiBag :: [(Int,Int)] -> Bag a
amiBag list = [ ( (a,b), sum (properDiv a) == b && sum (properDiv b) == a) \\(a,b)<-list]
//Start = amiBag [(1184,1210), (13,245)]
//Start = amiBag [] // []
//all true
//Start = amiBag [(220, 284), (1184, 1210), (2620, 2924), (5020, 5564), (6232, 6368), (10744, 10856), (12285, 14595), (17296, 18416), (63020, 76084), (66928, 66992)]

//9.
//Given the Object type, compute for the state component the given method and print the result as a String.
//ex: for state 3 compute 3 + 1 using the given method, and print the result "4" as string.
:: Object = {state::Int, method::Int->Int, tostring:: Int -> String }
MyObject = { state = 3
 , method = (+) 1
 , tostring = toString
 }
//Start = MyObject.tostring (MyObject.method MyObject.state)
//The above line is the solution. It should print "4". Unfortunately the question isn't well written.

//10.
//Given an operator and two lists, apply the operator to the elements of 
//the same positions of lists, like in the examples.
:: Operator a :== a a -> a

op2 :: (Operator a) [a] [a] -> [a]
op2 op l1 l2 = [op x y \\x<-l1 & y<-l2]
//Start = op2 (*) [2,3,4,5] [7,8,9,10] // [14,24,36,50]
//Start = op2 (*) [2,3,4,5] [7,8] // [14,24]
//Start = op2 (*) [2,3] [7,8,9,10] // [14,24]
//Start :: [Int]
//Start = op2 (*) [] [] // []
//Start = op2 (+) [3,2] [7,8] // [10,10]