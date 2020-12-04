definition module Queue

import StdEnv

:: Queue a

// Creates an empty Queue
newQueue :: (Queue a)

// Push new elements in the queue
enqueue :: a (Queue a) -> Queue a

// Pop element from the queue
dequeue :: (Queue a) -> (Queue a)

// Check if the queue is empty
isEmptyQ :: (Queue a) -> Bool

// Add instance "+" to queue type
instance + (Queue a) | +a
