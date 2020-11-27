implementation module TupleOverloading
import StdEnv
import StdDebug
//Abstract data type->only the behaviour of the data type is known,
//everything else is hidden
instance +    (a,b)   | + a & + b                
where
    + (a1,b1) (a2,b2)= (a1+a2,b1+b2)
instance +    (a,b,c) | + a & + b & + c          
where
    + (a1,b1,c1) (a2,b2,c2)= (a1+a2,b1+b2,c1+c2)

instance -    (a,b)   | - a & - b                
where
    - (a1,b1) (a2,b2)= (a1-a2,b1-b2)

instance -    (a,b,c) | - a & - b & - c          
where
    - (a1,b1,c1) (a2,b2,c2)= (a1-a2,b1-b2,c1-c2)

instance *    (a,b)   | * a & * b                
where
    * (a1,b1) (a2,b2)= (a1*a2,b1*b2)

instance *    (a,b,c) | * a & * b & * c          
where
    * (a1,b1,c1) (a2,b2,c2)= (a1*a2,b1*b2,c1*c2)

instance /    (a,b)   | / a & / b                
where
    / (a1,b1) (a2,b2)= (a1/a2,b1/b2)

instance /    (a,b,c) | / a & / b & / c          
where
    / (a1,b1,c1) (a2,b2,c2)= (a1/a2,b1/b2,c1/c2)

instance zero (a,b)   | zero a & zero b          
where
    zero = (zero,zero)
//Start = zero +(1.5,2.5) 

instance zero (a,b,c) | zero a & zero b & zero c 
where
    zero = (zero,zero,zero)

instance one  (a,b)   | one a & one b            
where
    one = (one,one)

instance one  (a,b,c) | one a & one b & one c    
where
    one = (one,one,one)

instance ~    (a,b)   | ~ a & ~ b                
where
    ~ (a1,b1) = (~a1, ~b1)

instance ~    (a,b,c) | ~ a & ~ b & ~ c          
where
    ~ (a1,b1,c1) = (~a1, ~b1,~c1)

//Lets test the implementation:

/*Start = ( zero + (1,2) == (1,2)    && (1,2) == (1,2) + zero
         , (1,2)- zero == (1,2)     && (1,2) == ~ (zero - (1,2))
         ,  one * (1,2) == (1,2)    && (1,2) == (1,2) * one
         , zero * (1,2) == zero     && zero  == (1,2) * zero
         ,  (1,2) / one == (1,2)
         ,  ~ (~ (1,2)) == (1,2)
         )*/
         
/*Start = ( zero + (1,2,3) == (1,2,3)     && (1,2,3) == (1,2,3) + zero
         , (1,2,3)- zero == (1,2,3)     && (1,2,3) == ~ (zero - (1,2,3))
         ,  one * (1,2,3) == (1,2,3)    && (1,2,3) == (1,2,3) * one
         , zero * (1,2,3) == zero       && zero  == (1,2,3) * zero
         ,  (1,2,3) / one == (1,2,3)
         ,  ~ (~ (1,2,3)) == (1,2,3)
         )*/
         

         
         
         
      