--3.1
function :: (a -> Bool) -> (a -> b) -> [a] -> [b]  
function p f xs = map f (filter p xs)

--3.2
dec2int :: [Int] -> Int
dec2int = foldl (\acc x -> acc * 10 + x) 0

--3.3
zipWith1 :: (a -> b -> c) -> [a] -> [b] -> [c] 
zipWith1 f _ [] = []
zipWith1 f [] _ = []
zipWith1 f (x:xs) (y:ys) = f x y : zipWith1 f xs ys  

--3.4
insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)
  | x < y = x:y:ys
  | otherwise = y : insert x ys

isort :: Ord a => [a] -> [a]
isort xs = foldr insert [] xs

--7
--a
concat1 :: [a] -> [a] -> [a]
concat1 xs ys = foldr (:) ys xs

--b
concat2 :: [[a]] -> [a]
concat2 xs = foldr (++) [] xs

--d
reverse1 :: [a] -> [a]
reverse1 = foldl(\acc x -> [x] ++ acc) []

--c
reverse2 :: [a] -> [a]
reverse2 = foldr(\x acc -> acc ++ [x]) []

--8
--a
palavras :: String -> [String]
palavras "" = []
palavras xs = (takeWhile (/= ' ') xs) : palavras(dropWhile(== ' ') (dropWhile(/=' ')xs))

--b 
despalavras :: [String] -> String
despalavras [] = ""
despalavras (x:xs) = x ++ (" ") ++ despalavras xs

