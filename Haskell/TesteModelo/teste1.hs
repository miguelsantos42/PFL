--1
maxpos :: [Int] -> Int
maxpos [] = 0
maxpos (x:xs)
  |x > 0 = max x (maxpos(xs))
  |otherwise = maxpos xs

--2
dupsHelper :: [a] -> Int -> [a]
dupsHelper [] _ = []
dupsHelper (x:xs) m
  | m `mod` 2 /= 0 = x : x : dupsHelper xs (m+1)
  | otherwise = x : dupsHelper xs (m+1)

dups :: [a] -> [a]
dups xs = dupsHelper xs 1


--3
transforma :: String -> String
transforma [] = []
transforma (x:xs) 
  | elem x ['a','e','i','o','u'] = x : 'p' : x : transforma xs
  | otherwise = x : transforma xs 


----------- 2ª Parte ----------------------
type Vector = [Int]
type Matriz = [[Int]]
-------------------------------------------

--4
transposta :: Matriz -> Matriz
transposta ([]:_) = []
transposta [] = []
transposta xs = map head xs : transposta(map tail xs)

--5
prodInterno :: Vector -> Vector -> Int
prodInterno xs ys = sum[x * y | (x,y) <- zip xs ys]

--6 -> ??????????????????????????



----------3ª Parte --------------------------------
data Arv a = F | N a (Arv a) (Arv a) deriving(Show)
---------------------------------------------------
--7
alturas :: Arv a -> Arv Int 
alturas F = F
alturas (N a esq dir) = N a (alturas esq) (alturas dir)
  where a = 1 + max (subalturas esq) (subalturas dir)

subalturas :: Arv a -> Int
subalturas F = 0
subalturas (N a esq dir) = 1 + max (subalturas esq) (subalturas dir)

--8 -> ?????????????????????????????????????????????

----------------- 4ª Parte----------------
--9
f :: (a -> b -> c) -> b -> a -> c
f p a b = p b a