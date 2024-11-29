--13
mySplitAt :: Int -> [a] -> ([a],[a])
mySplitAt 0 l = ([], l)
mySplitAt _ [] = ([],[])
mySplitAt n l
  | n > length l = (l, [])
  | otherwise = (take n l, drop n l)


--14 -???????????????????????????????
myGroup :: Eq a => [a] -> [[a]]
myGroup [] = []
myGroup (x:xs) = (x:takeWhile (==x) xs) : myGroup(dropWhile (==x) (x:xs))

-- [1,1,0,0,0,1,1] => [1,1] : myGroup [0,0,0,1,1]

--14.1
myGroup1 :: Eq a => [a] -> [[a]]
myGroup1 [] = []
myGroup1 (x:xs) = (x : takeWhile (==x) xs) : myGroup(dropWhile (==x) (x:xs)) 


-- --15a -????????????????????????????
myInits :: [a] -> [[a]]
myInits [] = [[]]
myInits str = (myInits(take(length(str) - 1) str)) ++ [str]


-- 15b - ?????????????????????????????
myTails :: [a] -> [[a]]
myTails [] = [[]]
myTails str = [str] ++ (myTails(drop(1) str)) 


--16a
myZip :: [a] -> [b] -> [(a,b)]
myZip [] _ = []
myZip _ [] = []
myZip (x:xs) (y:ys) = (x,y) : (myZip xs ys) 

--16b
myZip3 :: [a] -> [b] -> [c] -> [(a,b,c)]
myZip3 [] _ _ = []
myZip3 _ _ [] = []
myZip3 _ [] _ = []
myZip3 (x:xs) (y:ys) (z:zs) = (x,y,z) : (myZip3 xs ys zs)  

--17
differentFromNext :: Eq a => [a] -> [a]
differentFromNext [] = []
differentFromNext (x:y:xs) 
  | (x /= y) = x : (differentFromNext(y:xs))
  | otherwise = differentFromNext(y:xs) 

--18 ->???????????????????????????????????????
myTransporte :: [[a]]  -> [[a]]
myTransporte [] = []
myTransporte ([]:_) = []
myTransporte xs = map head xs : myTransporte (map tail xs) 

--19 
myNub :: Eq a => [a] -> [a]
myNub [] = []
myNub (x:xs) = x : myNub(filter (/= x) xs)

--LI28
infL :: Integral a => [a]
infL = 1 : [2 * prev + i - 1 | (i,prev) <- zip [2..20] infL]

--30
myconcat_ :: [[a]] -> [a]
myconcat_ l = [x | xs <- l, x <- xs]


--31
differentFromNext_ :: Eq a => [a] -> [a]
differentFromNext_ l = [x | (x, y) <- zip l (tail l), x /= y]

--32
conseqPairs :: [a] -> [(a,a)]
conseqPairs l = [(x,y) | (x,y) <- zip l (tail l)]

--33
myZip3_ :: [a] -> [b] -> [c] -> [(a,b,c)]
myZip3_  l1 l2 l3 = [(x,y,z) |(x,(y,z)) <- zip l1 (zip l2 l3)]

--34
dropN :: [a] -> Int -> [a]
dropN l n = [x | (x,p) <- zip l [1..], p `mod` n /= 0]  

-- --35
-- checkMod3ThenOdd :: [a] -> Bool
-- checkMod3ThenOdd l = length[x | ] == 0