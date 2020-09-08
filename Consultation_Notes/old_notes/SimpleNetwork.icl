module SimpleNetwork
import StdEnv

:: Status = { nodeName :: String, ipAddress :: (Int,Int,Int,Int), activeStatus :: Bool}
:: StatusReport = Status | Nok

:: NetworkGraph = Node Status {NetworkGraph}

instance toString NetworkGraph
where
    toString (Node {nodeName = currName, ipAddress = (ip1,ip2,ip3,ip4), activeStatus = aStatus} subNodes) = returnString
    where
        numSubNodes = length[1\\x<-:subNodes]
        delimiter = " | "
        ipString = "Node IPv4 Address: " +++ (toString ip1) +++ "." +++ (toString ip2) +++ "." +++ (toString ip3) +++ "." +++ (toString ip4)
        activeString = "Node Operational Status: " +++ (toString aStatus)
        subNodesString = "Number of Subnodes: " +++ (toString numSubNodes)
        nameString = "Node ID: " +++ currName
        returnString = nameString +++ delimiter +++ ipString +++ delimiter +++ activeString +++ delimiter +++ subNodesString

ipv4ZeroAddress :: (Int,Int,Int,Int)
ipv4ZeroAddress = (0,0,0,0)

central :: Status
central = {nodeName = "central", ipAddress = (10,0,0,1), activeStatus = True}

attachZeros :: Int -> String
attachZeros n = zeros +++ (toString n)
where
    len = length [x\\x<-:(toString n)]
    zeros = {'0'\\x<-[1..(4-len)]}

generateUsers :: Int Int -> [Status]
generateUsers startID n = [{nodeName = "user" +++ (attachZeros x), ipAddress = (10,0,0,(x+1)), activeStatus = False} \\x<-[(1+startID)..(n+startID)]]

generateNetwork :: Int -> NetworkGraph
generateNetwork n = Node central {Node x {}\\x<-(generateUsers 0 n)}

//Start = generateUsers 10
//Start = generateNetwork 10
homeNet :: NetworkGraph
homeNet = generateNetwork 100
//Start = homeNet

listToString :: [Int] -> String
listToString [a] = "/" +++ (attachZeros a)
listToString [a:b] = "/"+++(attachZeros a) +++ (listToString b)

generateWeb :: Int Int -> NetworkGraph
generateWeb breadth depth = Node central {generateWebRecursion breadth depth [x]\\ x <- [1..breadth]}

generateWebRecursion :: Int Int [Int] -> NetworkGraph
generateWebRecursion breadth depth addressList
| currentDepth == depth = Node newNode {}
= Node newNode subNodes
where
    currentDepth = length addressList
    newNodeName = "user" +++ (listToString addressList)
    newNode = {nodeName = newNodeName, ipAddress = ipv4ZeroAddress, activeStatus = False}
    subNodes = {generateWebRecursion breadth depth (addressList++[x])\\ x <- [1..breadth]}

interNet :: NetworkGraph
interNet = generateWeb 3 2

getNode :: NetworkGraph -> Status
getNode (Node x _) = x

getSubNodes :: NetworkGraph -> {NetworkGraph}
getSubNodes (Node _ x) = x

activateNet :: NetworkGraph -> NetworkGraph
activateNet currNet 
| isEmpty[x\\x<-:subNodes] = Node activatedNode {}
= Node activatedNode recursiveCall
where
    currNode = getNode currNet
    activatedNode = {currNode & activeStatus = True}
    subNodes = getSubNodes currNet
    recursiveCall = {activateNet x\\x<-:subNodes}

//Start = interNet
WorldWideWeb :: NetworkGraph
WorldWideWeb = activateNet interNet
Start = WorldWideWeb

printNetworkGraph :: NetworkGraph -> String
printNetworkGraph currNet = printAux currNet 0

printAux :: NetworkGraph Int -> String
printAux currNet currDepth
| isEmpty[x\\x<-:(getSubNodes currNet)] = tabs +++ (toString currNet) +++ "\n"
= tabs +++ (toString currNet) +++ "\n" +++ (foldr (+++) "" [printAux x (currDepth+1)\\x<-:(getSubNodes currNet)])
where
    tabs = foldr (+++) "" (repeatn currDepth "    ")

//Start = printNetworkGraph WorldWideWeb