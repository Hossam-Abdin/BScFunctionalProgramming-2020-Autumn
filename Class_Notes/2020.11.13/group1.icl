module group1
import StdEnv


// // Array
// // {Int}

// // my_list = [1,2,3,4]
// // my_list!!3

// // my_array = {1,2,3,4}
// // my_array.[2]

// // some_task :: {Int} -> Int

// // [elem \\ elem <- list]
// // [elem \\ elem <-: array]

// // array_to_list :: {Int} -> [Int]
// // array_to_list array = [element \\ element <-: array]


// // Lists, Arrays are homogenous



// // add :: Int Int -> Int

// // Start = fst ("james", 19) //"hossjamesam"
// // Start = fst (19, "james") //19

// // Records

// // :: Date = {
// //             year :: Int,
// //             month :: String,
// //             day :: Int
// //           }

// my_birth_day = {year = 1999, day = 11, month = "February"}

// // Start = { day = 24, month = "April", year = 2020 } //(Date year:2020 month:4 day:24)

// :: Point a b = { myx :: a, myy :: b }

// my_random_point :: Point Real Int
// my_random_point = {myy = 4, myx = 3.5} //(Point 3.5 4.4)

// // Start = my_random_point

// :: Person = {
//                 name :: String,
//                 age :: Int,
//                 birthday :: Date,
//                 is_married :: Bool
//             }

// James :: Person
// James = { name = "James", age = 20, birthday = my_birth_day, is_married = False }

// // Start =  James //(Person "James" 19 (Date 1999 "Feb" 11) False)

// // Give me the age of James
// // Start = James.age //20
// // Start = James.name


// // Give me the age of Person
// get_age :: Person -> Int
// get_age person = person.age
// // get_age {name = my_name, age=my_age, birthday=my_birth, is_married=my_is_married} = my_age



// // Start = get_age James //20

// lets_get_married :: Person -> Person
// lets_get_married p = {p & is_married = True}

// // Start = lets_get_married James //(Person "James" 20 (Date 1999 "Feb" 11) True)


// // // Given three Vectors in 2D, decide if their endpoint lie on a same line.
// // Three points are on the same line, if area of triangle formed by them is 0
// // (x1y2 + x2y3 + x3y1 - x1y3 - x2y1 - x3y2)/2 = 0
// :: Vector2 = {x :: Real, y :: Real}

// collinear :: Vector2 Vector2 Vector2 -> Bool
// collinear {x = x1, y = y1} {x = x2, y = y2} {x = x3, y = y3} = (x1*y2 + x2*y3 + x3*y1 - x1*y3 - x2*y1 - x3*y2) == 0.0

// // Start = collinear {x = 0.0, y = 0.0} {x = 1.0, y = 0.0} {x = 3.0, y = 0.0} // True
// // Start = collinear {x = 0.0, y = 0.0} {x = 1.0, y = 0.0} {x = 3.0, y = 1.0} // False
// // Start = collinear {x = 0.0, y = -1.0} {x = 2.0, y = 0.0} {x = 3.0, y = 0.0} // False

// // // Given a list of distinct name and a list of grades.
// // // Generate a list of `Person` type
// // // the grades of all Person should be the average of the 2nd list.

// // :: Person = { name :: String, gpa :: Real }

// // my_average :: [Int] -> Real
// // my_average list = toReal(sum list)/toReal(length list)

// // Generator :: [String] [Int] -> [Person]
// // Generator names grades = [{name = person_name, gpa = average} \\ person_name <- names]
// // where
// //     average = my_average list


// // // Start = Generator ["p1", "p2"] [1, 4] // [(Person "p1" 2.5), (Person "p2" 2.5)]
// // // Start = Generator ["p1", "p2", "p3"] [1, 4, 7] // [(Person "p1" 4), (Person "p2" 4), (Person "p3", 4)]


// // // Algebric data type

// :: Month = Jan | Feb | Mar | Apr | May | Jun | July | Aug | Sep | Oct | Nov | Dec


// // Start = Jan

// // maxList :: !.[a] -> a | Ord a
// // maxList [1,2,3,4,5] -> 5




// my_month_list :: [Month]
// my_month_list = [Feb, Apr, May]

// // Start = maxList my_month_list


// // isMember::a !.[a] -> Bool | Eq a

// Start = isMember Feb my_month_list


// instance == Person
// where
//     (==) {name=n1, birthday=b1} {name=n2, birthday=b2} = n1 == n2 && b1==b2



// instance == Date
// where
//     (==) {year = y1, month = m1, day = d1} {year = y2, month = m2, day = d2} = y1==y2 && m1==m2 && d1==d2

// instance == Month
// where
//     (==) Jan Jan = True
//     (==) Feb Feb = True
//     (==) Mar Mar = True
//     (==) Apr Apr = True
//     (==) May May = True
//     ...
//     ...
//     (==) Dec Dec = Ture
//     (==) _ _ = False

// // // if you define an instance for '==', the 'Eq' class will automatically define and create for you
// // // the <> instance



// :: Date = {
//             year :: Int,
//             month :: Month,
//             day :: Int
//           }

// instance < Month
// where
//     (<) month1 month2 = (month_to_int month1) < (month_to_int month2)
//     month_to_int :: Month -> Int
//     month_to_int Jan = 1
//     month_to_int Feb = 2
//     month_to_int Mar = 3
//     month_to_int Apr = 4
//     ....
//     month_to_int Dec = 12

// instance < Person
// where
//     (<) {birthday={year=y1, month=m1, day=d1}} {birthday={year=y2, month= m2, day=d2}} = [y1, m1, d1] < [y2, m2, d2]


// // if you define an instance for '<', the 'Ord' class will automatically define and create for you
// // the >, >=, <= instances


/*
Today we will cover Trees, and Algebraic types.
*/

:: Month = Jan | Feb | Mar | Apr | May

func :: Month -> Int
func x = 1

// Start = func BlahBlahBlah

:: Date = {
            day::Int,
            month :: Int,
            year :: Int
          }

:: Status a  = On a | Off

checkStatus :: (Status a) -> String
// checkStatus (On x) = "This is On" +++ (toString x)
checkStatus Off = "This is Off"

// p1 = On
// p2 = Off
// p3 = On

// Start = checkStatus Off

/*
f x
| x==0 = doSomething
f 0 = doSomething
*/


:: Tree a = Node a (Tree a) (Tree a) | Leaf
// :: Tree = Node | Leaf
// :: Tree = Node Tree Tree | Leaf
// :: Tree a = Node a (Tree a) (Tree a) | Leaf | Nothing | Shit | Poop

// :: Tree = Node [Tree] | Leaf

/*
            8
         /     \
        6      12
       / \     / \
      3  7   10   L
     L 5 LL  LL
       LL
*/
//binary search tree - B.S. Tree :D
smallTree :: (Tree Int)
smallTree = Node 8 (Node 6 Leaf Leaf) (Node 12 Leaf Leaf)

//        8
//     6     12
//    L L   L  L

//[6,8,12]

extractNode :: (Tree a) -> a
extractNode (Node x leftSubtree rightSubtree) = x
extractNode Leaf = abort "Leaf encountered\n"

//Start = smallTree //(Node 8 (Node 6 Leaf Leaf) (Node 12 Leaf Leaf))
// Start = extractNode smallTree //8
// Start = extractNode Leaf

treeToList :: (Tree a) -> [a]
treeToList Leaf = []
treeToList (Node x l r) = (treeToList l) ++ [x] ++ (treeToList r) // inorder
// treeToList (Node x l r) = [x] ++ (treeToList l)  ++ (treeToList r) // preorder
// treeToList (Node x l r) =  (treeToList l)  ++ (treeToList r) ++ [x] // postorder

//:: Tree a = Node a (Tree a) (Tree a) | Leaf
//Start = treeToList smallTree //[6,8,12]

ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))
Start = treeToList ourTree

// Graphs > Tree
// B Trees, B+ trees, B- trees, AVL trees, Rose trees
// Binary Trees > Binary Search Tree

// Binary Search Tree:  parent, child1, child2
// child1 < parent <= child2