
--1
myFst :: (a, b) -> a
myFst (a, _) = a

--2
mySnd :: (a, b) -> b
mySnd (_, a) = a


--3
mySwap :: (b, a) -> (a, b)
mySwap (a, b) = (b, a)

--4a
distance2 :: Floating a => (a, a) -> (a, a) -> a
distance2 (ax,ay) (bx,by) = sqrt((ax-bx)^2 + (ay-by)^2)

--4b
distanceInf :: (Num a, Ord a) => (a, a) -> (a, a) -> a
distanceInf (ax,ay) (bx,by) = max (abs(ax-bx)) (abs(ay-by))

--6a
myHead :: [a] -> a
myHead (a:_) = a

--6b
hasLengthTwo :: [a] -> Bool
hasLengthTwo [_,_] = True
hasLengthTwo _  = False

--7
myLength :: Num b => [a] -> b
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

--8
myMinimum :: Ord a => [a] -> a
myMinimum [x] = x
myMinimum (x:xs) = min x (myMinimum xs)

--10b
---f :: [a] -> (a,[a])

--11a
evaluateLength :: [a] -> String
evaluateLength l
  | len <= 1 = "Short"
  | len <= 3 = "Medium-sized"
  | otherwise = "Long"
  where len = length l

--11b
evaluateLength1 :: [a] -> String
evaluateLength1 [] = "Short"
evaluateLength1 [_] = "Short"
evaluateLength1 [_,_] = "Medium-size"
evaluateLength1 [_,_,_] = "Medium-size"
evaluateLength1 _ = "Long"

--12
--12a
mySum :: Num a => [a] -> a
mySum [] = 0
mySum (x: xs) = x + (mySum xs)


--12b
myProduct :: Num a => [a] -> a
myProduct [] = 1
myProduct (x:xs) = x * (myProduct xs)

--14
scalarProduct :: Num a => [a] -> [a] -> a
scalarProduct [] [] = 0
scalarProduct (x:xs) (y:ys) = x * y + scalarProduct xs ys 

--15
myMaximum :: Ord a => [a] -> a
myMaximum [x] = x
myMaximum (x:xs) 
  | x > maxTail = x
  | otherwise = maxTail
  where maxTail = myMaximum xs

--16
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs)
  | x == a = True
  | otherwise = myElem a xs
