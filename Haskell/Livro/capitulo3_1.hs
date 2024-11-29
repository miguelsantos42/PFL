--LI-7
--a
deleteOne :: Char -> String -> String
deleteOne _ [] = []
deleteOne n (x:xs) 
  | n == x = xs
  | otherwise = x : deleteOne n xs

--b
deleteAll :: Char -> String -> String
deleteAll _ [] = []
deleteAll n (x:xs)
  | n == x = deleteAll n xs
  | otherwise = x : deleteAll n xs 

--LI-8
myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (x:xs) = x ++ myConcat xs

--LI-9
myReplicate :: Int -> a -> [a]
myReplicate 0 _ = []
myReplicate n x = x : myReplicate (n-1) x

--LI-10
myCicle :: [a] -> [a]
myCicle l = l ++ myCicle l

--LI-11
myIntersperse :: a -> [a] -> [a]
myIntersperse _ [] = []
myIntersperse _ [x] = [x]
myIntersperse v (x:xs) = x:v:( myIntersperse v xs)

--LI-12
--a
myTake :: Int -> [a] -> [a]
myTake 0 _ = []
myTake _ [] = []
myTake n (x:xs)
  |n > 0 = x: (myTake (n -1) xs)
  |otherwise = []

--b
myDrop :: Int -> [a] -> [a]
myDrop 0 l = l
myDrop _ [] = []
myDrop n (_:xs)
  | n > 0 = myDrop (n -1) xs
  | otherwise = []

--LI-13
splitAt_ :: Int -> [a] -> ([a],[a])
splitAt_ 0 l = ([],l)
splitAt_ _ [] = ([],[])
splitAt_ n l
  | n > length l = (l,[])
  | otherwise = (take n l, drop n l)

--LI-14
myGroup :: Eq a => [a] -> [[a]]
myGroup [] = []
myGroup (x:xs) = (x : takeWhile (==x) xs) : myGroup(dropWhile (== x) xs) 

--LI-15
--a


--LI-18
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([]:_) = []
myTranspose xs = map head xs : myTranspose (map tail xs) 

--LI-19
myNub :: Eq a => [a] -> [a]
myNub [] = []
myNub (x:xs) = x : myNub(filter(/=x) xs)

