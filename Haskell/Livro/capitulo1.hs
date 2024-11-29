
-- 5a
double :: Num a => a -> a
double x = 2 * x

--5b
nand :: Bool -> Bool -> Bool
nand x y = not (x && y)

--5c
funcX :: Floating a => a -> a -> a -> a -> a
funcX a b c x  = (a * (t ^ 2)) + (b * t) + c
  where{
    t = cos (x) + sin (x)
  }

--6a 
half :: Fractional a => a -> a
half x = x / 2

--6b
xor :: Bool -> Bool -> Bool
xor a b = (a && not (b)) || (not (a) && b)

--6c
cbrt :: Floating a => a -> a
cbrt x = x ** (1 / 3)

--6d
heron :: Floating a => a -> a -> a -> a
heron a b c = sqrt (s * (s-a) * (s-b) * (s-c))
  where{
    s = (a + b + c) / 2
  }


--7a
isTriangular :: (Ord a, Num a) => a -> a -> a -> Bool
isTriangular a b c = (a + b > c) && (c + a > b) && (c + b > a)

--7b
isPythagorean :: (Num a, Eq a) => a -> a -> a -> Bool
isPythagorean a b c = (a^2 + b^2 == c^2) || (a^2 + c^2 == b^2) || (c^2 + b^2 == a^2)


--8
---if-then-else format
five1 :: (Eq a, Num a) => a -> [Char]
five1 a = if (a == 5) then "five" else "not_five"


---guards
five2 :: (Eq a, Num a) => a -> [Char]
five2 x
  | x == 5 = "five"
  | otherwise = "not_five"


--pattern matching
five3 :: (Eq a, Num a) => a -> [Char]
five3 5 = "five"
five3 _ = "not_five"


--9 -> Guards
min3_1 :: Ord a => a -> a -> a -> a
min3_1 a b c
  | ((b > c) && (c > a)) = a
  | ((a > c) && (c > b)) = b
  | otherwise = c

--9 -> If Then Else
min3_2 :: Ord a => a -> a -> a -> a
min3_2 a b c = if (a > b) && (b < c)
              then b
              else
                if(b > c)
                  then c
                  else a

--10
testPh :: (Ord a, Floating a) => a -> [Char]
testPh ah 
  | a < 7 = "acid"
  | a == 7 = "neutral"
  | otherwise = "basic"
  where a = -logBase 10 ah

--11
max3 :: Ord a => a -> a -> a -> a
max3 a b c = if (a > b) && (b > c) then a
                else 
                if(c > a) then c
                else b

--12        
testBMI :: (Ord a, Fractional a) => a -> a -> [Char]
testBMI weight height
  |bmi < 18.5 = "underweight"
  |(bmi >= 18.5) && (bmi < 25.0) = "healthy weight"
  |(bmi >= 25.0) && (bmi < 30.0) = "overweight"
  |(bmi >= 30.0) = "obese"
  where bmi = weight / (height^2)

--13
{--f :: (Ord a, Num a, Integral b) => a -> b
f x
| x > 0 = 1
| x < 0 = -1
| x == 0 = 0

A função f recebe um valor numérico e retorna:

1 se o valor for positivo (x > 0),
-1 se o valor for negativo (x < 0),
0 se o valor for zero (x == 0).

Em outras palavras, essa função classifica um número em três categorias: positivo, negativo, ou zero.

--}

--14
factorial1 :: (Ord p, Num p) => p -> p
factorial1 0 = 1
factorial1 n = n * factorial1(n-1)

--14 -> guards
factorial2 :: (Ord p, Num p) => p -> p
factorial2 n  
  |n == 0 = 1
  |n > 0 = n * factorial2(n-1)
  
--15
myGcd :: Integral a => a -> a -> a
myGcd a b = if b == 0 then abs a 
            else
            myGcd b (a `mod` b)


--16
mPower :: (Fractional a, Integral t) => a -> t -> a
mPower m n
  | n == 0 = 1
  | n > 0 = m * mPower m (n-1)
  | otherwise = 1 / (mPower m (-n))


--17
fib :: (Num a, Ord a, Num p) => a -> p
fib n
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fib(n-1) + fib(n-2)

--18
ackermann :: (Num a, Ord a, Num t, Ord t) => a -> t -> t
ackermann m n
  | m == 0 = n + 1
  | (m > 0) && (n == 0) = ackermann (m-1) 1
  | otherwise = ackermann(m-1) (ackermann m (n - 1)) 

--19
pascal :: (Num a, Ord a, Num p) => a -> a -> p
pascal n k
  | k == 1 || k == n = 1
  | otherwise = pascal (n-1)  (k-1) + pascal (n-1) k

--20
isPrime :: Integral t => t -> Bool
isPrime n
  |n == 1 = False
  |n == 2 = True
  |n `mod` 2 == 0 = False
  |otherwise 
  