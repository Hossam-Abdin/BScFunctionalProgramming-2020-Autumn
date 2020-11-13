module group5

import StdEnv

// Records

:: Person = {name :: String, age :: Int}

Hossam :: Person
Hossam = {name = "Hossameldin", age = 11}

omar :: Person
omar = {name = "omar", age = 14}

// Start = Hossam

// Access fields

// isHossam :: Person -> Bool
// isHossam anything = anything.name == "Hossameldin"

isHossam :: Person -> Bool
isHossam {name = "Hossameldin"} = True
isHossam _ = False


// Start = isHossam Hossam
// Start = isHossam omar

// Change fields

ChangeAge :: Person -> Person
ChangeAge p = {p & age = (p.age + 5)}

// ChangeAge :: Person -> Person
// ChangeAge p = {name = p.name, age = 30}


// Start = ChangeAge Hossam

::Student = {s_name :: String, grade :: Real}

//3. find the student with the highest grade
// findHighest :: [Student]->String
// findHighest [] = 0.0
// findHighest [x:xs]
// | x.grade > findHighest xs = x.grade
// = findHighest xs
findHighest list = maxList[ x.grade \\ x <- list]

// Start = findHighest [{s_name = "Alice", grade = 22.1},{s_name = "Ban", grade = 58.0},{s_name = "kiki", grade = 94.2}] //94.2


// Algebric types

:: Status = Active | Busy

// isActive :: Status -> Bool
// isActive s = s == Active

isActive :: Status -> Bool
isActive Active = True
isActive _ = False

// Start = isActive Busy

// Give a list of people of record type Person.
// find how many girls like dog but dislike cat.
//The gender in record Person must be Algebraic type: Gender
:: Gender = Male | Female
// :: Person1 = {p_name :: String, gender :: Gender, likedog :: Bool, likecat :: Bool}

// cond :: Person1 -> Bool
// cond {gender = Female, likedog = True, likecat = False} = True
// cond _ = False

// genLikeDog :: [Person1] ->Int
// genLikeDog list = length [x \\ x <- list | cond x]
// genLikeDog list = length [x \\ x <- list | x.likedog && isFemale x.gender]


// Start = Female == Female // Wrong if you did not define instance "==" over it

// Start =genLikeDog [{p_name = "Alice", gender = Female, likedog = True, likecat = False },{p_name = "Alice2", gender = Female, likedog = True, likecat = True },{p_name = "Alice3", gender = Male, likedog = True, likecat = False }] //1
// Start =genLikeDog [{p_name = "Alice", gender = Female, likedog = True, likecat = False },{p_name = "Alice2", gender = Female, likedog = True, likecat = False },{p_name = "Alice3", gender = Male, likedog = True, likecat = False }] //2


// Give a list of people of record type Person.
// Find count of the most popular programming language among Females.
// The gender in record Person must be Algebraic type: Gender
// :: Gender = Male | Female | Transgender | Transsexual | Twospirited | Intersex

::Person2 = {p2_name :: String, gender :: Gender, language :: String}

isFemale :: Gender -> Bool
isFemale Female = True
isFemale _ = False

aux :: Person2 [Person2] -> (String, Int)
aux p list = (p.language, len)
    where
        len = length [x \\ x <- list | x.language == p.language && isFemale p.gender]

//Wrong Implementation
// maxi :: [(String, Int)] -> (String, Int)
// maxi [] = ("anything", -1)
// maxi [x:xs]
// | (snd x) > maxi xs = x
// = maxi xs



maxi :: [(String, Int)] -> (String, Int)
maxi list = hd [x \\ x <- list | snd x == max_number]
    where 
        max_number = maxList [snd x \\ x <- list]

// Start = maxi [("a", 1), ("b", 3)]

mostPopular :: [Person2] -> String
mostPopular list = fst (maxi (map (\x = aux x list) list))


// Start = mostPopular [{p2_name = "Alice", gender = Female, language="C++"},{p2_name = "Alice2", gender = Female, language="C++"},{p2_name = "Alice3", gender = Female, language="C++" }, {p2_name = "Alice4", gender = Female, language="Clean"}] // 3
// Start = mostPopular [{p2_name = "Alice", gender = Female, language="C++"},{p2_name = "Alice2", gender = Female, language="Clean"},{p2_name = "Alice3", gender = Male, language="Python" }, {p2_name = "Alice4", gender = Female, language="Clean"}] // 2
// Start = mostPopular [{p2_name = "Alice", gender = Male, language="C++"},{p2_name = "Alice2", gender = Male, language="Clean"},{p2_name = "Alice3", gender = Male, language="Python" }, {p2_name = "Alice4", gender = Male, language="Clean"}] // 0

// Given a list of distinct name and a list of grade. 2 lists have the same length
// Generate a list of Person corresponding to the name list
// the grades of all Person should be the average of the 2nd list.
// Hint: The record Person should contain at least `name` and `average grade`

// Generator :: [String] [Int] -> [Person]
:: Person3 = {name_aa :: String, avg :: Real}

Generator :: [String] [Int] -> [Person3]
Generator a b = [({name_aa = x , avg = average})\\x <-a]
    where
        average = avg [toReal x \\ x <- b]

// Start = Generator ["Evan", "Tringa"] [1, 4] // [(Person "Evan" 2.5), (Person "Tringa" 2.5)]
// Start = Generator ["Evan", "Tringa", "Viktoria"] [1, 4, 7] // [(Person "Evan" 4.0), (Person "Tringa" 4.0), (Person "Viktoria", 4.0)]

// Arrays

a :: {Int}
a = {1,2,3,4}

//Accessing

// Start = a.[0]

// Array comphernsion
l :: [Int]
l = [x \\ x <-: a]

// Start = l

b :: {Int}
b = {x \\ x <- l}

// Start = b

/*
Given an array of Int and a single Int, use array
comprehension to double each element of the array,
keeping only the multiples of the second Int argument.
*/
arrToList :: {a} -> [a]
arrToList arr = [x \\ x <-: arr]

listToArr :: [a] -> {a}
listToArr list = {x \\ x <- list}

f1 :: {Int} Int -> {Int}
f1 arr n = listToArr [x*2 \\ x <- l | (x*2) rem n == 0]
    where
        l = arrToList arr



// Start = f1 {1,2,3,4} 4 //{4,8}
// Start = f1 {3,4,5,7,2,9} 3 //{6,18}


/*
Implement a function that acts as 'foldr' for
arrays.
*/
//arrFold :: (a -> b -> b) b {a} -> b

// Start = arrFold (+) 0 {1,2,3,4,5} \\ 15
// Start = arrFold (++) [] {[1],[2],[3],[4]} \\ [1,2,3,4]
