import Data.Char


--3a
applyN :: (a -> a) -> Int -> a -> a
applyN f 0 x = x
applyN f n x = applyN f (n-1) (f x)

--3b
oneChr_:: Char -> Char
oneChr_ c 
  | (ord c + 1 >= ord 'a' && ord c + 1 <= ord 'z') && isLower c = chr(ord c + 1)
  | (ord c + 1 >= ord 'A' && ord c + 1 <= ord 'Z') && isUpper c = chr(ord c + 1)
  | otherwise = 'a'

-- "a" -> "b"
-- "b" -> "c"

cipher :: Int -> String -> String
cipher n [] = []
cipher n (x:xs) = applyN oneChr_ n x : cipher n xs


-- oneChr 3 "a" -> "d"
-- applyN oneChr 3 "a" -> oneCHar 3( oneChar 3 (oneChr 3 "a"))
-- appl
-- "Miguel" -> 3
-- applyN oneChr 3 "M" : applyN oneChr 3 "i" : cipher 3 "guel"
-- map -> applyN 1 M -> applyN 1 i -> applyN 1 g -> applyN 1 u -> applyN 1 e -> applyN 1 l
-- applyN (a->a) Int Char


--7

insert_ :: (a -> a -> Bool) -> a -> [a] -> [a]
insert_ _ x [] = [x]
insert_ f x (y:ys)
  | f x y  = x : y : ys
  | otherwise = y : insert_ f x ys


-- 3 "<" [3,4] ">" [4,3]

-- 3 "<" 4 -> true = 3 : 4 : ...
-- 5 ">" 3 -> true = 5 : 3
-- 3 ">" 4 -> false

sortbyCond :: [a] -> (a -> a -> Bool) -> [a]
sortbyCond [] _ = []
sortbyCond (x:xs) f = insert_ f x (sortbyCond xs f)



--8
myFlip_ :: (a -> b -> c) -> (b -> a -> c)
myFlip_ f = (\x y -> f y x)

-- \x e -> x + e 


--10
myUncurry :: (a -> b -> c) -> (a,b) -> c
myUncurry f = (\(x,y) -> f x y)


--15 
myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x : xs) = f x : myMap f xs


--19 
myIterate_ :: Enum a => (a -> a) -> a -> [a]
myIterate_ f x = x : [f i| i <- myIterate_ f x]

-- myIt (+2) 1 -> 1 : [ i + 2 | i <- myIterate_ (+2) 1]



-- [func | lista , guarda]

-- myIterate (+2) 1
-- [1, 3, 5, 7, 9]

-- f 1 2 -> 1+2+2 = 5
-- f +2 1 -> 1+2+2+2+2 = 9

--22
countVowels :: [Char] -> Int 
countVowels l = length(filter(\n -> n == 'a' || n == 'e' || n == 'i' || n == 'o' || n == 'u')l)


--35
separateSingleDigits :: (Integral a) => [a] -> ([a],[a])
separateSingleDigits l = foldr  (\n (a,b) -> if (n < 10) then (n : a, b) else (a, n : b)) ([],[]) l

-- foldr (+) pivot lista

-- 1 -> 5 + 5 = 10
-- 2 -> 4 + 10 = 14
-- 3 -> 3 + 14 = 17
-- 4 -> 2 + 17 = 19
-- 5 -> 1 + 19 = 20