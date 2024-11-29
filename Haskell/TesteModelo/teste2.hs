--1
maxpos :: [Int] -> Int
maxpos [] = 0
maxpos (x:xs) = if x > maxpos xs then x else maxpos xs

--2
dups :: [a] -> [a]
dups xs = dupshelper xs 1

dupshelper :: [a] -> Int -> [a]
dupshelper [] _ = []
dupshelper (x:xs) m 
  | m `mod` 2 /= 0 = x : x : dupshelper xs (m+1)
  | otherwise = x : dupshelper xs (m+1)

--3
transforma :: String -> String
transforma [] = []
transforma (x:xs)
  | elem x ['a','e','i','o','u'] = x : 'p' : x : transforma xs
  | otherwise = x : transforma xs

-----------------2ª Parte ---------------------
type Vector = [Int]
type Matriz = [[Int]]


--4
transposta :: Matriz -> Matriz
transposta [] = []
transposta ([]:_) = []
transposta xs = map head xs : transposta(map tail xs)

--5
prodInterno :: Vector -> Vector -> Int
prodInterno xs ys = sum[x*y| (x,y) <- zip xs ys]

prodInterno1 :: Vector -> Vector -> Int
prodInterno1 [] _ = 0
prodInterno1 _ [] = 0
prodInterno1 (x:xs) (y:ys) = (x * y) + prodInterno1 xs ys

--6
prodMat :: Matriz -> Matriz -> Matriz
prodMat xs ys = [[prodInterno x y| x <- transposta ys] | y <- xs]

--------------------------- 3ª Parte -----------------------
data Arv a = F | N a (Arv a) (Arv a)
    deriving(Show)

--7
alturas :: Arv a -> Arv Int
alturas F = F
alturas (N a esq dir) = N (alturacount(N a esq dir)) (alturas esq) (alturas dir)
      

alturacount :: Arv a -> Int 
alturacount F = 0
alturacount (N a esq dir) = 1 + max (alturacount esq) (alturacount dir)

--8
equilibrada :: Arv a -> Bool
equilibrada F = True
equilibrada (N a esq dir) = abs(alturacount esq - alturacount dir) <= 1 && (equilibrada esq) && (equilibrada dir)

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