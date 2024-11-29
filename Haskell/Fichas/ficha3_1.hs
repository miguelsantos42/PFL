
--3.1
function :: (a -> Bool) -> (a -> b) -> [a] -> [b]
function p f xs = map f (filter p xs) 

--3.2
dec2Int :: [Int] -> Int
dec2Int = foldl(\acc x -> acc * 10 + x) 0

--3.3
zipWith_ :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith_ f [] _ = []
zipWith_ f _ [] = []
zipWith_ f [] [] = []
zipWith_ f (x:xs) (y:ys) = f x y : zipWith_ f xs ys 

--3.4
insert :: Ord a => a -> [a] -> [a] 
insert a [] = []
insert x (y:ys)
  | x <= y = x:y:ys
  | otherwise = y:insert x ys

isort :: Ord a => [a] -> [a] 
isort xs = foldr insert [] xs

--3.5
--a
maximum1 :: Ord a => [a] -> a
maximum1 l = foldr1 max l

maximum2 :: Ord a => [a] -> a
maximum2 l = foldl1 max l 

minimum1 :: Ord a => [a] -> a
minimum1 l = foldr1 min l

minimum2 :: Ord a => [a] -> a
minimum2 l = foldl1 min l

--b 


--3.8
--a
palavras :: String -> [String]
palavras "" = []
palavras l = (takeWhile (/= ' ') l) : palavras((dropWhile (== ' ') (dropWhile (/= ' ') l)))

--b
despalavras :: [String] -> String
despalavras [x] = x
despalavras (x:xs) = x ++ " " ++ despalavras xs

--3.10
mmd :: Int -> Int -> Int
mmd n i
  | n `mod` i == 0 = i
  | otherwise = mmd n (i + 1) 

factores :: Int -> [Int]
factores 1 = []
factores n = mmd n 2 : factores (n `div` (mmd n 2))
