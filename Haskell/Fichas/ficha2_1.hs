import Data.Char


--2.1a
and_ :: [Bool] -> Bool
and_ [] = True
and_ (x:xs) = x && and_ xs


--2.1b
or_ :: [Bool] -> Bool
or_ [] = False
or_ (x : xs) = x || or_ xs

--2.1c
concat_ :: [[a]] -> [a]
concat_ [] = []
concat_ (x : xs) = x ++ concat_ xs

--2.1d
replicate1 :: Int -> a -> [a]
replicate1 0 n = []
replicate1 n a = a : replicate1 (n-1) a

--2.1e
myindex_ :: [a] -> Int -> a
myindex_ (x : xs) 0 = x
myindex_ (x : xs) n = myindex_ xs (n-1)

--2.1f
elem_ :: Eq a => a -> [a] -> Bool
elem_ _ [] = False
elem_ a (x:xs)  
  | a == x = True
  | otherwise = elem_ a xs 


--2.2
intersperse :: a -> [a] -> [a]
intersperse _ [a] = [a]
intersperse a (x:xs) = x : a : intersperse a xs

--2.3
mdc :: Int -> Int -> Int
mdc a b 
  | b == 0 = a
  | otherwise = mdc b (a `mod` b)


--2.4a
insert :: Ord a => a -> [a] -> [a]
insert a [] = [a] 
insert n (x:xs) 
  | n < x = n : x : xs
  | otherwise = x : insert n xs
  
--2.4b
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

--2.5a
minimum_ :: Ord a => [a] -> a
minimum_ [] = error "Lista Vazia"
minimum_ [x] = x
minimum_ (x:xs) = min x (minimum_ xs)

--2.5b
delete_ :: Eq a => a -> [a] -> [a]
delete_ _ [] = []
delete_ a (x:xs) 
  | a == x = xs 
  | otherwise = x : delete_ a xs

--2.5c 
ssort :: Ord a => [a] -> [a] 
ssort [] = []
ssort l = m : ssort(delete_ m l)
  where m = minimum_ l

--2.6
squareSum :: (Num a, Enum a) => a
squareSum = sum [x^2 | x <- [1.. 100]]

--2.7a
aprox :: Int -> Double
aprox n = 4 * sum[((-1)^t)/(fromIntegral(2*t+1)) | t <- [0..n]]

--2.7b
aprox_ :: Int -> Double
aprox_ n = sqrt(12 * sum[((-1)^k)/(fromIntegral(k+1)^2) | k <- [0..n]])

--2.8
dotprod :: [Float] -> [Float] -> Float
dotprod xs ys = sum[x*y| (x,y) <- zip xs ys]

--2.9
divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..n-1], n `mod` x == 0]

--2.10
perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1..n-1], sum(divprop x) == x]

--2.11
pitagoricos :: Integer -> [(Integer ,Integer ,Integer)]
pitagoricos n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2 ]

--2.12
primo :: Integer -> Bool
primo n = length(divprop n) == 1

--2.12_1
primo_ :: Integer -> Bool
primo_ n = length[n `div` i | i <- [1..n], n `mod` i == 0]==2

-- 2.13
mersennes :: Integer -> [Integer]
mersennes n = [m | i <- [2..n], let m = 2^i - 1, primo m]

--2.14 
fatorial :: Integer -> Integer
fatorial 0 = 1
fatorial n = n * fatorial(n-1)

binom :: Integer -> Integer -> Integer
binom n k = fatorial n `div` (fatorial k * fatorial n-k)

pascal :: Integer -> [[Integer]]
pascal n = [[binom i k | k <- [0..i]] | i <- [0..n]]


--2.15 ->?????????????????????

ajusta :: Char -> Int -> Int 
ajusta w n = (ord(w) + n) - (ord('z')) + (ord('a')) - 1

oneChr :: Int -> Char -> Char
oneChr n c
  | (ord c) + n <= (ord ('z')) && (ord c) + n  >= (ord('a')) && isLower c =  chr((ord c) + n)
  | (ord c) + n <= (ord('Z'))  && (ord c) + n  >= (ord('A')) && isUpper c =  chr((ord c) + n)
  | c == ' ' = ' '
  | otherwise = oneChr(n-26) c

cifrar :: Int -> String -> String 
cifrar _ [] = []
cifrar n (x:xs) = oneChr n x : cifrar n xs 

--2.16
concat :: [[a]] -> [a]
concat listas = [valor | lista <- listas, valor <- lista ]

replicate_ :: Int -> a -> [a]
replicate_ 0 _ = []
replicate_ n a = a : replicate_ (n-1) a

pos_ :: Int -> [a] -> a
pos_ _ [] = error "No number"
pos_ 0 (x:xs) = x
pos_ n (x:xs) = pos_ (n-1) xs

--2.17
forte :: String -> Bool
forte a = length a >= 8  && any isUpper a && any isLower a && any isNumber a

--2.18a
mindiv :: Integer -> Integer
mindiv n = mindivFrom 2 n
  where 
    mindivFrom d n 
      | d * d >= n = n 
      | n `mod` d == 0 = d
      | otherwise = mindivFrom (d+1) n
  

--2.18b
mindiv_ :: Integer -> Bool
mindiv_ n = n > 1 &&  mindiv n == n 


--2.24a
merge :: Ord a => [a] -> [a] -> [a]
--merge [] [] = []
merge [] x = x
merge x [] = x
merge (x:xs) (y:ys)
  | x < y = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) (ys)


--2.24b
metades :: [a] -> ([a],[a])
metades [] = ([],[])
metades xs = (take n xs, drop n xs)
    where n = length xs `div` 2
  
msort::Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort(fst (metades xs))) (msort(snd (metades xs)))



