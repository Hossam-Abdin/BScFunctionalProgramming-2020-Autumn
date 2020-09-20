module firstC
import StdEnv
//module first.icl//NO
//Start="HI Clean"//print
//Start="HI Clean2"

//TYPES:
//Int->Z
//Real->R 12.23 12.234234
//Char->'a' 'b' 'c'
//String->"abcd" "Clean" "Hi clean"
//Bool->True False
/*2==4->compare
x=5*/
//f(x)=x+5
//f:R->R
f::Real->Real
f x=x+5.0
//Start=f 12.543
/*add(x,y)=x+y
x,y e Z
add:ZxZ->Z*/
add::Int Int->Int
add sth1 sth2=sth1+sth2
//Start=add 5 6
//divi::Int Int->Int//this is if we want to specify that we are giving ints
divi x y=x/y
//Start=divi 10.0 4.0
//Start=divi 10.0 4//TYPE ERROR
// 10/4=2.5->
//Start=13/4=3 and 1 remainder
//Start=13 rem 4
//0,2,4,-2,-4....
//1,3,5,....(+/-)

//if a rem 2=0-> even 
//if a rem 2=1-> odd
isEven::Int->Bool 
isEven x
|x rem 2==0=True
|otherwise=False
//Start=isEven 4
//Start=isEven -7
isOdd::Int->Bool 
isOdd x
|x rem 2==0=False
|otherwise=True
//Start=isOdd -7
isOdd2::Int->Bool 
isOdd2 x
|x rem 2==1=True
|otherwise=False
//Start=isOdd2 7
isEven2::Int->Bool
isEven2 x
|x rem 2==0=True
=False
//Start=isEven2 5
isEven3::Int->Bool
isEven3 x= x rem 2==0 
//Start=isEven3 4
add3::Int Int Int->Int
add3 one two three=one+two+three
//Start=3+4+3
pow2::Int->Int
pow2 x=x*x
//Start=pow2(pow2 4)//=f(f(4))=f(4^2)=(4^2)^2=4^4
//f o g(x)=f(g(x))

//6!=6*5*4*3*2*1=6*5!=6*5*4*3!->factorial
factorial::Int->Int
factorial x
|x==0 || x==1=1//False or True->True
=x*factorial(x-1)
//Start=factorial 0
//3!=3*factorial(2)=3*2*factorial(1)=3*2*1*factorial(0)=3*2*1*1
//factorial 10=10*factorial 9=10*9*factorial 8=10*9*8*7*6*5*4*3*2*factorial 1=10*9*8*7*6*5*4*3*2*1
//x^n=x*x*...*x

//0!=1 by definition
powerN::Int Int->Int
powerN base exp    
|exp==0=1    
= (base*(powerN (base) (exp-1)))
//Start=powerN 10 8
//task1:Take an integer x, if x is even return its factorial and if x is odd return x power 3
//if x<0 return -1
task1::Int->Int
task1 x
|x<0= (~1) //-1=(~1)
|x rem 2==0 && x>=0=factorial x
=powerN x 3
Start= task1 (~23423)
//x^0=1 
//exp=[0,1,2...]
//x^n=x^1*x^(n-1)
/*2==4->compare
x=5*/
























