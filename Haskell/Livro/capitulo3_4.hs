--LI-7
--a
deleteOne :: Char -> String -> String
deleteOne _ [] = []
deleteOne n (x:xs) 
  | x == n = xs
  | otherwise = x : deleteOne n xs

--b
deleteAll :: Char -> String -> String
deleteAll _ [] = []
deleteAll n (x:xs)
  | x == n = deleteAll n xs
  | otherwise = x : deleteAll n xs

--LI-8
myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (x:xs) = x ++ myConcat(xs)

--LI-9
myReplicate :: Int -> a -> [a]
myReplicate 0 _ = []
myReplicate n x = x : myReplicate (n-1) x

--LI-10
myCicle :: [a] -> [a]
myCicle [] = []
myCicle xs = xs ++ myCicle xs

--LI-11
myIntersperse :: a -> [a] -> [a]
myIntersperse _ [x] = [x]
myIntersperse s (x:xs) = x : s : myIntersperse s xs

--LI-12
--a
myTake :: Int -> [a] -> [a]
myTake _ [] = []
myTake n (x:xs) 
  | n > 0 = x : myTake (n-1) xs
  | otherwise = []

--b
myDrop :: Int -> [a] -> [a]
myDrop _ [] = []
myDrop n (x:xs)
  | n > 0 = myDrop (n-1) xs
  | otherwise = x:xs

--LI-13
splitAt1 :: Int -> [Int] -> ([Int],[Int])
splitAt1 _ [] = ([],[])
splitAt1 n xs = (take (n) xs, (drop (n) xs))

--LI-14
myGroup :: Eq a => [a] -> [[a]]
myGroup [] = []
myGroup (x:xs) = (x : takeWhile (==x) xs) : myGroup(dropWhile(== x)xs)

--LI-15
--a
myInits :: [a] -> [[a]]
myInits [] = [[]]
myInits xs = myInits(take(length(xs) - 1) xs) ++ [xs]

--b
myTails :: [a] -> [[a]]
myTails [] = [[]]
myTails xs = [xs] ++ myTails(drop(1)xs)

--LI-16
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

--LI-17
differentFromNext :: Eq a => [a] -> [a]
differentFromNext [] = []
differentFromNext [x] = []
differentFromNext (x:y:xs)
  |x /= y = x:y:differentFromNext xs
  |otherwise = x : differentFromNext xs

--LI-18
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([]:_) = []
myTranspose xs = map head xs : myTranspose(map tail xs)

--LI-19
myNub :: Eq a => [a] -> [a]
myNub [] = []
myNub [x] = []
myNub (x:xs) = x : myNub(dropWhile (==x) xs)

myNub1 :: Eq a => [a] -> [a]
myNub1 [] = []
myNub1 (x:xs) = x : myNub1(filter(/=x)xs)

--LI-21
insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert y (x:xs)
  |y < x = y : x : xs
  |otherwise = x : (insert y xs)

iSort :: Ord a => [a] -> [a]
iSort [] = []
iSort (x:xs) = insert x (iSort xs)

--LI-31
differentFromNext1 :: Eq a => [a] -> [a]
differentFromNext1 xs = [x | (x,y) <- zip xs (tail xs), x /= y]

--LI-32
conseqPairs :: [a] -> [(a,a)]
conseqPairs xs = [(x,y) | (x,y) <- zip xs (tail xs)]

--LI-33
myZip31 :: [a] -> [b] -> [c] -> [(a,b,c)]
myZip31 xs ys zs = [(x,y,z) | x <- xs , y <- ys, z <- zs, (x,y,z) <- myZip31 xs ys zs] 

--LI-34
dropN :: [Int] -> Int -> [Int]
dropN xs n = [x | x <- xs, x `mod` n /= 0]

--LI-35
checkMod3ThenOdd :: [Int] -> Bool
checkMod3ThenOdd xs = all (\x -> x `mod` 2 /= 0) [x | x <- xs, x `mod` 3 == 0]

--LI-36
repeatNTimes :: Int -> [b] -> [b]
repeatNTimes n xs = concat[replicate (n) x | x <- xs]