module PleaseRenameThisOrElseYouAreAReallyBadCheater_NoReallyGuys
import StdEnv

FunctionNameGoesHere_PleaseRenameThis :: Int->Int
FunctionNameGoesHere_PleaseRenameThis n
| n==1 =1
| n>1 = (n*n) + FunctionNameGoesHere_PleaseRenameThis (n-1)

Start = FunctionNameGoesHere_PleaseRenameThis 100