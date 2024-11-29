import Data.Char (isLower, isUpper, ord, chr)

--HO-1
twice :: (a -> a) -> a -> a
twice f x = f (f x)

--HO-3
--a
applyN :: (a -> a) -> Int -> a -> a
applyN f 0 x = x
applyN f n x = applyN f (n-1) (f x)

--b
oneUp :: Char -> Char
oneUp x
  | ord (x) + 1 >= ord 'a' && ord (x) + 1 <= ord 'z' && isLower (x) = chr(ord (x) + 1)
  | ord (x) + 1 >= ord 'A' && ord (x) + 1 <= ord 'z' && isUpper (x) = chr(ord (x) + 1)
  | otherwise = if isLower x then 'a' else 'A'

cipher :: Int -> [Char] -> [Char]
cipher _ [] = []
cipher n (x:xs) = applyN oneUp n x : cipher (n-1) xs

--HO-4
function :: (a -> b -> b)-> b -> a -> b
function f a b = f b a

--HO-7
insert :: (a -> a -> Bool) -> a -> [a] -> [a]
insert f n [] = [n]
insert f y (x:xs)
  | f y x = y : x : xs
  | otherwise = x : insert f y xs

sortByCond :: [a] -> (a -> a -> Bool) -> [a]
sortByCond [] f = []
sortByCond (x:xs) f = insert f x (sortByCond xs f)

--HO-8
myFlip :: (a -> b -> c) -> (b -> a -> c)
myFlip f = (\x y -> f y x)

--HO-9
myCurry :: ((a,b) -> c) -> a -> b -> c
myCurry f = (\x y -> f(x,y))

--HO-10
myUncurry :: (a -> b -> c) -> (a,b) -> c
myUncurry f = (\(x,y) -> f x y)

--HO-13
--a) [[1,1,1],[,2,2,2],[,3,3,3]]
--b) [0,0,1,1,1,2,2,2,3,3]
--c) [4,16,36,64,100,144,...]
--d) 220
--e) [53, 21.5, 11, 5.75, 2.6]
--f) [1, 3, 9, 27, 81]
--g) 26

--HO-14
orderedTriples :: [(Int,Int,Int)] -> [(Int,Int,Int)]
orderedTriples = filter(\(x,y,z) -> x <= y && y <= z)

--HO-15
myMap :: (a -> a) -> [a] -> [a]
myMap f [] = []
myMap f (x:xs) = (f x) : myMap f xs

--HO-16
myFilter :: (a -> Bool) -> [a] -> [a] 
myFilter f [] = []
myFilter f (x:xs)
  | f x = x : myFilter f xs
  | otherwise = myFilter f xs

--HO-17
--a
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile f [] = []
myTakeWhile f (x:xs)
  | f x = x : myTakeWhile f xs
  | otherwise = []

--b
myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile f [] = []
myDropWhile f (x:xs) 
  | f x = myDropWhile f xs
  | otherwise = x:myDropWhile f xs


--HO-18
--a
myAll1 :: (a -> Bool) -> [a] -> Bool
myAll1 f [] = True
myAll1 f (x:xs)
  | f x = myAll1 f xs
  | otherwise = False

--b
myAll2 :: (a -> Bool) -> [a] -> Bool
myAll2 f l = and[f x | x <- l]

--c
myAll3 :: (a -> Bool) -> [a] -> Bool
myAll3 f l = and(map f l)

--d
myAll4 :: (a -> Bool) -> [a] -> Bool
myAll4 f l = length(takeWhile f l) == length l


--HO-22
countVowels :: [Char] -> Int
countVowels xs = length(filter(\x -> elem x ['a','e','i','o','u'])xs)

--HO-23
f :: (Eq a) => [a] -> [a] -> Int
f x y = length (takeWhile (\(a,b) -> a == b) (zip x y))

{--
Primeiro: iremos zipar duas listas isto é, se tivermos por exemplo uma lista a = [5,4,3,2,1] e uma lista b = [5,4,3,1,2]
irá formar uma única lista [(5,5), (4,4), (3,3), (2,1), (1,2)]

Segundo:  iremos "arrancar" o preifxo da lista que cumprem a condição de que os tuplos dentro da lista tenho elementos
iguais. Neste caso [(5,5),(4,4),(3,3)]

Terceiro: por fim, iremos calcular o tamanho dessa lista final que resultou da seleção do prefixo, que neste caso é de 3
--}

--HO-26

{--
  a) sqrt (1+2+3) => sqrt $ 1+2+3
  b) length ((map f) (head (reverse xs))) => length $ map f $ head . reverse xs
  c) drop 2 (tail [1..6])
    i) drop 2 . tail [1..6]
    ii) drop 2 $ tail [1..3]
--}

--HO-28
{--
  a) sum(map sqrt [1..10]) => sum $ map sqrt [1..10]
  b) sum(filter (>8) (map (*2) [2..14])) => sum $ filter (>8)  $ map (*2) [2..14]
  
  c) 
    i) sum $ replicate 5 . min 1 3
    ii) sum $ replicate 5 $ min 1 3
    iii) sum . replicate 5 . min 1 3
  
  d) replicate 50 (sum (map (+3)(zipWith min [1..5] [4..8]))) => replicate 50 $ sum $ map (+3) $ zipwith min [1..5] [4..8] 
--}

--HO-29
{--
  a) (all (>3). filter (>=3)) [1,4..10] => True
  b) map ($ 4) [(2+),(5*), (^3), sqrt] => [6,20,64,2]
  c) filter (even . (!!2)) [[1,2,3],[4,5,6],[8,3,5,8],[12,11,10]] => [[4,5,6],[12,11,10]]
  d) (filter even . (!!2)) [[1,2,3],[4,5,6],[8,3,5,8],[12,11,10]] => [8,8]
--}

--HO-32
myMap1 :: (a -> b) -> [a] -> [b]
myMap1 f = foldr(\x acc -> (f x) : acc) [] 

myMap2 :: (a -> b) -> [a] -> [b]
myMap2 f = foldl(\acc x -> acc ++ [f x]) []

--HO-33
largePairs1 :: Int -> [(Int,Int)] -> [(Int,Int)]
largePairs1 n = foldr(\(x,y) acc -> if x + y >= n then (x,y) : acc else acc) []

largePairs2 :: Int -> [(Int,Int)] -> [(Int,Int)]
largePairs2 n = foldl(\acc (x,y) -> if x + y >= n then acc ++ [(x,y)] else acc) []

--HO-35
separateSingleDigits1 :: [Int] -> ([Int],[Int])
separateSingleDigits1 = foldr(\x (xs,ys) -> if x < 10 then (x:xs,ys) else (xs, x:ys)) ([],[]) 

separateSingleDigits2 :: [Int] -> ([Int],[Int])
separateSingleDigits2 = foldl(\(xs,ys) x -> if x < 10 then (xs ++ [x], ys) else (xs , ys ++ [x])) ([],[])

--HO-37
--a
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f acc [] = acc
myFoldr f acc (x:xs) = f x (myFoldr f acc xs)

--b
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f  acc [] = acc
myFoldl f  acc (x:xs) = myFoldl f (f acc x) xs 