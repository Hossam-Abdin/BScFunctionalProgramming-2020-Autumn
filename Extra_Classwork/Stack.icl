implementation module Stack

import StdEnv


:: Stack a :==[a]

newStack :: Stack a
newStack = []

empty  :: (Stack a) -> Bool
empty  [] = True
empty  x  = False

push :: a (Stack a) -> Stack a
push e s = [e : s]

pop	:: (Stack a) -> Stack a
pop [e:s] = s

top	:: (Stack a) -> a
top [e:s] = e

//	You can use this Start-function to test your implementations:
Start				= ( "s0 = newStack = ",        s0,'\n'
					  , "s1 = push 1 s0 = ",       s1,'\n'
					  , "s3 = pop s1 = ",          s3,'\n'
					  , "s5 = top s1 = ",          s5,'\n'
					  , "test = empty s1 = ",     test,'\n'
					  )
where
	s0				= newStack
	s1				= push   1      s0
	s3				= pop           s1
	s5				= top           s1
	test            = empty         s1
