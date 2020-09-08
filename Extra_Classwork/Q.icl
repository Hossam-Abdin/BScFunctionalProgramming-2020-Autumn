implementation module Q

import StdEnv, StdDebug


::	Q  // define your implementation of Q here

equalQ :: Q Q -> Bool
equalQ _ _ = trace_n "equalQ not yet implemented" False

smallerQ :: Q Q -> Bool
smallerQ _ _ = trace_n "smallerQ not yet implemented" False

plusQ :: Q Q -> Q
plusQ q r = trace_n "plusQ not yet implemented" q

decrementQ :: Q Q -> Q
decrementQ q r = trace_n "decrement not yet implemented" q

timesQ :: Q Q -> Q
timesQ q r = trace_n "timesQ not yet implemented" q

divideQ :: Q Q -> Q
divideQ q r = trace_n "divide not yet implemented" q

absoluteQ :: Q -> Q
absoluteQ q = trace_n "absolute not yet implemented" q

signOfQ :: Q -> Int
signOfQ _ = trace_n "signOfQ not yet implemented" 0

negateQ :: Q -> Q
negateQ q = trace_n "negateQ not yet implemented" q 

isIntQ :: Q -> Bool
isIntQ _ = trace_n "isInt not yet implemented" False

IQ :: Int -> Q
IQ _ = abort "IQ not yet implemented"

QR :: Q -> Real
QR _ = trace_n "isInt not yet implemented" 0.0