--3.1
function1 :: (Num a) => a -> a
function1 a = 2 * a

function2 :: Integral a => a -> Bool
function2 n = n `mod` 2 == 0

function3 :: (Integral a) => [a] -> [a]
function3 a = [function1 x | x <- a, function2 x]

-- function3 :: (a -> a) -> (a -> Bool) -> [a] -> [a]
-- function3 f1 f2 a = [f1 x | x <- a, f2 x]

-- function4 :: (Integral a) => [a] -> [a]
-- function4 a = map function1 (filter function2 a)

function4 :: (a -> a) -> (a -> Bool) -> [a] -> [a]
function4 f1 f2 a = map f1 (filter f2 a)


--3.2
dec2int :: [Int] -> Int
dec2int a = foldl (\acc a -> acc * 10 + a) 0 a

-- [1,2,3,4,5] -> 12345

--3.3
zipWith_ :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith_ _ [] [] = []
zipWith_ _ [] _ = []
zipWith_ _ _ [] = []
zipWith_ f (x:xs) (y:ys) = f x y : zipWith_ f xs ys

--3.4

insert :: Ord a => a -> [a] -> [a]
insert a [] = [a]
insert a (x:xs)
  | a <= x = a : x : xs
  | otherwise = x : insert a xs

isort :: Ord a => [a] -> [a] 
isort a = foldr insert [] a

--3.5
maximum1 :: Ord a => [a] -> a
maximum1 l = foldl1 max l  


--3.6
mdc1 :: Int -> Int -> Int
mdc1 a b =  fst(until(\(a,b) -> b == 0) (\(a,b) -> (b, a `mod`b )) (a,b)) 

-- foldr insert [] [7,5,3,2,9]

-- insert 9 [] -> [9]
-- insert 2 [9] -> [2,9]
-- insert 3 [2,9] -> [2,3,9]
-- insert 5 [2,3,9] -> [2,3,5,9]
-- insert 7 [2,3,5,9] -> [2,3,5,7,9]

--3.7b
concat_ :: [a] -> [a] -> [a]
concat_ a b = foldr (:) b a  
