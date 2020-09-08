module listComprehension
import StdEnv

/*
List comprehensions are all about building lists.
They like to use lists.
*/
/*
When to use List Comprehension:
- You need to process a bunch of elements.
- You need to build a new list.
- You need to do operations on one or more lists.
*/

//Start = [1..10]
//Start = [x\\x<-[1..10]]
/*
[1,2,3,4,5,6,7,8,9,10] type is [Int]
*/
//Start = [[x]\\x<-[1..10]]
/*
[[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]] type is [[Int]]
*/
//Start = [var\\var<-['a','b','c','d']] //['a','b','c','d']

//Start = [abc*2\\abc<-[1..10]] //[2,4,6,8,10,12,14,16,18,20]
//Start = map (\x = x*2) [1..10] //[2,4,6,8,10,12,14,16,18,20]
//Start = [x\\x<-[1..10]|isEven x] //[2,4,6,8,10]
//Start = filter isEven [1..10] //[2,4,6,8,10]

//Start = [x/2\\x<-[1..10]|isEven x] //[1,2,3,4,5]
//Start = map (\x = x/2) (filter isEven [1..10]) //[1,2,3,4,5]

//Start = [(x,y)\\x<-[1..10] & y<-[2,4..]] //[(1,2),(2,4),(3,6),(4,8),(5,10),(6,12),(7,14),(8,16),(9,18),(10,20)]
//Start = [x+y\\x<-[1..10] & y<-[2,4..]] //[3,6,9,12,15,18,21,24,27,30]
/*
Check if a sequence of Int in a list is Odd,Even,Odd,Even...
*/
//checkSeq seq = and[isEven (x+y)\\x<-seq & y<-[1..]]

//Start = checkSeq [1..10] //True
//Start = checkSeq [1,2,4,5,7,8,9] //False

//Start = [(x,y)\\x<-[1..5],y<-[1..3]] //[(1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3)]
//Start = [(x,y,z)\\x<-[1..3],y<-[4,5],z<-[6,7,8]] //[(1,4,6),(1,4,7),(1,4,8),(1,5,6),(1,5,7),(1,5,8),(2,4,6),(2,4,7),(2,4,8),(2,5,6),(2,5,7),(2,5,8),(3,4,6),(3,4,7),(3,4,8),(3,5,6),(3,5,7),(3,5,8)]

//Coprime numbers have gcd of 1
//Start = [(x,y)\\x<-[1..10],y<-[x..10]| gcd x y == 1] //[(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,3),(2,5),(2,7),(2,9),(3,4),(3,5),(3,7),(3,8),(3,10),(4,5),(4,7),(4,9),(5,6),(5,7),(5,8),(5,9),(6,7),(7,8),(7,9),(7,10),(8,9),(9,10)]

/*
coprimePairs :: Int -> [(Int,Int)]
coprimePairs n = [(x,y)\\x<-[1..n],y<-[x..n]| gcd x y == 1]
*/
/*
for(int x=1; x<=n; ++x)
{
    for(int y=x; y<=n; ++y)
    {
        if(gcd(x,y)==1)
        {
            //add (x,y) to a list or array
        }
    }
}
*/

//Start = [(a,b)\\ (a,b)<-[(x,y)\\x<-[1..10],y<-[1..10]| gcd x y == 1] | a<b ] //[(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,3),(2,5),(2,7),(2,9),(3,4),(3,5),(3,7),(3,8),(3,10),(4,5),(4,7),(4,9),(5,6),(5,7),(5,8),(5,9),(6,7),(7,8),(7,9),(7,10),(8,9),(9,10)]

/*
reduce :: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
reduce (a,b,c,d) = (z!!0,z!!1,z!!2,z!!3)
    where
    x = [a,b,c,d]
    y = gcd a (gcd b (gcd c d))
    z = [n/y\\n<-x]
*/

//Start = reduce (2,4,6,8) //(1,2,3,4)

