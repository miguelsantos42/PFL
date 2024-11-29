--1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = (a + b) > c && (a + c) > b && (b + a) > c && (b + c) > a && (c + a) > b && (c + b) > a

--2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt (s * (s-a)*(s-b)*(s-c))
  where s = (a+b+c) / 2

--3
metades :: [a] -> ([a], [a])
metades xs = (take metade xs, drop metade xs)
  where metade = length xs `div` 2

--4a
last1 :: [a] -> a
last1 xs = head (drop len xs)
  where len = length xs-1

last2 :: [a] -> a
last2 xs = head (reverse xs)

last3 :: [a] -> a
last3 xs = head (reverse (tail xs))

--4b
last4 :: [a] -> [a]
last4 xs = take x xs
  where x = length xs-1

--5

factorial ::  Integer -> Integer
factorial n
  | n == 0 = 1
  | otherwise = n * factorial (n-1)

--5a
binom :: Integer -> Integer -> Integer
binom n k = (factorial (n)) `div` (factorial (k) * factorial (n-k))

--5b ->????????????????????????????????????????

-- binom1 :: Integer -> Integer -> Integer
-- binom1 n k
--   | k < n - k = product((n-k+1).. n) 'div' 
--   | otherwise = factorial (n) `div` factorial(n-k)
--   where 
--     q = k + 1

--6

raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c
  | delta > 0 = ((-b + delta) / (2 * a), ( -b - delta) / (2 * a))
  | delta == 0 = ((-b + delta) / (2 * a) , (-b + delta) / (2 * a))
  | otherwise = error "NoResultPossible"
  where delta = sqrt (b^2 - 4 * a * c)

--9
classifica1 :: Int -> String
classifica1 x = if x <= 9 then "reprovado"
                else if x >= 10 && x < 13 then "suficiente"
                else if x >= 13 && x < 16 then "bom"
                else if x >= 16 && x < 19 then "muito bom"
                else "muito bom com distincao"


classifica2 :: Int -> String
classifica2 x
  | x <= 9 = "reprovado"
  | x >= 10 && x < 13 = "suficiente"
  | x >= 13 && x < 16 = "bom"
  | x >= 16 && x < 19 = "muito bom"
  | otherwise = "muito bom com distincao"

--10
classifica' :: Float -> Float -> String
classifica' a b
  | imc < 18.5 = "baixo peso"
  | 18.5 <= imc && imc < 25 = "peso normal"
  | 25 <= imc && imc < 30 = "excesso de pesso"
  | otherwise = "obesidade"
  where imc = a / (b^2)


--11.a
max1 :: Ord a => a -> a -> a -> a
max1 a b c = if (a <= b) && (b <= c) then c
            else
              if (b >= c) && (b >= a) then b
              else a

min1 :: Ord a => a -> a -> a -> a
min1 a b c = if (a <= b) && (a <= c) then a
            else
              if (a >= b) && (b <= c) then b
              else c

represent1 :: Ord a => a -> a -> a -> (a,a)
represent1 x y z = (max1 x y z , min1 x y z)

---------------------------------------------

max2 :: Ord a => a -> a -> a -> a
max2 a b c
  | a >= b && a >= c = a
  | b >= a && b >= c = b
  | otherwise = c

min2 :: Ord a => a -> a -> a -> a
min2 a b c
  | a <= b && a <= c = a
  | a >= b && b <= c = b
  | otherwise = c


represent2 :: Ord a => a -> a -> a -> (a,a)
represent2 x y z = ((max2 x y z),(min2 x y z))

--11.b

max3 :: Ord a => a -> a -> a -> a
max3 a b c = max a (max b c)

min3 :: Ord a => a -> a -> a -> a
min3 a b c = min a (min b c)


--12 usando pattern matching

xor :: Bool -> Bool -> Bool
xor True False = True
xor False True = True
xor _ _ = False


--12 usando if-then-else
xor1 :: Bool -> Bool -> Bool
xor1 a b = if a == b then False
          else True


--13 usando if-then-else
safetail1 :: [a] -> [a]
safetail1 xs = if length xs == 0 then []
              else tail xs


--13 usando pattern-matching
safetail2 :: [a] -> [a]
safatail2  [] = []
safetail2 (_:xs) = xs

--13 usando guards
safetail3 :: [a] -> [a]
safetail3 xs
  | length xs == 0 = []
  | otherwise = xs

--14
--14a
curta :: [a] -> Bool
curta xs
  | length xs <= 2 = True
  | otherwise = False

--14b
curta1 :: [a] -> Bool
curta1 [] = True
curta1 [_] = True
curta1 [_,_] = True
curta1 _ = False

curta3 :: Eq a => [a] -> Bool -- Errado mas interessante
curta3 x 
    | take 2 x == x = True 
    | otherwise = False

--15
--15a
mediana :: Ord a => a -> a -> a -> a
mediana a b c = if (a >= b) && (b >= c) then b
                else if(a <= b) && (c >= b) then b
                else if(b >= a) && (c <= a) then a
                else if(a >= b) && (c >= a) then a
                else if(c <= b) && (c >= a) then c
                else c

mediana1 :: Ord a => a -> a -> a -> a
mediana1 a b c
  | (a <= b) && (a >= c) || (a >= b) && (a <= c) = a
  | (a <= b) && (b <= c) || (a >= b) && (b >= c) = b
  |otherwise = c


--15b
biggest :: Ord a => a -> a -> a -> a
biggest a b c
  | (a >= b) && (a >= c) = a
  | (b >= a) && (b >= c) = b
  | otherwise = c

smallest :: Ord a => a -> a -> a -> a
smallest a b c
  | (a <= b) && (a <= c) = a
  | (b <= a) && (b <= c) = b
  | otherwise = c

mediana2 :: (Ord a, Num a) => a -> a -> a -> a
mediana2 a b c = total - (biggest a b c) - (smallest a b c)
    where total = a + b + c

--15b(outra versão)
mediana3 :: (Ord a, Num a) => a -> a -> a -> a
mediana3 a b c = total - biggest1 a b c - smallest1 a b c
  where 
      total = a + b + c

      smallest1 a b c
        | (a <= b) && (a <= c) = a
        | (b <= a) && (b <= c) = b
        | otherwise = c

      biggest1 a b c
        | (a >= b) && (a >= c) = a
        | (b >= a) && (b >= c) = b
        | otherwise = c

--16

unidades :: [String]
unidades = 
  [
  "zero"
  ,"um"
  ,"dois"
  ,"tres"
  ,"quatro"
  ,"cinco"
  ,"seis"
  ,"sete"
  ,"oito"
  ,"nove"
  ]

dez_a_dezanove :: [String]
dez_a_dezanove = 
  [
  "dez"
  ,"onze"
  ,"doze"
  ,"treze"
  ,"catorze"
  ,"quinze"
  ,"dezasseis"
  ,"dezassete"
  ,"dezoito"
  ,"dezanove"
  ]

dezenas :: [String]
dezenas =
  [
    "vinte"
    ,"trinta"
    ,"quarenta"
    ,"cinquenta"
    ,"sessenta"
    ,"setenta"
    ,"oitenta"
    ,"noventa"
  ]


divide :: Int -> (Int,Int)  
divide n = (n`div`10, n `mod` 10)

combina :: (Int, Int) -> String
combina (0, u) = unidades !! u
combina (1 ,u) = dez_a_dezanove !! u
combina (d, 0) = dezenas !! (d-2)
combina (d, u) = dezenas !! (d-2) ++ " e " ++ unidades !! u

converte :: Int -> String
converte n | n < 100 = combina (divide n)

