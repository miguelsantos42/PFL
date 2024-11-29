import Foreign.C (throwErrno)
import Control.Exception (throwIO)

--dobro
dobro x = 2 * x

--quadruplo
quadruplo x = dobro(dobro(x))


--fatorial
factorial n = product [1..n]

--fatorial v2

factorial2 :: Int -> Int
factorial2 0 = 1
factorial2 n = n * factorial2 (n-1)

-- soma de impares
impar :: Int ->Bool
impar x = x `mod` 2 /= 0

somaImpar :: Int -> Int
somaImpar x 
  | impar x = sum(filter impar [1..x])
  | otherwise = 0


--soma dos pares 
par :: Int -> Bool
par x = x `mod` 2 == 0

somaPar :: Int -> Int
somaPar x
  | par x = sum(filter par([1..x]))
  | otherwise = 0

--soma de quadrados
quadrado :: Int -> Int
quadrado 1 = 1
quadrado n = n^2 + quadrado(n-1)
 

--quicksort
quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = quicksort sr1 ++ [x] ++ quicksort sr2
  where
    sr1 = [x1 | x1 <- xs, x1 <= x ]
    sr2 = [x2 | x2 <- xs, x2 > x ]
