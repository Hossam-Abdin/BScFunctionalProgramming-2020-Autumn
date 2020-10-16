module hof_comp

import StdEnv

//2. A positive number in the form like: 10, 200, 8, 1000, 40, 1, 9, 7000, 30000000
// (which has only one non-zero digit at first place) is called a "clean number"(0 is not included)
// find all clean numbers in the list of lists and write to a list

//Start = f2 [[1,2,7,10,50,102,33],[],[0,9,90],[11,980,20]] //[1,2,7,10,50,9,90,20]
//Start = f2 [[1..20],[10,20..60],[30,20.. -10]]//[1,2,3,4,5,6,7,8,9,10,20,10,20,30,40,50,60,30,20,10]


//3. find the middle element of each sublists of list.(hint:use !!)
// list of even length like [0,1,2,3] choose 2
// add them together using foldr

// Tuples
// fst, snd, splitAt, zip

// Start = zip ([1..3],[4..6])

//toInt, toReal

// lambda expression

/*
	delete 2 elements after the n-th element of each sublist in the list.
*/

// Start = del [[1,2,3],[3],[4,5,6,7],[],[0,1,6,3,5]] 3  //[[1,2,3],[3],[4,5,6,7],[],[0,1,6]]
//Start = del [[1,2,6,8,3],[9,3],[0,5,0,6,7],[],[0,1,6,3,5,8]] 2  //[[1,2,6],[9,3],[0,5,7],[],[0,1,5,8]]
//Start = del [[0],[3],[4,5,6],[],[0,1,6,9,7,3,5]] 0  //[[0],[3],[6],[],[6,9,7,3,5]]

// List comprehensions


//Some special cases
// Start = [(a, b) \\ a<-[1..10] & b<-[1..10]]
// Start = [(a, b) \\ a<-[1..10] , b<-[1..10]]

/**4
  * Write a function that checks if each elements in the list appear even times.
  
  * For example, checkEven [1,1,2,2,2,2,3,5,3,5] = True
  */

//checkEven :: [Int] -> Bool

//Start = checkEven [1,1,2,2,2,2,3,5,3,5] // True

//Start = checkEven [1,1,2,2,1] // False

//Start = checkEven [] //False

// qsort

