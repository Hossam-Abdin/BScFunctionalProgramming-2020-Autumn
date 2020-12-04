module class11
import StdEnv
::Country={name::String,capital::String}
Macedonia::Country
Macedonia={name="Macedonia",capital="Skopje"}
Hungary::Country
Hungary={name="Hungary",capital="Budapest"}
Spain::Country
Spain={name="Spain",capital="Madrid"}
Brazil::Country
Brazil={name="Brazil",capital="Brasilia"}
Chile::Country
Chile={name="Chile",capital="Santiago"}
Argentina::Country
Argentina={name="Argentina",capital="Buenos Aires"}
China::Country
China={name="China",capital="Beijing"}
India::Country
India={name="India",capital="New Delhi"}
::Continent={contName::String,countries::{Country}}
Europe::Continent
Europe = {contName="Europe",countries={Macedonia,Hungary,Spain}}
Asia::Continent
Asia = {contName="Asia",countries={China,India}}
SouthAmerica::Continent
SouthAmerica ={contName="South America",countries={Argentina,Brazil,Chile}}



//1.Given a continent, check if that continent has a country whose capital's city name starts with 'S'
//HINT: String is an array of Char 
//Start = "Hello".[0] //'H'
//Start::{Char}
//Start = {a\\a<-:"WORD"}  //{'W','O','R','D'}
task1::Continent->Bool
task1 c = isEmpty[cou\\cou<-:c.countries  | cou.capital.[0]=='S'] ==False
//Start = task1 Europe//True
//Start = task1 Asia//False
//Start = task1 SouthAmerica//True

//2.Given a list of continents. Sort it using sort function.
//p.s. one continent is "smaller" than another if the sum of the lengths of the names of the countries in that continent is less than the other.
sumLenC::Continent->Int
sumLenC c = sum [lenString cou.name \\cou<-:c.countries]
//Start = sumLenC Asia
lenString::String->Int
lenString word = length [a\\a<-:word]
instance < Continent
where 
	< c1 c2 = sumLenC c1 < sumLenC c2
//Start = sort [Europe,Asia] 
//Extra task: Write an instance of == for continents
//Start = sort [Asia,Europe]
//Start = map (\x=x.contName) (sort [Asia,Europe,SouthAmerica]) == map (\x=x.contName) (sort [SouthAmerica,Europe,Asia]) 


//3.Given an array of continents, count the total number of occurences of 'a' or 'A' in all the countries from the continents
//{Europe,Asia,SouthAmerica}= Macedonia(2)+Hungary(1)+Spain(1)+China(1)+India(1)+Argentina(2)+Brazil(1)+Chile(0)=9

countryA::Country->Int
countryA cou =length [x\\x<-:cou.name| x=='a' || x=='A']
//Start = countryA Macedonia
task3::{Continent}->Int
task3 arr = sum[sum[countryA country\\country<-:c.countries] \\c<-:arr]
//Start = task3 {Europe}//4
//Start = task3 {Asia}//2
//Start = task3 {SouthAmerica}//3
//Start = task3 {Europe,Asia,SouthAmerica}//9

//4.Given a Tree Int and an Int, find the sum of all the children and 
//grandchildren of the nodes that have the given number as key value
//Leaf is 0
::Tree a=Node a (Tree a) (Tree a) | Leaf//recursive data structure
//Tree1 see link: http://graphonline.ru/en/?graph=RDODcKkbEjpzIbIh
Tree1 ::Tree Int
Tree1 = Node 7 Leaf Leaf
//Tree2 see link: http://graphonline.ru/en/?graph=apYgfCbqYeaQRHNL
Tree2::Tree Int
Tree2 = Node 0 (Node 1 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf))  (Node 2 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf)) 
//Tree3 see link: http://graphonline.ru/en/?graph=YMMkGtZycajcoXEU
Tree3 ::Tree Int
Tree3 = Node 0 (Node 1 (Node 3 Leaf (Node 8 Leaf Leaf)) Leaf)  (Node 2 (Node 67 Leaf Leaf) Leaf)
extractNode::(Tree Int)->Int
extractNode Leaf  = 0
extractNode (Node a l r)=a
sumNodeChildren::(Tree Int)->Int
sumNodeChildren Leaf =0
sumNodeChildren (Node a l r) = a+ extractNode l+extractNode r
task4::(Tree Int) Int-> Int
task4 Leaf _ =0
task4 (Node a l r) n
//|a == n = task4 l (extractNode l)+ task4 r (extractNode r) + extractNode l + extractNode r
|a==n =sumNodeChildren l+sumNodeChildren r
=task4 l n + task4 r n 
//Start = task4 Tree3 0  //6//(1+3+0) (2+0+0)
//Start = task4 Tree3 2 //0
//Start = task4 Tree2 0 //21
//Start = task4 Tree2 2 //11

//5.Give the middle element of a tree
//Leaf is 0
//Hint: convert the tree to a list and get the middle
treeToList::(Tree a)->[a]
treeToList Leaf =[]
treeToList (Node a l r)=[a]++treeToList l++treeToList r
task5::(Tree Int)-> Int
task5 Leaf =0
task5 tree = mid_elem
where
	list = treeToList (tree)
	len_list = length list
	mid_index= len_list/2-1
	mid_elem = list!!mid_index
//Start = task5 Tree2//4
//Start = task5 Tree3//3

//6.Given an array of lists, convert it into a list of arrays
task6::{[a]}->[{a}]
task6 array=[{elem\\elem<-list}\\ list<-:array]
//Start = task6 {[1,2,3],[1..10],[]}//[{1,2,3},{1,2,3,4,5,6,7,8,9,10},{}]
//Start = task6 {}//[]
//Start = task6{["Hello"," ","World"],["This","is","class","9"]}//[{"Hello"," ","World"},{"This","is","class","9"}]









