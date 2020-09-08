module tuples
import StdEnv

/*
Tuple is a way to contain and transport/carry different types of data.

Lists can only contain data of the same type. ["John","James","Jim"] [28494,284859,2948]
Lists can NOT contain different types. ["John",5748]

("James",8485) :: (String,Int)
*/

//Dictionary. Maps
Bank :: [(String,Int)]
Bank = [ ("James",1234), ("John",42), ("Jimmy",0), ("Evan", -654738476738234738), ("John",9001) ] 

getAccountBalance :: String -> Int
getAccountBalance name = snd(hd[ individualAccount \\ individualAccount<-Bank | fst individualAccount == name])

//Start = getAccountBalance "John"

updateAccount :: (String,Int) -> (String, Int, Bool)
//updateAccount account = ( fst account, snd account , (snd account) > 500)
updateAccount ( _ , 0 ) = ( "broke bastard", 100, False )
updateAccount ( name , balance )
| balance < 0 = ( "broke bastard", 0, False )
= ( name , balance, balance > 500)
//("James",123) -> ("James", 123, True)
//Start = updateAccount ("James",123) //("James",123,False)
//Start = updateAccount (Bank!!2)

eligiblePeople :: [(String,Int)] -> [String]
eligiblePeople ourBank = result
where
    updatedAccounts = map updateAccount ourBank
    filteredAccounts = filter (\ (_,_, status) = status  ) updatedAccounts
    accountNames = map (\ (name,_,_) = name)  filteredAccounts
    result = accountNames

//Start = eligiblePeople Bank

eligiblePeople2 :: [(String,Int)] -> [String]
eligiblePeople2 ourBank =  [ name \\ (name, _, status) <- (map updateAccount ourBank) |  status ]

Start = eligiblePeople2 Bank

//( something , other , another )
//(  a,  b , c)

// func :: ipadress -> (status, (status report)) 
//         10.0.0.1     Offline,  (10.0.0.1  ,  "node 1")
//         (10,0,0,1)  (False,  ( (10,0,0,1) ,  "node 1"   )   )
//         (Int, Int, Int, Int) (Bool,  ( (Int,Int,Int,Int) ,  String   )   )