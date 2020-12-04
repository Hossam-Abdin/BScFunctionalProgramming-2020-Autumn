module group1
import StdEnv


// Start = 5

:: Year :== Int
:: Month :== Int
:: Day :== Int
:: Date = { year :: Year, month :: Month, day :: Day }
SarahBday :: Date
SarahBday = { year = 2004, month = 5, day = 13}
JamesBday :: Date
JamesBday = { year = 2002, month = 5, day = 30}
EvanBday :: Date
EvanBday = { year = 1989, month = 1, day = 29}
MinaBday :: Date
MinaBday = { year = 2000, month = 12, day = 9}
AoifeBday :: Date
AoifeBday = { year = 2015, month = 5, day = 25}
VladBday :: Date
VladBday = { year = 1900, month = 10, day = 31}

:: Person = { name :: String, birthday :: Date}
Sarah :: Person
Sarah = { name = "Sarah Muddle", birthday = SarahBday }
James :: Person
James = { name = "James Potter", birthday = JamesBday}
Evan :: Person
Evan = { name = "Evan Sitt", birthday = EvanBday}
Mina :: Person
Mina = { name = "Mina Harken", birthday = MinaBday}
Aoife :: Person
Aoife = { name = "Aoife", birthday = AoifeBday}
Vlad :: Person
Vlad = { name = "Vlad Tepes", birthday = VladBday}


ListOPeople :: [Person]
ListOPeople = [Sarah, James, Evan, Mina, Aoife, Vlad]

:: Address :== String
:: AddressBook :== [(Person, Address)]
DormRegister :: AddressBook
DormRegister = [
                (Mina, "N Elston Hall"),
                (Aoife, "S Kensington Plaza"),
                (Vlad, "N Elston Hall"),
                (Evan, "W Yung Street"),
                (James, "E Soho Square"),
                (Sarah, "W Rochester Lane")
               ]


/*
Given an AddressBook and a Char representing a cardinal direction,
return a list of all unique addresses that are not in that direction.
The cardinal direction of an address is represented by its first character.
*/
filterAddresses :: AddressBook Char -> [Address]
filterAddresses address_book ch = removeDup [a \\ (name, a) <- address_book | a.[0] <> ch]


// Start = filterAddresses DormRegister 'W' //["N Elston Hall","S Kensington Plaza","E Soho Square"]
//Start = filterAddresses DormRegister 'N' //["S Kensington Plaza","W Yung Street","E Soho Square","W Rochester Lane"]
//Start = filterAddresses DormRegister 'E' //["N Elston Hall","S Kensington Plaza","W Yung Street","W Rochester Lane"]
//Start = filterAddresses DormRegister 'S' //["N Elston Hall","W Yung Street","E Soho Square","W Rochester Lane"]


/*
Declare and define the Tree type.
Given a list of Person, create a Binary Search Tree
based on their age.
*/

:: Tree a = Node a (Tree a) (Tree a) | Leaf

instance < Date
where
    (<) {year = y1, month = m1, day = d1} {year = y2, month = m2, day = d2} = [y1, m1, d1] < [y2, m2, d2]

PersonTree :: [Person] -> (Tree Person)
PersonTree [] = Leaf
PersonTree [a:b] = Node a (PersonTree [x \\ x <- b | x.birthday < a.birthday]) (PersonTree [x \\ x <- b | x.birthday >= a.birthday])
// Start = PersonTree ListOPeople //(Node (Person "Sarah Muddle" (Date 2004 5 13)) (Node (Person "Aoife" (Date 2015 5 25)) Leaf Leaf) (Node (Person "James Potter" (Date 2002 5 30)) Leaf (Node (Person "Evan Sitt" (Date 1989 1 29)) (Node (Person "Mina Harken" (Date 2000 12 9)) Leaf Leaf) (Node (Person "Vlad Tepes" (Date 1900 10 31)) Leaf Leaf))))


// Given a tree and an integer. Find all the nodes that equal to the integer and give the sum
// of their direct children. Count Leaf as 0.

extractNode :: (Tree Int) -> Int
extractNode Leaf = 0
extractNode (Node x left right) = x

f4 :: (Tree Int) Int -> Int
f4 Leaf _ = 0
f4 (Node x left right) a
| x == a = (extractNode left) + (extractNode right) + (f4 left a) + (f4 right a)
= (f4 left a) + (f4 right a)


// Start = f4 (Node 2 Leaf Leaf) 3 //0
// Start = f4 (Node 3 (Node 1 Leaf Leaf) (Node 1 Leaf Leaf)) 3 //2
// Start = f4 (Node 1 (Node 0 Leaf Leaf)(Node 2 Leaf Leaf)) 1 //2
// Start = f4 (Node 2 (Node 1 Leaf Leaf)(Node 2 (Node 3 Leaf Leaf) (Node 1 Leaf Leaf))) 2 //7
// Start = f4 (Node 2 (Node 1 Leaf Leaf)(Node 2 Leaf (Node 1 Leaf Leaf))) 2 //4


// Given a tree, traverse it in level order.
// starting at the root element, then all elements below (left to right), then all
// elements below those (left to right), etc.
// Example:
//        1
//     /     \
//     2      3
//   /   \   / \
//   4   5   6  7
// Should return [1,2,3,4,5,6,7]
levelOrderTraversal :: (Tree a) -> [a]
levelOrderTraversal x = queue [x]
where
    queue [] = []
    queue [Leaf : xs] = queue xs
    queue [(Node x left right) : xs] = [x] ++ (queue (xs ++ [left, right]))

// levelOrderTraversal (Node x left right) = [x] ++ levelOrderTraversal left + levelOrderTraversal right

// Start = levelOrderTraversal (Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))) // [15,3,20,1,10,18,21,7,13,19,26,8,11,24,28]
// Start = levelOrderTraversal (Node 4 (Node 3 (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 4 Leaf Leaf)) (Node 5 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf))) // [4,3,5,3,4,5,6,2,1]


// Start = "strign1" +++ "string2"

Start = size "123"