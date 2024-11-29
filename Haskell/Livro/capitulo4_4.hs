import Data.Char


--HO-1
twice :: (a -> a) -> a -> a
twice f n = f (f n) 

--HO-3
--a
applyN :: (a -> a) -> Int -> a -> a
applyN f 0 x = x
applyN f n x = applyN f (n-1) (f x)

--b
oneUp :: Char -> Char
oneUp c
  | ord(c) + 1 >= ord('a') && ord(c) + 1 <= ord('z') && isLower c = chr(ord(c) + 1)
  | ord(c) + 1 >= ord('A') && ord(c) + 1 <= ord('Z') && isUpper c = chr(ord(c) + 1)
  | otherwise = if isLower c then 'a' else 'A'

cipher :: Int -> String -> String
cipher _ [] = []
cipher n (x:xs) = applyN oneUp n x : cipher n xs

--HO-4
function :: (a -> b -> b) -> b -> a -> b
function f a b = f b a

--HO-7
insert :: (a -> a -> Bool) -> a -> [a] -> [a]
insert f x [] = [x]
insert f y (x:xs)
  | f y x = y : x : xs
  | otherwise = x : insert f y xs

sortByCond :: [a] -> (a -> a -> Bool) ->[a]
sortByCond [] f = []
sortByCond (x:xs) f = insert f x (sortByCond xs f)

--HO-8
myFlip :: (a -> b -> c) -> (b -> a -> c)
myFlip f a b = f b a 

--HO-10
myUncurry :: (a -> b -> c) -> (a,b) -> c
myUncurry f (x,y) = f x y

--HO-13
--a) map (replicate 3)[1..3] => [[1,1,1],[2,2,2],[3,3,3]]
--b) map ('div' 3) [1..10] => [0, 0, 1, 1, 1, 2, 2, 2, 3, 3]
--c) filter even (map (^2)[1..]) => [4,16,36,64,100,144,...]
--d) sum (takeWhile (<= 100)(filter even (map (^2)[1..]))) => 220
--e) zipWith (xy -> (x * 10 + 3)/ y)[5,4,3,2,1] [1,2,3,4,5] => [53, 21.5, 11, 5.75, 2.6]
--f) takeWhile (<200)(iterate (3*)1) => [1, 3, 9, 27, 81]
--g) length(filter (<=’z’)[’a’..]) => 26

--HO-14
orderedTriples :: [(Int,Int,Int)] -> [(Int,Int,Int)]
orderedTriples = filter(\(a,b,c) -> a <= b && b <= c)

--HO-15
myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

--HO-16
myFilter :: (a ->  Bool) -> [a] -> [a]
myFilter f [] = []
myFilter f (x:xs) 
  | f x = x:xs
  | otherwise = myFilter f xs

--HO-17
--a
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile f [] = []
myTakeWhile f (x:xs)
  |f x = x : myTakeWhile f xs
  |otherwise = []

--b
myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile f [] = []
myDropWhile f (x:xs)
  |f x = myDropWhile f xs
  |otherwise = (x:xs)

--HO-22
countVowels :: String -> Int 
countVowels [] = 0
countVowels xs = length(filter(\x -> elem x ['a','e','i','o','u'])xs)

--HO-32
myMap1 :: (a -> b) -> [a] -> [b]
myMap1 f = foldr(\x acc -> (f x) : acc) []

myMap2 :: (a -> b) -> [a] -> [b]
myMap2 f = foldl(\acc x -> acc ++ [f x]) []

--HO-33
largePairs1 :: Int -> [(Int,Int)] -> [(Int,Int)]
largePairs1 n = foldr(\(x,y) acc -> if (x + y) > n then (x,y) : acc else acc) []

largePairs2 :: Int -> [(Int, Int)] -> [(Int, Int)]
largePairs2 n = foldl(\acc (x,y) -> if (x+y) > n then acc ++ [(x,y)] else acc) []

--HO-34
fuseDigits :: [Int] -> Int
fuseDigits = foldl(\acc x -> acc * 10 + x) 0

--HO-35
separateSingleDigits :: [Int] -> ([Int], [Int])
separateSingleDigits = foldr(\x (xs,ys) -> if x <= 9 then (x:xs, ys)  else (xs, x:ys)) ([],[])

separateSingleDigits1 :: [Int] -> ([Int], [Int])
separateSingleDigits1 = foldl(\(xs,ys) x -> if x <= 9 then (xs ++ [x], ys) else (xs, ys ++ [x])) ([],[])

--HO-36
{--
Basicamente acontece isto: temos os caso em que xs = [1,2,3] e ys = [4,5,6]
De uma forma geral, o que vai acontecer é que se vai concatenar a lista xs a ys e por conta disso vai ser
preservada a ordem dos elementos da lista

Por exemplo : [4,5,6] -> [3,4,5,6] -> [2,3,4,5,6] -> [1,2,3,4,5,6] 
--}

--HO-37
--a
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ acc [] = acc
myFoldr f acc (x:xs) = f x (myFoldr f acc xs)

--b
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl _ acc [] = acc
myFoldl f acc (x:xs) = myFoldl f (f acc x) xs   

