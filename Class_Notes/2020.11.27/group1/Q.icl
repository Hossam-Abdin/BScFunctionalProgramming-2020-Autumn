implementation module Q

import StdEnv, StdDebug


::	Q  :== (Int, Int)

equalQ :: Q Q -> Bool
equalQ q1 q2 = equalQSimple (makeItSimple q1) (makeItSimple q2)

equalQSimple :: Q Q -> Bool
equalQSimple (a, b) (c, d) = (a == c) && (b == d)

makeItSimple :: Q -> Q
makeItSimple (a, b) = (a / d, b / d)
where
    d = gcd a b

smallerQ :: Q Q -> Bool
smallerQ (a, b) (c, d) = a*d < c*b

plusQ :: Q Q -> Q
plusQ (a, b) (c, d) = makeItSimple (a*d + c*b, b*d)

decrementQ :: Q Q -> Q
decrementQ q r = plusQ q (negateQ r)

timesQ :: Q Q -> Q
timesQ (a, b) (c, d) = (a*c, b*d)

divideQ :: Q Q -> Q
divideQ (a, b) (c, d) = (a*d, b*c)

absoluteQ :: Q -> Q
absoluteQ (a, b)
| a < 0 && b > 0 = (-a, b)
| a > 0 && b < 0 = (a, -b)
= (a, b)

signOfQ :: Q -> Int
signOfQ (a, b)
| a*b > 0 = 1
= -1

negateQ :: Q -> Q
negateQ (a, b) = (-a, b)

isIntQ :: Q -> Bool
isIntQ (a, b) = a rem b == 0

IQ :: Int -> Q
IQ n = (n, 1)

QR :: Q -> Real
QR (a, b) = (toReal a)/(toReal b)