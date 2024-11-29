--1
maxpos :: [Int] -> Int
maxpos [] = 0
maxpos (x:xs) = if x > maxpos xs then x else maxpos xs

--2
dups :: [a] -> [a]
dups [] = []
dups xs = dupsincrease xs 1

dupsincrease :: [a] -> Int -> [a]
dupsincrease [] _ = []
dupsincrease (x:xs) n
  | n `mod` 2 /= 0 = x : x : dupsincrease xs (n+1)
  | otherwise = x : dupsincrease xs (n+1)

--3
transforma :: String -> String
transforma [] = []
transforma (x:xs)
  |elem x ['a','e','i','o','u'] = x : 'p' : x : transforma xs
  |otherwise = x : transforma xs


----------------------2ªParte-----------------------
type Vector = [Int]
type Matriz = [[Int]]
----------------------------------------------------

--4
transposta :: Matriz -> Matriz
transposta [] = []
transposta ([]:_) = []
transposta xs = map head xs : transposta(map tail xs) 

--5
prodInterno :: Vector -> Vector -> Int
prodInterno xs ys = sum[x * y |(x,y) <- zip xs ys]

prodInterno1 :: Vector -> Vector -> Int
prodInterno1 [] [] = 0
prodInterno1 (x:xs) (y:ys) = (x*y) + prodInterno1 xs ys

--6
prodMat :: Matriz -> Matriz -> Matriz
prodMat a b = [[prodInterno l c| l <- transposta b] | c <- a]

-------------------3ªParte -------------------------

data Arv a = F | N a (Arv a) (Arv a) deriving(Show)

---------------------------------------------------
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


-- (N 1 (N 2 F F) (N 3 F F))
-- (N 1 (N 2 (N 4 F F) F) (N 3 F (N 5 F F)))
-- (N 1 (N 2 (N 4 F F) (N 5 F F)) (N 3 (N 6 F F) (N 7 F F)))

-- (N 1 (N 2 (N 3 F F) F) F)
-- (N 1 F (N 2 F (N 3 F F)))
-- (N 1 (N 2 (N 3 (N 4 F F) F) F) F)

-- (N 1 (N 2 (N 4 F F) F) (N 3 (N 5 (N 6 F F) F) F))

-- (N 1 (N 2 (N 4 F F) F) (N 3 F F))

--9
f :: (a -> b -> c) -> b -> a -> c
f p a b = p b a
