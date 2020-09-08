module records
import StdEnv

/*
A record is a way to collect multiple pieces of data together,
often of different types. It is similar to the struct in C++.
*/

/*
distance :: (Int,Int) (Int,Int) -> Real
distance (x1,y1) (x2,y2) = sqrt( toReal((x1-x2)^2 + (y1-y2)^2) )
*/
//Start = distance (3,4) (0,0)

:: Point newType = { x :: newType, y :: newType}

origin :: (Point Int)
origin = {x=0, y=0}
p1 :: (Point Int)
p1 = {x=3, y=4}
p2 :: (Point Int)
p2 = {x=1, y=1}
p3 :: (Point Real)
p3 = {x=1.23, y = 4.56}

distance :: (Point newType) (Point newType) -> Real | toReal newType
distance a b = sqrt( (x1-x2)^2.0 + (y1-y2)^2.0 )
where
    x1 = toReal a.x
    y1 = toReal a.y
    x2 = toReal b.x
    y2 = toReal b.y

//Start = distance origin p1

instance + (Point newType) | + newType
where
    + a b = {x=a.x+b.x, y=a.y+b.y}
//Start = p1 + p1
instance - (Point newType) | - newType
where
    - a b = {x=a.x-b.x, y=a.y-b.y}

//Start = p1 - p1

/*
(addPoints) :: Point Point -> Point
(addPoints) a b = {x=a.x+b.x, y=a.y+b.y}

//Start = p1 addPoints p1
*/

//sum :: [a] -> a |  + , zero  a
//For sum to work, we need a zero.
instance zero (Point newType) | zero newType
where
    zero = {x=zero,y=zero}
//Start = sum[p1,p2,origin]

//isMember	:: a [a] -> Bool | Eq a
//isMember requires equality.
instance == (Point newType) | Eq newType
where
    == a b = a.x == b.x && a.y == b.y
//Start = isMember p1 [p1,p2,origin]
//Start = isMember {x=100,y=100} [p1,p2,origin]

:: Circle a = {center::(Point a), radius :: a}

c1 :: (Circle Int)
c1 = {center = origin, radius = 5}
c2 :: (Circle Real)
c2 = {center = p3, radius = 1.23}
c3 :: (Circle Int)
c3 = {center = {x=3,y=3}, radius = 2}
//Start = c1.center.x

:: Date = {month::Int, day::Int}
:: Person = {name::String, age::Int, birthday::Date}

Evan :: Person
Evan = {name = "Evan", age = 1, birthday = {month=12, day=9}}
Hossam :: Person
Hossam = {name = "Hossam", age = 69, birthday = {month = 3, day = 12}}
Tringa :: Person
Tringa = {name = "Tringa", age = 13, birthday = {month = 1, day = 4}}

instance == Person
where
    == a b = a.name == b.name && a.age == b.age && a.birthday == b.birthday

instance < Person
where
    < a b = a.age < b.age

instance == Date
where
    == a b = a.month == b.month && a.day == b.day

//Start = sort [Tringa, Hossam, Evan]
youngerThan :: Int [Person] -> [Person]
youngerThan n list = [x\\x<-list|x<{name="", age=n,birthday={month=0,day=0}}]

//Start = youngerThan 50 [Tringa, Hossam, Evan]

newBirthday :: Person -> Person
newBirthday a = {a & age = a.age+1}
//newBirthday a = {name = a.name, age = a.age+1, birthday = a.birthday}
//Start = newBirthday Evan

instance toString Person where toString a = a.name
//Start = toString Evan
instance toInt Person where toInt a = a.age
//Start =  toInt Evan