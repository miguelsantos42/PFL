--HO-13
mysplitAt :: Int -> [a] -> ([a],[a])
mysplitAt _ [] = ([],[])
mysplitAt 0 l = (l, [])
mysplitAt n xs 
  |n > length xs = (xs,[])
  |otherwise = (take n xs, drop n xs)

--HO-14
myGroup :: Eq a => [a] -> [[a]]
myGroup [] = []
myGroup (x:xs) = (x : takeWhile (==x) xs ) : myGroup(dropWhile (==x) xs)

--HO-15
--a
myInits :: [a] -> [[a]]
myInits [] = [[]]
myInits xs = (myInits(take(length(xs) -1) xs)) ++ [xs]

myInits1 :: [a] -> [[a]]
myInits1 [] = [[]]
myInits1 xs = (myInits(take(length(xs) - 1)xs)) ++ [xs]

--b 
myTails :: [a] -> [[a]]
myTails [] = [[]]
myTails xs = [xs] ++ (myTails(drop(1) xs))

myTails1 :: [a] -> [[a]]
myTails1 [] = [[]]
myTails1 xs = [xs] ++ (myTails1(drop(1)xs))

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
differentFromNext [] = []
differentFromNext [x] = [x]
differentFromNext (x:y:xs)
  | x /= y = x : differentFromNext (y:xs)
  | otherwise = differentFromNext (y:xs)

--HO-18 
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([]:_) = []
myTranspose xs = map head xs : myTranspose (map tail xs)

--HO-19
myNub :: Eq a => [a] -> [a]
myNub [] = []
myNub (x:xs) = x : myNub(filter (/= x) xs)

--HO-31
differentFromNext1 :: Eq a => [a] -> [a]
differentFromNext1 xs = [x | (x,y) <- zip xs (tail(xs)), x /= y ] 

--HO-32
conseqPairs :: [a] -> [(a,a)]
conseqPairs xs = [(x,y) | (x,y) <- zip xs (tail(xs))]

--HO-33
myZip31 :: [a] -> [b] -> [c] -> [(a,b,c)]
myZip31 xs ys zs = [(x,y,z) |x <- xs, y <- ys, z <- zs, (x,y,z) <- myZip31 xs ys zs]

--HO-34
dropN :: [a] -> Int -> [a] 
dropN l n = [x | (x,y) <- zip l [1..], y `mod` n /= 0]

--HO-35
checkMod3ThenOdd :: [Int] -> Bool
checkMod3ThenOdd xs = all(\x -> x `mod` 2 /= 0) [x| x <- xs, x `mod` 3 == 0]
