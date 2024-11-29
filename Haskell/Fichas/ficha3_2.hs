--3.1
function :: (a -> b) -> (a -> Bool) -> [a] -> [b]
function f p xs = map f (filter p xs)

--3.2
dec2int :: [Int] -> Int
dec2int = foldl(\acc x -> acc * 10 + x) 0

--3.3
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f xs ys = [f x y | (x,y) <- zip xs ys]

zipWith1 :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith1 f [] _ = []
zipWith1 f _ [] = []
zipWith1 f (x:xs) (y:ys) = (f x y) : zipWith1 f xs ys 

--3.4
insert :: (Ord a) => a -> [a] -> [a] 
insert x [] = [x]
insert y (x:xs)
  | y <= x = y:x:xs
  | otherwise = x : insert y xs 

isort :: Ord a => [a] -> [a] 
isort xs = foldr insert [] xs

--3.5
--a
maximum1 :: Ord a => [a] -> a 
maximum1 xs = foldr1 max xs

maximum2 :: Ord a => [a] -> a
maximum2 xs = foldl1 max xs

minimum1 :: Ord a => [a] -> a 
minimum1 xs = foldr1 min xs

minimum2 :: Ord a => [a] -> a
minimum2 xs = foldl1 min xs

--b
foldr1_ :: (a -> a -> a) -> [a] -> a
foldr1_ f xs = foldr f (head xs) (tail xs)

foldl1_ :: (a -> a -> a) -> [a] -> a
foldl1_ f xs = foldl f (last xs) (init xs)

--3.7
--a
concat1 :: [a] -> [a] -> [a]
concat1 xs ys = foldr (:) ys xs

--b
concat2 :: [[a]] -> [a]
concat2 xs = foldr (++) [] xs

--c
reverse1 :: [a] -> [a]
reverse1 xs = foldr(\x acc -> acc ++ [x]) [] xs

--d
reverse2 :: [a] -> [a]
reverse2 xs = foldl(\acc x -> [x] ++ acc) [] xs


--3.8
palavras :: String -> [String]
palavras "" = [] 
palavras xs = (takeWhile (/= ' ') xs) : palavras((dropWhile (==' ') (dropWhile (/= ' ')xs))) 

--