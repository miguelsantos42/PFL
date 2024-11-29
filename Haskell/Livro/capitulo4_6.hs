import Data.Char 

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
  | ord(x) + 1 >= ord('a') && ord(x) + 1 <= ord('z') && isLower(x) = chr(ord(x) +1)
  | otherwise = if isLower(x) then 'a' else 'A'


cipher :: Int -> String -> String
cipher _ [] = []
cipher n (x:xs) = applyN oneUp n x : cipher n xs

--HO-4
f :: (a -> b -> b)-> b -> a -> b
f p a b = p b a

--HO-7
insert :: (a -> a -> Bool) -> a -> [a] -> [a]
insert f x [] = [x]
insert f x (y:ys)
  | f x y = x:y:ys
  | otherwise = y : insert f x ys  

sortByCond :: [a] -> (a -> a -> Bool) -> [a]
sortByCond [] f = []
sortByCond (x:xs) f = insert f x (sortByCond xs f)

--HO-8
myFlip :: (a -> b -> c) -> b -> a -> c
myFlip f a b = f b a

--HO-10
myUncurry :: (a -> b -> c) -> (a,b) -> c
myUncurry f = (\(a,b) -> f a b)

--HO-14
orderedTriples :: [(Int,Int,Int)] -> [(Int,Int,Int)]
orderedTriples = filter(\(a,b,c) -> a <= b && b <= c)

--HO-15
myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

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
  | otherwise = x : myDropWhile f xs

--HO-22
countVowels :: String -> Int
countVowels xs = length[x | x <- xs, elem x ['a','e','i','o','u']]

--HO-32
myMap1 :: (a -> a) -> [a] -> [a]
myMap1 f xs = foldr(\x acc -> (f x) : acc) [] xs

myMap2 :: (a -> a) -> [a] -> [a]
myMap2 f xs = foldl(\acc x -> acc ++ [f x]) [] xs

--HO-33
largePairs1 :: Int -> [(Int,Int)] -> [(Int,Int)]
largePairs1 n = foldr(\(x,y) acc -> if x + y > n then (x,y) : acc else acc) []

largePairs2 :: Int -> [(Int, Int)] -> [(Int, Int)]
largePairs2 n = foldl(\acc (x,y) -> if x + y > n then acc ++ [(x,y)] else acc) []

--HO-34
fuseDigits :: [Int] -> Int
fuseDigits = foldl(\acc x -> acc * 10 + x) 0

--HO-35
separateSingleDigits1 :: [Int] -> ([Int],[Int])
separateSingleDigits1 = foldr(\x (xs,ys) -> if x <= 9 then (x:xs,ys) else (xs, x:ys)) ([],[])

separateSingleDigits2 :: [Int] -> ([Int],[Int])
separateSingleDigits2 = foldl(\(xs,ys) x -> if x <= 9 then (xs ++ [x], ys) else (xs, ys ++ [x])) ([],[])

--HO-36
{--
o foldr basicamente acumula os elmentos de uma lista da direita para a esquerda

O que acontece aqui é o seguinte: suponhamos que temos xs = [1,2,3] e ys = [4,5,6]
1)a lista ys vai ser a lista acumuladora então temos que a lista final neste momento é [4,5,6]
2)depois vamos começar a acumular, da direita para a esquerda, os valores da lista xs na lista final  
3) os passos que vão acontecer sucessivamente são estes: [1,2] [3,4,5,6] -> [1] [2,3,4,5,6] -> [1,2,3,4,5,6]
4)Assim concluimos que a ordem dos elemntos não variou
--}

--HO-37
--a
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f acc [] = acc
myFoldr f acc (x:xs) = f x (myFoldr f acc xs) 

--b
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f acc [] = acc
myFoldl f acc (x:xs) = f (myFoldl f acc xs) x 