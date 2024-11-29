
--1
maxpos :: [Int] -> Int
maxpos [] = 0
maxpos (x:xs) = if x > maxpos xs then x else maxpos xs

--2
dups :: [a] -> [a]
dups xs = dupsHelper xs 1 

dupsHelper :: [a] -> Int -> [a]
dupsHelper [] _ = []
dupsHelper (x:xs) m
  | m `mod` 2 /= 0 = x : x : dupsHelper xs (m+1)
  | otherwise = x : dupsHelper xs (m+1)

--3
transforma :: String -> String
transforma [] = []
transforma (x:xs)
  |elem x ['a','e','i','o','u'] = x : 'p' : x : transforma xs
  | otherwise = x : transforma xs

-----------------2 ª Parte -----------------
type Vector = [Int]
type Matriz = [[Int]]
--------------------------------------------

--4
transposta :: Matriz -> Matriz
transposta [] = []
transposta ([]:_) = []
transposta xs = map head xs : transposta(map tail xs) 

--5
prodInterno :: Vector -> Vector -> Int
prodInterno xs ys = sum[x * y | (x,y) <- zip xs ys ]

--6
prodMat :: Matriz -> Matriz -> Matriz
prodMat a b = [[prodInterno l c | l <- transposta b] | c <- a]

---------------------3ªParte ---------------------------
data Arv a = F | N a (Arv a) (Arv a)
    deriving(Show)
--------------------------------------------------------

--7
alturas :: Arv a -> Arv Int 
alturas F = F
alturas (N a esq dir) = N (alturasaux(N a esq dir)) (alturas esq) (alturas dir)

alturasaux :: Arv a -> Int
alturasaux F = 0
alturasaux (N a esq dir) = 1 + max (alturasaux esq) (alturasaux dir)

--8
equilibrada :: Arv a -> Bool
equilibrada F = True
equilibrada (N a esq dir) = abs(alturasaux esq - alturasaux dir) <= 1 && equilibrada esq && equilibrada dir

--9
fun :: (a -> b -> c) -> b -> a -> c
fun p a b = p b a