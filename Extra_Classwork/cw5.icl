module cw5
import StdEnv

/* 1. write a function that replace all the neighbour duplicates with '0' in a list
eg. [1,2,2,3,3,5,4,4] -> [1,0,0,5,0]*/

//f1::[Int]->[Int]

//Start = f1 [1,2,2,3,3,5,4,4]  //[1,0,0,5,0]

//Start = f1 [1,0,1,1] //[1,0,0]

/*2. generate a list of triple tuples like: 
[('a',0,1),('a',0,2),('a',0,2),('a',0,3),('a',0,3),('a',0,3),
 ('b',0,1),('b',0,2),('b',0,2),('b',0,3),('b',0,3),('b',0,3),
 ('c',0,1),('c',0,2),('c',0,2),('c',0,3),('c',0,3),('c',0,3)]
*/

//f2 = 

//Start = f2


/*3. filter a list of  triple tuples which can form acute triangle 
(An acute triangle is a triangle with three acute angles (less than 90°). ) 
eg. [(3,3,3),(3,4,5),(1,0,2),(3,~3,3),(5,5,8)] -> [(3,3,3)] */

//acute::(Int,Int,Int) ->Bool

//f3::[(Int,Int,Int)] -> [(Int,Int,Int)]

//Start = f3 [(3,3,3),(3,4,5),(1,0,2),(3,~3,3),(5,5,8)]  //[(3,3,3)]
