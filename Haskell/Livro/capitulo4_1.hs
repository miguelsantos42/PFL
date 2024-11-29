import Data.Char

--3a
applyN :: (a -> a) -> Int -> a -> a
applyN f 0 x = x
applyN f n x = applyN f (n-1) (f x)
 
--3b
conversion :: Char -> Char
conversion x 
  | ord (x) + 1 >= ord 'a' && ord (x) + 1 <= ord 'z' && isLower x = chr((ord x) + 1)
  | ord (x) + 1 >= ord 'A' && ord (x) + 1 <= ord 'Z' && isUpper x = chr((ord x) + 1)
  | otherwise = if isLower x then 'a' else 'A' 

cipher :: Int -> String -> String
cipher _ [] = []
cipher n (x:xs) = applyN conversion n x : cipher n xs 

--7
insert :: (a -> a -> Bool) -> a -> [a] -> [a]
insert f x [] = [x]
insert f x (y:ys) 
  | f x y = x:y:ys
  | otherwise = y : insert f x ys


sortByCond :: [a] -> (a -> a -> Bool) -> [a]
sortByCond [] f = []
sortByCond [x] f = [x]
sortByCond (x:xs) f = insert f x (sortByCond xs f)


--8 
myFlip :: (a -> b -> c) -> b -> a -> c 
myFlip f = (\x y -> f y x)

--10
myUncurry :: (a -> b -> c) -> (a,b) -> c
myUncurry f = (\(x,y) -> f x y)                                                      

--14
orderedTriples :: [(Int,Int,Int)] -> [(Int,Int,Int)]
orderedTriples = filter(\(a,b,c) -> a <= b && b <= c)

--15
myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs 

--16
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (x:xs)
  | f x = x : myFilter f xs
  | otherwise = myFilter f xs
  
--17a
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile p [] = []
myTakeWhile p (x:xs)
  | p x = x : myTakeWhile p xs
  | otherwise = []

--17b
myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile p [] = []
myDropWhile p (x:xs)
  | p x = myDropWhile p xs
  | otherwise = x : xs 

--18a
myAll :: (a -> Bool) -> [a] -> Bool
myAll f [] = True
myAll f (x:xs) = f x && myAll f xs

--18b
myAll1 :: (a -> Bool) -> [a] -> Bool
myAll1 f l = and (map f l)

--18c
myAll2 :: (a -> Bool) -> [a] -> Bool
myAll2 f l = length(takeWhile f l) == length l

--22 
countVowels_list :: String -> [Char]
countVowels_list = filter(\x -> x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u')

countVowels :: [Char] -> Int
countVowels l = length(countVowels_list l)

--22.1
countVowels1 :: [Char] -> Int
countVowels1 l = length(filter(\x -> elem x ['a','e','i','o','u'])l) 

--23
--A função f irá computar o comprimento do maior prefixo comum entre as duas listas x e y
-- ou seja x = [1,2,3] e y = [1,2,4]
-- length([[1,1],[2,2]]) = 2

--25a
ap :: (a -> b) -> a -> b
ap f x = f x

--25b
cm :: (b -> c) -> (a -> b) -> a -> c
cm f g x = f(g x)

--32
myMap1 :: (a -> b) -> [a] -> [b]
myMap1 f = foldr(\x acc -> (f x) : acc) []

--33
largePairs :: (Ord a,Num a) => a -> [(a, a)] -> [(a, a)]
largePairs n l = foldr (\(x, y) acc -> if (x + y > n) then (x, y) : acc else acc) [] l

--35
separateSingleDigits :: [Int] -> ([Int],[Int])
separateSingleDigits l = foldr (\x (ys,ns) -> if (x >= 0 && x <= 9) then (x:ys,ns) else (ys, x:ns)) ([],[]) l  

--37a
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ acc [] = acc
myFoldr f acc (x:xs) =  f x (myFoldr f acc xs)

--37b
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl _ acc [] = acc
myFoldl f acc (x:xs) = myFoldl f (f acc x) xs

--40a -> ???????????????
-- myScanr :: (a-> b -> b) -> b -> [a] -> b
-- myScanr _ acc [] = []
-- myScanr f acc (x:xs) = (f x) 
