module foldrInDetail
import StdEnv

/*
  NOTE: Just to give you a small motivation.
    Questions about understanding foldr/foldl will likely appear on exam quizzes.
    (Trust me, it will be a tiny surprise if you did not prepare for it :()
    Thus, completing the below example using paper and pen is highly recommended.
*/

//Start = foldr (-) 0 [1..5]
//^
//Start
//foldr (-) 0 [1..5]
//One thing to note here is that foldr, is a recursion onto itself.  While I don't use it to teach you guys, since it is very confusing, it is good to see it for understanding purposes.
//foldr (-) (foldr (-) (foldr (-) (foldr (-) (foldr (-) (0) [5]) [4]) [3]) [2]) [1]
//You might want to put that above code ^^^^^^^ into a Start statement in Clean just to confirm that it works just like the regular foldr.
//Start = foldr (-) (foldr (-) (foldr (-) (foldr (-) (foldr (-) (0) [5]) [4]) [3]) [2]) [1] //here, I wrote it out for ya, for yer convenience.
//But that is the FULL recursive form when you break it down.
//Then the reduction steps...
//foldr (-) (foldr (-) (foldr (-) (foldr (-) ((-) 5 0) [4]) [3]) [2]) [1] //innermost 5 and 0 are put into their function.
//foldr (-) (foldr (-) (foldr (-) ((-) 4 ((-) 5 0)) [3]) [2]) [1] //same with 4, and the previous mess.
//foldr (-) (foldr (-) ((-) 3 ((-) 4 ((-) 5 0))) [2]) [1] //continue lol
//foldr (-) ((-) 2 ((-) 3 ((-) 4 ((-) 5 0)))) [1]  //almost
//(-) 1 ((-) 2 ((-) 3 ((-) 4 ((-) 5 0)))) //but wait, we're not done yet!
//(-) 1 ((-) 2 ((-) 3 ((-) 4 ((-) 5 0)))) //evaluate the innermost first (-) 5 0
//(-) 1 ((-) 2 ((-) 3 ((-) 4 5))) //we continue
//(-) 1 ((-) 2 ((-) 3  -1)) //yea this gets boring lol
//(-) 1 ((-) 2 4) //getting close!
//(-) 1 -2 //omg....
//3 //Tada!!

//Now you can try foldl on your own, but it's basically the same... just from the other side.
