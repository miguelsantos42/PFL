import Data.Char(isUpper, isLower, ord, chr, isNumber)
--HO-01
--a
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs 


--b
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

--c
myconcat :: [[a]] -> [a]
myconcat [[]] = []
myconcat (x:xs) = x ++ myconcat xs

--d
myreplicate :: Int -> a -> [a]
myreplicate 0 _ = []
myreplicate n x = x : myreplicate (n-1) x

--e
select :: [a] -> Int -> a
select (x:xs) 0 = x
select (x:xs) n = select xs (n-1)

--f
myelem :: Eq a => a -> [a] -> Bool
myelem _ [] = False
myelem n (x:xs)
  | n == x = True
  | otherwise = myelem n xs

--HO-02
intersperse :: a -> [a] -> [a] 
intersperse _ [x] = [x]
intersperse s (x:xs) = x : s : intersperse s xs

--HO-03
mdc :: Integer -> Integer -> Integer
mdc a b 
  | b == 0 = a
  | otherwise = mdc b (a `mod` b)

--HO-04
--a
insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n (x:xs)
  | n >= x = x : insert n xs
  | otherwise = n : x : xs

--b
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs) 

--HO-05
--a
minimum1 :: Ord a => [a] -> a
minimum1 xs = head(isort xs)

--b
myDelete :: Eq a => a -> [a] -> [a]
myDelete _ [] = []
myDelete n (x:xs)
  | n == x = xs
  | otherwise = x : myDelete n xs

--c
ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort xs = isort xs

--c
ssort1 :: Ord a => [a] -> [a]
ssort1 [] = []
ssort1 xs = m : ssort1 xs
  where m = minimum1 xs

--HO-06
squareSum :: (Num a, Enum a) => a
squareSum = sum[x^2 | x <- [0..100]]

--HO-07
--a
aprox :: Int -> Double 
aprox n = 4 * sum[((-1)^t)/fromIntegral(2*t+1) | t <- [0..n]] 

--b
aprox1 :: Int -> Double
aprox1 k = sqrt(12 * sum[((-1)^t)/fromIntegral(t+1)^2 | t <- [0..k]])

--H0-08
dotprod :: [Float] -> [Float] -> Float
dotprod xs ys = sum[x * y | (x,y) <- zip xs ys]

--HO-09
divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..n-1], n `mod` x == 0]

--HO-10
perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1..n-1], x == sum(divprop x)]

--HO-11
pitagoricos :: Integer -> [(Integer ,Integer ,Integer)]
pitagoricos n = [(x,y,z) | x <- [1..n-1], y <- [1..n-1], z <- [1..n-1], x^2 + y^2 == z^2]

--HO-12
primo :: Integer -> Bool
primo n = length (divprop n) == 1

--HO-15
oneUp :: Char -> Int -> Char 
oneUp x n
  | ord(x) + n >= ord 'A' && ord(x) + n <= ord 'Z' && isUpper(x) = chr(ord(x) + n)
  | otherwise = if isUpper x  then 'A' else ' '

cifrar :: Int -> String -> String
cifrar n [] = []
cifrar n (x:xs) = oneUp x n : cifrar n xs


--HO-16
concat_ :: [[a]] -> [a]
concat_ xs = [a | x <- xs, a <- x]

replicate_ :: Int -> a -> [a]
replicate_ 0 _ = []
replicate_ n x = [x | _ <- [1..n]]

replicate1_ :: Int -> a -> [a]
replicate1_ 0 _ = []
replicate1_ n x = x : replicate1_ (n-1) x

position_ :: Int -> [a] -> a
position_ 0 (x:xs) = x
position_ n (x:xs) = position_ (n-1) xs

position1_ :: Int -> [a] -> a
position1_ n xs = head[x | (i, x) <- zip [0..] xs, i == n]

--HO-17
or :: String -> Bool
or xs = length xs > 8 && any isUpper xs && any isLower xs && any isNumber xs
 
--HO-24
--a 
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge _ [] = []
merge [] _ = []
merge (x:xs) (y:ys) 
  | x < y = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

