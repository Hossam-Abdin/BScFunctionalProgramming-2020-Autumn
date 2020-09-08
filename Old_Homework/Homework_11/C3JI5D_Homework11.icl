module C3JI5D_Homework11
import StdEnv

//definition of fractions + related functions + test fractions
:: Q = { p :: Int, q :: Int}

realValue :: Q -> Real
realValue {p,q}
| q==0 = abort "You divided by zero, the universe just exploded."
= (toReal p) / (toReal q)

reduceQ :: Q -> Q
reduceQ {p,q}
| q==0 = abort "You divided by zero, the universe just exploded."
| p==0 = {p=0,q=1}
= { p= p/(gcd p q), q= q/(gcd p q)}

fraction1 = {p=2,q=4}
fraction2 = {p=0,q=12}
fraction3 = {p=2,q=5}
fraction4 = {p=12, q=8}
fraction5 = {p=9, q=0}
fraction6 = {p=13, q=13}
fraction7 = {p=6, q=15}

// 1. Find the cube of a fraction represented as an element of type Q.

func1 :: Q -> Q
func1 {p,q}
| q==0 = abort "You divided by zero, the universe just exploded."
= reduceQ { p = (p^3), q = (q^3) }

//Start = func1 fraction5

// 2. Define minQ for finding the maximum of two rational numbers.

minQ :: Q Q -> Q
minQ a b
| realValue a > realValue b = reduceQ b
| realValue a < realValue b = reduceQ a
= reduceQ a

//Start = minQ fraction7 fraction1

// 3. Given a list of rational numbers, sort them in decreased order.

decSort :: [Q] -> [Q]
decSort a = sortBy (\x y = (realValue(minQ x y)) == (realValue x)) a

Start = decSort [fraction1, fraction3, fraction4, fraction6, fraction7]