implementation module Queue

import StdEnv

:: Queue a :== [a] 

newQueue :: (Queue a)
newQueue = []

// Start = newQueue

enqueue :: a (Queue a) -> Queue a
enqueue e list = [e] ++ list

// Start = enqueue 1 newQueue

dequeue :: (Queue a) -> (Queue a)
dequeue [] = []
dequeue list = init list

// Start = dequeue [1,2,3] 

isEmptyQ :: (Queue a) -> Bool
isEmptyQ list = isEmpty list

// Start = isEmptyQ []

add2Lists :: [a] [a] -> [a] | +a
add2Lists [] l2 = l2
add2Lists l1 [] = l1
add2Lists [x:xs] [y:ys] = [x+y] ++ add2Lists xs ys

instance + (Queue a) | +a
    where
        (+) l1 l2 = add2Lists l1 l2

// Start = 1 + one

