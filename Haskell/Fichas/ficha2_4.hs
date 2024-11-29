import Data.Char

--HO.1
--a
myand :: [Bool] -> Bool
myand [] = True
myand (x:xs) = x && myand xs

--b
myor :: [Bool] -> Bool
myor [] = False
myor (x:xs) = x || myor xs

--c
myconcat :: [[a]] -> [a]
myconcat [] = []
myconcat (x:xs) = x ++ myconcat xs

--d
myreplicate :: Int -> a -> [a]
myreplicate 0 x = []
myreplicate n x = x : myreplicate (n-1) x

--e
myfind :: [a] -> Int -> a
myfind (x:xs) 0 = x
myfind (x:xs) n = myfind xs (n-1)
  
--f
myelem :: Eq a => a -> [a] -> Bool
myelem x [] = False
myelem s (x:xs) 
  | s == x = True
  | otherwise = myelem s xs

--HO-2
myintersperse :: a -> [a] -> [a]
myintersperse _ [x] = [x]
myintersperse s (x:xs) = x : s : myintersperse s xs

--HO-3
mdc :: Integer -> Integer -> Integer
mdc a b
  | b == 0 = a
  | otherwise = mdc b (a `mod` b)

--HO-4
--a
myinsert :: Ord a => a -> [a] -> [a]
myinsert x [] = [x]
myinsert s (x:xs)
  | s < x = s:x:xs
  | otherwise = x : myinsert s xs

--b
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = myinsert x (isort xs)


--HO-5
--a
myminimum :: Ord a => [a] -> a
myminimum xs = head(isort xs)

--b
mydelete :: Eq a => a -> [a] -> [a]
mydelete _ [] = []
mydelete s (x:xs)
  | x == s = xs
  | otherwise = x : mydelete s xs

--c
ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort xs = m : ssort (mydelete m xs)
  where m = myminimum xs


--HO-6
sumSquare :: (Num a, Enum a) => a
sumSquare = sum[x^2 | x <- [1..100]]

--HO-7
--a
aprox :: Int -> Double
aprox n = 4 * sum[((-1)^i) / fromIntegral(2*i+1) | i <- [0..n]]

--b
aprox1 :: Int -> Double
aprox1 n = sqrt(12 * sum[((-1)^i) / fromIntegral(i+1)^2 | i <- [0..n]])


--HO-8
dotprod :: [Float] -> [Float] -> Float
dotprod xs ys = sum[x * y | (x,y) <- zip xs ys]

--HO-9
divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..n-1] , n `mod` x == 0] 

--HO-10
perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1..n-1], sum(divprop(x)) == x]

--HO-11
pitagoricos :: Integer -> [(Integer ,Integer ,Integer)]
pitagoricos n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

--HO-12
primo :: Integer -> Bool
primo n = length[x | x <- [2..n-1], n `mod` x == 0] == 0

--HO-15
oneUp :: Char -> Int -> Char
oneUp x n
  | ord(x) + n >= ord('A') && ord(x) + n <= ord('Z') && isUpper x = chr(ord(x) + n)
  | otherwise = if isUpper x then 'A' else ' '

cifrar :: Int -> String -> String
cifrar n [] = []
cifrar n (x:xs) = oneUp x n : cifrar n xs

--HO-21
algarismos :: Int -> [Int]
algarismos 0 = []
algarismos n = algarismos (n `div` 10) ++ [n`mod`10]

