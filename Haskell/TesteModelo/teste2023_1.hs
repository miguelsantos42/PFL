import Distribution.Simple.Program.Builtin (haskellSuiteProgram)
type Species = (String, Int)
type Zoo = [Species]

species :: Zoo
species = [("Tiger", 100), ("Lion", 200), ("Bear", 50), ("Elephant", 150), ("Giraffe", 80)]

--1
isEndangered :: Species -> Bool
isEndangered (_, 0) = True
isEndangered (e, n)
  | n <= 100 = True
  | otherwise = False

--2
updateSpecies :: Species -> Int -> Species
updateSpecies (e,n) d = (e,n+d)

--3
filterSpecies :: Zoo -> (Species -> Bool) -> Zoo
filterSpecies [] _ = []
filterSpecies (x:xs) f
 | f x = x : filterSpecies xs f
 |  otherwise = filterSpecies xs f

--4
countAnimals :: Zoo -> Int
countAnimals [] = 0
countAnimals xs = sum(map snd xs)

--5
substring :: (Integral a) => String -> a -> a -> String
substring xs i e = [x | (x,y) <- zip xs [0..], y >= i && y <= e]

--6
hasSubstr :: String -> String -> Bool
hasSubstr [] _ = False
hasSubstr (x:xs) (y:ys)
 | x == y = if substring (x:xs) 0 (length (y:ys) - 1) == (y:ys) then True else hasSubstr xs (y:ys)
 | otherwise = hasSubstr xs (y:ys)

--7
sortSpeciesWithSubstr :: Zoo -> String -> (Zoo, Zoo)
sortSpeciesWithSubstr xs w = ([x | x <- xs, hasSubstr (fst x) w],[x | x <- xs, not(hasSubstr (fst x) w)])


--6
hasSubstr1 :: String -> String -> Bool
hasSubstr1 [] _ = False
hasSubstr1 (x:xs) (y:ys)
  |  x == y = if substring (x:xs) 0 (length (y:ys) - 1) == (y:ys) then True else hasSubstr1 xs (y:ys)
  | otherwise = hasSubstr xs (y:ys)

--7
sortSpeciesWithSubstr1 :: Zoo -> String -> (Zoo, Zoo)
sortSpeciesWithSubstr1 xs w = ([x | x <- xs, hasSubstr (fst x) w],[x | x <- xs, not(hasSubstr (fst x) w)])