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

--HO-13
splitAt1 :: Int -> [Int] -> ([Int],[Int])
splitAt1 _ [] = ([],[])
splitAt1 n xs
  | n > length xs = (xs,[])
  | otherwise = (take n xs,drop n xs) 

--HO-14
myGroup :: Eq a => [a] -> [[a]]
myGroup [] = []
myGroup (x:xs) = (x : takeWhile (==x) xs) : myGroup(dropWhile (== x) xs)

--HO-15
--a
myInits :: [a] -> [[a]]
myInits [] = [[]]
myInits xs = myInits(take(length(xs) - 1) xs) ++ [xs]

--b
myTails :: [a] -> [[a]]
myTails [] = [[]]
myTails xs = [xs] ++ myTails(drop (1) xs)

--HO-16
--a
myZip :: [a] -> [b] -> [(a,b)]
myZip [] _ = []
myZip _ [] = []
myZip (x:xs) (y:ys) = (x,y) : myZip xs ys

--b 
myZip3 :: [a] -> [b] -> [c] -> [(a,b,c)]
myZip3 [] _ _ = []
myZip3 _ [] _ = []
myZip3 _ _ [] = []
myZip3 (x:xs) (y:ys) (z:zs) = (x,y,z) : myZip3 xs ys zs


--HO-17
differentFromNext :: Eq a => [a] -> [a]
differentFromNext  [] = []
differentFromNext [x] = []
differentFromNext (x:y:xs)
  | x /= y = x : differentFromNext(y:xs)
  | otherwise = differentFromNext(y:xs)

--HO-18
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([]:_) = []
myTranspose xs = map head xs : myTranspose(map tail xs)

--HO-19
myNub :: Eq a => [a] -> [a]
myNub [] = []
myNub (x:xs) = x : myNub(filter(/=x) xs)

--HO-21
insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)
  | x < y = x : y : ys
  | otherwise = y : (insert x ys)

iSort :: Ord a => [a] -> [a]
iSort [] = []
iSort (x:xs) = insert x (iSort xs)

--HO-31
differentFromNext1 :: Eq a => [a] -> [a]
differentFromNext1 xs = [x | (x,y) <- zip xs (tail xs), x /= y]

--HO-32 
conseqPairs :: [a] -> [(a,a)]
conseqPairs xs = [(x,y) | (x,y) <- zip xs (tail xs)]  

--HO-33
myzip31 :: [a] -> [b] -> [c] -> [(a,b,c)]
myzip31 xs ys zs = [(x,y,z) | x <- xs, y <- ys, z <- zs, (x,y,z) <- myzip31 xs ys zs]

--HO-34
dropN :: [a] -> Int -> [a]
dropN xs n = [x | (x,y) <- zip xs [1..], y `mod` n /= 0]

--HO-35
checkMod3ThenOdd :: [Int] -> Bool
checkMod3ThenOdd xs = all (\x -> x `mod` 2 /= 0) [x | x <- xs, x `mod` 3 == 0]

--HO-36
repeatNTimes :: Int -> [b] -> [b]
repeatNTimes n xs = concat[replicate n x | x <- xs] 
