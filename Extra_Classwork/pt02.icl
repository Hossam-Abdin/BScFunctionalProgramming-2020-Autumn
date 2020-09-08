module pt02
import StdEnv

//Given a list of integers.
//Write a code which will substitute every integer greater than 5 with the character 'g' and every integer less or equal to 5 with 's'
subst::[Int]->[Char]
subst []=[]
subst [x:xs]
|x>5=['g']++subst xs
=['s']++subst xs
//Start=subst [1..10] //['s','s','s','s','s','g','g','g','g','g']

//Given a list of Reals.
//Write a code which will add 1 to every real number from the list which is less than 10
subst2::[Real]->[Real]
subst2 []=[]
subst2 [x:xs]
|x<10.0=[x+1.0]++subst2 xs
=[x]++subst2 xs
//Start=subst2 [1.6,12.4,5.4,12.4] //[2.6,12.4,6.4,12.4]


//Given a list of Booleans.
//Write a code which will substitute every True value with 1 and every False value with 0
subst3::[Bool]->[Int]
subst3 []=[]
subst3 [x:xs]
|x=[1]++subst3 xs
=[0]++subst3 xs
//Start=subst3 [False,True,False,False,True,False,True,True,False,False,False,True,True,True] //[0,1,0,0,1,0,1,1,0,0,0,1,1,1]

