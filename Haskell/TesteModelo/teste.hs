--HO.1
maxpos :: [Int] -> Int
maxpos [] = 0
maxpos (x:xs)
  | x > 0 = max x (maxpos xs)
  | otherwise = maxpos xs

--HO.2
dupsHelper :: [a] -> Int-> [a]
dupsHelper [] _ = []
dupsHelper (x:xs) m
  | m `mod` 2 /= 0 = x : x : dupsHelper xs (m+1)
  | otherwise = x : dupsHelper xs (m+1)

dups :: [a] -> [a]
dups xs = dupsHelper xs 1

--HO.3
transforma :: String -> String
transforma [] = []
transforma (x:xs)
  | elem x ['a','e','i','o','u'] = x : 'p' : x : transforma xs
  | otherwise = x : transforma xs

--------------------------------
type Vector = [Int]
type Matriz = [[Int]]
--------------------------------

--HO.4
transposta :: Matriz -> Matriz
transposta ([] : _) = []
transposta [] = []
transposta xs = map head xs : transposta(map tail xs)

--HO.5
prodInterno :: Vector -> Vector -> Int
prodInterno [] _ = 0
prodInterno _ [] = 0
prodInterno xs ys = sum[x * y | (x,y) <- zip xs ys] 

--HO.6
