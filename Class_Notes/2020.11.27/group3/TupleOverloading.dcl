definition module TupleOverloading
import StdEnv
//THIS FILE WILL BE GIVEN IF NEEDED
//In this file we are writting the function
//signatue of the instances. Every function from
//this file HAS to be implemented in the TupleOverloading.icl
instance +    (a,b)   | + a & + b//+a & +b means that a and b are types on which + operator is defined
instance +    (a,b,c) | + a & + b & + c

instance -    (a,b)   | - a & - b
instance -    (a,b,c) | - a & - b & - c

instance *    (a,b)   | * a & * b
instance *    (a,b,c) | * a & * b & * c

instance /    (a,b)   | / a & / b
instance /    (a,b,c) | / a & / b & / c

instance zero (a,b)   | zero a & zero b//zero a & zero b means that a and b are types on which zero operator is defined
instance zero (a,b,c) | zero a & zero b & zero c

instance one  (a,b)   | one a & one b
instance one  (a,b,c) | one a & one b & one c

instance ~    (a,b)   | ~ a & ~ b
instance ~    (a,b,c) | ~ a & ~ b & ~ c