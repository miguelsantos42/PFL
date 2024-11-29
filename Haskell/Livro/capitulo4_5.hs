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
  | ord(x) + 1 >= ord('a') && ord(x) + 1 <= ord('z') && isLower(x) = chr(ord(x) + 1)
  | otherwise = if isLower(x) then ('a') else ('A')

cipher :: Int -> String -> String
cipher _ [] = []
cipher n (x:xs) = applyN oneUp n x : cipher n xs

--HO-4
f :: (a -> b -> b)-> b -> a -> b 
f p a b = p b a

--HO-7
insert :: (a -> a -> Bool) -> a -> [a] -> [a]
insert f n [] = [n]
insert f x (y:ys)
  | f x y = x : y : ys
  | otherwise = y : insert f x ys

sortByCond :: [a] -> (a -> a -> Bool) -> [a]
sortByCond [] f = []
sortByCond (x:xs) f = insert f x (sortByCond xs f)

--HO-8
myFlip :: (a -> b -> c) -> b -> a -> c
myFlip f = (\x y -> f y x)


--HO-10
myUncurry :: (a -> b -> c) -> (a,b) -> c
myUncurry f = (\(x,y) -> f x y)


--HO-13
--a) map (replicate 3)[1..3] -> [[1,1,1],[2,2,2],[3,3,3]]
--b) map (‘div‘ 3)[1..10] -> [0,0,1,1,1,2,2,2,3,3]
--c) filter even (map (^2)[1..]) -> [4,16,36,64,100,144,...]
--d) sum (takeWhile (<= 100)(filter even (map (^2)[1..]))) -> 220
--e) zipWith (xy -> (x * 10 + 3)/ y)[5,4,3,2,1] [1,2,3,4,5] -> [53, 21.5, 11, 5.75, 2.17]
--f) takeWhile (<200)(iterate (3*)1) -> [1,3, 9, 27, 81]
--g) length(filter (<=’z’)[’a’..]) ->  26

--HO-14
orderedTriples :: [(Int,Int,Int)] -> [(Int,Int,Int)]
orderedTriples = filter(\(x,y,z) -> x <= y && y <= z)

--HO-15
myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

--HO-16
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f [] = []
myFilter f (x:xs)
  | f x = x:xs
  | otherwise = myFilter f xs

--HO-17
--a 
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile _ [] = []
myTakeWhile f (x:xs)
  | f x = x : myTakeWhile f xs
  | otherwise = []

--b
myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile _ [] = []
myDropWhile f (x:xs)
  | f x = myDropWhile f xs
  | otherwise = x : myDropWhile f xs

--22
countVowels :: String -> Int
countVowels [] = 0
countVowels xs = length(filter(\x -> elem x ['a','e','i','o','u'])xs)

--32  
myMap1 :: (a -> a) -> [a] -> [a]
myMap1 f = foldr(\x acc -> f x : acc) []

myMap2 :: (a -> a) -> [a] -> [a]
myMap2 f = foldl(\acc x -> acc ++ [f x]) []

--33
largePairs1 :: Int -> [(Int,Int)] -> [(Int,Int)]
largePairs1 n = foldr(\(x,y) acc -> if x + y > n then (x,y) : acc else acc) []

largePairs2 :: Int -> [(Int, Int)] -> [(Int, Int)]
largePairs2 n = foldl(\acc (x,y) -> if x + y > n then acc ++ [(x,y)] else acc) []

--34
fuseDigits :: [Int] -> Int
fuseDigits = foldl(\acc x -> (acc * 10 + x)) 0

--35
separateSingleDigits1 :: [Int] -> ([Int],[Int])
separateSingleDigits1 xs = foldr(\x (xs,ys) -> if x <= 9 then (x:xs,ys) else (xs,x:ys)) ([],[]) xs

separateSingleDigits2 :: [Int] -> ([Int],[Int])
separateSingleDigits2  = foldl(\(xs,ys) x -> if x <= 9 then (xs ++ [x], ys) else (xs, ys ++ [x])) ([],[]) 

--36
{--
O que vai acontecer neste caso é o seguinte: suponhamos que temos duas listas xs = [1,2,3] e ys = [4,5,6]
O que vai acontecer é que vamos no acumulador que neste caso vai ser ys e vamos começar a correr da direita
para a esquerda a lista xs acumulando sempre o valor selecionado em xs no acumulador
Assim este vão ser os passos:
2 -> xs ys -> [1,2,3] [4,5,6]
3 -> xs ys -> [1,2] [3,4,5,6]
4 -> xs ys -> [1] [2,3,4,5,6]
5 -> xs ys -> [1,2,3,4,5,6]

Deste forma foca tudo acumulado na mesma lista aliando a isto a ordem permanece igual
--}

fun :: [a] -> [a] -> [a]
fun xs ys = foldr (\x acc -> x:acc) ys xs

--HO-37
--a
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f acc [] = acc
myFoldr f acc (x:xs) = f x (myFoldr f acc xs)

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f acc [] = acc
myFoldl f acc (x:xs) = f (myFoldl f acc xs) x