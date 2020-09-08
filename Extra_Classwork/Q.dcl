definition module Q

::  Q


equalQ     :: Q Q -> Bool    // equality of rational numbers
smallerQ   :: Q Q -> Bool    // order of rational numbers
plusQ      :: Q Q -> Q       // addition of rational numbers
decrementQ :: Q Q -> Q       // subtraction of rational numbers
timesQ     :: Q Q -> Q       // multiplication of rational numbers
divideQ    :: Q Q -> Q       // division of rational numbers
absoluteQ  ::   Q -> Q       // absolute value of rational number
signOfQ    ::   Q -> Int     // the sign of the rational number
negateQ    ::   Q -> Q       // change the sign of the rational number
isIntQ     ::   Q -> Bool    // test whether the rational number represents a whole number
IQ         :: Int -> Q       // return the fraction that corresponds with the whole number
QR         :: Q -> Real      // return the floating point number that approximates the fraction
