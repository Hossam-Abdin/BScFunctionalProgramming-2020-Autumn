definition module Stack

:: Stack a


newStack ::     (Stack a)                  // empty stack
empty    ::     (Stack a) -> Bool
push     ::  a  (Stack a) -> Stack a       // push new element on top of the stack
//pushes   :: [a] (Stack a) -> Stack a       // Consecutively push new elements on top of stack
pop      ::     (Stack a) -> Stack a       // Remove the top element from the stack
//popn     :: Int (Stack a) -> Stack a       // Remove the top n elements from the stack
top      ::     (Stack a) -> a             // Return the top element from the stack
//topn     :: Int (Stack a) -> [a]           // Return the top n elements from the stack
//elements ::     (Stack a) -> [a]           // return all ements from the stack
//count    ::     (Stack a) -> Int           // count the number of elements on the stack
