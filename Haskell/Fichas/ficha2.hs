import Data.Char

-- 2.2
intersperse_ :: a -> [a] -> [a]
intersperse_ _ [a] = [a]
intersperse_ a (b : bs) = b : a : intersperse_ a bs

--2.3
mdc_ :: Integer -> Integer -> Integer
mdc_ a 0 = a
mdc_ a b = mdc_ b (a `mod` b)

mdcMiguel :: Integer -> Integer -> Integer
mdcMiguel a b 
   | b == 0 = a
   | otherwise = mdcMiguel b  (a `mod` b)

--2.4a
insert :: Ord a => a -> [a] -> [a]
insert a [] = [a]
insert a (x:xs)
  | a <= x = a : x : xs
  | otherwise = x : insert a xs

--2.4b
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x : xs) = insert x (isort xs)

--2.6
square :: (Num a, Enum a) => a
square = sum [x^2 | x <- [1..100]]

--2.7a
aprox :: Int -> Double 
aprox n = 4 * sum[((-1)^t)/fromIntegral(2*t+1) | t <- [0..n]]

--2.7b
aprox1 :: Int -> Double
aprox1 n = sqrt(12 * sum[((-1)^k)/fromIntegral((k+1)^2) | k <- [0..n]])

--2.12
primo :: Integer -> Bool
primo n = length [n `div` i| i <- [1..n], n `mod` i == 0] == 2

--2.15

convertCharToInt :: Char -> Int
convertCharToInt a = ord a - ord 'A'

convertIntToChar :: Int -> Char
convertIntToChar a = chr(a + ord 'A')

isAlpha_ :: Char -> Bool
isAlpha_ a = a >= 'A' && a <= 'Z'

posRight :: Int -> Char -> Char
posRight a b 
  | isAlpha_ b = convertIntToChar((convertCharToInt b + a) `mod` 26)
  | otherwise = b
          
cifrar :: Int -> String -> String 
cifrar n s = [posRight n c | c <- s]