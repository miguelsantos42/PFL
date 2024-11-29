import Data.Char (ord, chr, isLower, isUpper)

--1
twice :: (a -> a) -> a -> a
twice f a = f (f a)

--3a
applyN :: (a -> a) -> Int -> a -> a
applyN f 0 x = x
applyN f n xs = applyN f (n-1) (f xs) 

--3b
oneUp :: Char -> Char
oneUp x
  | ord(x) + 1 >= ord 'a' && ord(x) + 1 <= ord 'z' && isLower x = chr ((ord x) + 1)
  | ord(x) + 1 >= ord 'A' && ord(x) + 1 <= ord 'Z' && isUpper x = chr ((ord x) + 1)
  | otherwise = if isLower x then 'a' else 'A'

ceaser :: Int -> String -> String
ceaser 0 [] = []
ceaser n (x:xs) = applyN oneUp n x : ceaser (n - 1) xs

--4
function :: (a -> b -> b)-> b -> a -> b 
function f a b = f b a 

--7
insert :: (a -> a -> Bool) -> a -> [a] -> [a]
insert f x [] = [x]
insert f y (x:xs)
  | f y x = y : x : xs
  | otherwise = x : insert f y xs

sortByCond :: [a] -> (a -> a -> Bool) -> [a]
sortByCond (x:xs) f = insert f x (sortByCond xs f)

--8
myFlip :: (a -> b -> c) -> b -> a -> c
myFlip f = (\x y -> f y x)

--9
myCurry :: ((a,b) -> c) -> a -> b -> c
myCurry f = \x y -> f (x, y)

--10
myUncurry :: (a -> b -> c) -> (a,b) -> c
myUncurry f = \(x, y) -> f x y

--13
--13 a) [[1,1,1],[2,2,2],[3,3,3]]
--13 b) [0,0,1,1,1,2,2,2,3,3]
--13 c) [4,16,36,64,100,...]
--13 d) 220
--13 e) [53, 21.5, 11, 5.75, 2.6]
--13 f) [1,9, 27, 81]
--13 g) 26

--14
orderedTriples :: [(Int,Int,Int)] -> [(Int,Int,Int)]
orderedTriples = filter(\(x,y,z) -> x <= y && y <= z)

--15
myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

--16
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f [] = []
myFilter f (x:xs) 
  | f x = x : myFilter f xs
  | otherwise = myFilter f xs 

--17a
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile f [] = []
myTakeWhile f (x:xs)
  | f x = x : myTakeWhile f xs
  | otherwise = []

--17b
myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile f [] = []
myDropWhile f (x:xs)
  |f x = myDropWhile f xs
  |otherwise = (x:xs)

--18
myAll1 :: (a -> Bool) -> [a] -> Bool
myAll1 f [] = True
myAll1 f (x:xs)
  | f x = myAll1 f xs
  | otherwise = False

myAll2 :: (a -> Bool) -> [a] -> Bool
myAll2 f l = and[f x| x <- l]

myAll3 :: (a -> Bool) -> [a] -> Bool
myAll3 f xs = and(map f xs)

myAll4 :: (a -> Bool) -> [a] -> Bool
myAll4 f xs = length(takeWhile f xs) == length xs 

--22
countVowels :: String -> Int
countVowels xs = length(filter(\x -> elem x ['a', 'e', 'i', 'o', 'u']) xs)

--23
f :: (Eq a) => [a] -> [a] -> Int
f x y = length (takeWhile (\(a,b) -> a == b) (zip x y))

{-
  Primeiro: iremos juntar os elementos de x e de y numa unica lista formando tuplos (a,b),
  sendo a, elemento de x e b elemento de y

  Segundo: posteriormento iremos procurar o prefixo máximo de tuplos que cumpra a condição de 
  que em cada tuplo da lista, a tem de ser igual a b

  terceiro:  calculamos o tamanho do prefixo que cumpra essa condição 
-}

--32
myMap1 :: (a -> b) -> [a] -> [b]
myMap1 f = foldr(\x acc -> (f x) : acc)[]

myMap2 :: (a -> b) -> [a] -> [b]
myMap2 f = foldl(\acc x -> acc ++ [f x])[]

--33
largePairs1 :: Int -> [(Int,Int)] -> [(Int,Int)]
largePairs1 n = foldr(\(x,y) acc -> if x + y > n then (x,y) : acc else acc) [] 

largePairs2 :: Int -> [(Int, Int)] -> [(Int,Int)]
largePairs2 n = foldl(\acc (x,y) -> if x + y > n then acc ++ [(x,y)] else acc)[]

--35
separateSingleDigits :: [Int] -> ([Int],[Int])
separateSingleDigits l = foldr(\x (xs,ys) ->  if x < 10 then (x:xs, ys) else (xs, x:ys)) ([],[]) l

separateSingleDigits1 :: [Int] -> ([Int],[Int])
separateSingleDigits1 l = foldl(\(xs,ys) x -> if x < 10 then (xs ++ [x],ys) else (xs, ys ++ [x])) ([],[]) l