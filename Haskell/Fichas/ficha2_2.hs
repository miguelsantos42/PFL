import Data.Char (isUpper, isLower, isNumber)
--2.1a
and_ :: [Bool] -> Bool
and_ [] = True
and_ (x:xs) = x && and_ xs

--2.1b
or_ :: [Bool] -> Bool
or_ [] = False
or_ (x:xs) = x && or_ xs


--2.1c
concat_ :: [[a]] -> [a]
concat_ [] = []
concat_ (x:xs) = x ++ concat_(xs)


--2.1d
replicate_ :: Int -> a -> [a]
replicate_ 0 _ = []
replicate_ n a = a : replicate_ (n-1) a


--2.1e
position_ :: [a] -> Int -> a
position_ (x:xs) 0 = x
position_ (x:xs) n = position_ xs (n-1)

--2.1f
elem_ :: Eq a => a -> [a] -> Bool 
elem_ _ [] = False
elem_ a (x:xs) 
  | x == a = True
  | otherwise = elem_ a xs

--2.2
intersperse :: a -> [a] -> [a]
intersperse a [x] = [x]
intersperse a (x:xs) = x : a : intersperse a xs

--2.3
mdc :: Integer -> Integer -> Integer
mdc a b
  | b == 0 = a
  | otherwise = mdc b (a `mod` b)


--2.4a
insert :: Ord a => a -> [a] -> [a]
insert a [] = [a]
insert a (x:xs)
  | a < x = a : x : xs
  | otherwise = x : insert a xs


--2.4b
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

--2.5a
minimum_ :: Ord a => [a] -> a
minimum_ xs = head(isort xs)

--2.5a_1
minimum1_ :: Ord a => [a] -> a
minimum1_ [] = error"Erro!"
minimum1_ [x] = x
minimum1_ (x:xs) = min x (minimum1_ xs)


--2.5b
delete :: Eq a => a -> [a] -> [a]
delete _ [] = error"error"
delete a (x:xs)
  | x == a = xs
  | otherwise = x : delete a xs

--2.5c -> ?????????????????
ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort xs = m : ssort xs
    where m = minimum1_ xs 

--2.6
sumSquare :: (Num a, Enum a) => a
sumSquare = sum[x^2 | x <- [0..100]]

--2.7a
aprox :: Int -> Double
aprox n = 4 * sum[((-1)^t) / (fromIntegral(2*t+1)) | t <- [0..n]]

--2.7b
aprox_ :: Int -> Double 
aprox_ n = sqrt(12 * sum[((-1)^t) / (fromIntegral(t+1)^2) | t <- [0..n]])

--2.8
dotprod :: [Float] -> [Float] -> Float
dotprod xs ys = sum[x * y | (x,y) <- zip xs ys]

--2.9
divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..n-1], n `mod` x == 0]

--2.10
perfeitos :: Integer -> [Integer]
perfeitos n = [i | i <- [1..n-1], sum(divprop i) == i]

--2.11
pitagoricos :: Integer -> [(Integer ,Integer ,Integer)] 
pitagoricos n = [(x,y,z) | x <- [1..n-1], y <- [1..n-1], z <- [1..n-1], x^2 + y^2 == z^2 ]

--2.12
primo :: Integer -> Bool
primo n = length(divprop(n)) == 1


--2.13- ??????????

--2.14

fatorial :: Integer -> Integer 
fatorial 0 = 1
fatorial n = n * fatorial(n-1)

binom :: Integer -> Integer -> Integer
binom n k = fatorial (n) `div` (fatorial (k) * fatorial(n-k))

pascal :: Integer -> [[Integer]] 
pascal n = [[binom n k | k <- [0..i]] | i <- [0..n]]

--2.16
concat :: [[a]] -> [a]
concat listas = [valor | lista <- listas, valor <- lista]

replicate1_ :: Integer -> a -> [a]
replicate1_ n a = [a |_ <- [1..n]]

posn :: Int -> [a] -> a
posn n xs = head [x | (x,i) <- zip xs [0..], i == n]

--2.17
forte :: String -> Bool
forte x = length x > 8 && any isUpper x && any isLower x && any isNumber x 
  