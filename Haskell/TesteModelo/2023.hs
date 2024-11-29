type Species = (String, Int)
type Zoo = [Species]

species :: Zoo
species = [("Tiger", 100), ("Lion", 200), ("Bear", 50), ("Elephant", 150), ("Giraffe", 80)]

--1
isEndangered :: Species -> Bool
isEndangered (_,0) = True
isEndangered (s,n)
  | n <= 100 = True
  | otherwise = False

--2
updateSpecies :: Species -> Int -> Species
updateSpecies (s,n) m = (s,n+m)

--3
filterSpecies :: Zoo -> (Species -> Bool) -> Zoo
filterSpecies [] _ = []
filterSpecies (x:xs) f  
  | f x = x : filterSpecies xs f
  | otherwise = filterSpecies xs f

--4
countAnimals :: Zoo -> Int
countAnimals lista = sum(map snd lista)

-- countAnimals :: Zoo -> Int
-- countAnimals zoo = foldl (\acc (a, c) -> acc + c) 0 zoo

--5
substring :: (Integral a) => String -> a -> a -> String
substring xs a n = [x | (x,m) <- zip xs [0..], m >= a && m <= n]

--6
hasSubstr :: String -> String -> Bool
hasSubstr [] ys = False
hasSubstr (x:xs) (y:ys)
  | x == y = if substring (x:xs) 0 (length(y:ys) - 1) == (y:ys) then True else hasSubstr xs (y:ys)
  | otherwise = hasSubstr xs (y:ys)

-- "caco amigo" - (x:xs) - (a:cacaco bvana)
-- "caco" - (y:ys)

--7
sortSpeciesWithSubstr :: Zoo -> String -> (Zoo, Zoo)
sortSpeciesWithSubstr xs w = ([x | x <- xs, hasSubstr (fst x) w], [x | x <- xs, not(hasSubstr (fst x) w)])

--8
rabbits :: (Integral a) => [a] 
rabbits = 2 : 3 : [x + y | (x,y) <- zip (rabbits) (tail rabbits)]
                                          
--9
rabbitYears :: (Integral a) => a -> Int
rabbitYears n = rabbitYearsHelper rabbits 0 n

rabbitYearsHelper :: (Integral a) => [a] -> Int -> a -> Int
rabbitYearsHelper a b c
  | a !! b >= c = b
  | otherwise = rabbitYearsHelper a (b+1) c

--10

data Dendrogram = Leaf String | Node Dendrogram Int Dendrogram deriving (Show)

myDendro :: Dendrogram
myDendro = Node (Node (Leaf "dog") 3 (Leaf "cat")) 5 (Leaf "octopus")

dendroWidth :: Dendrogram -> Int
dendroWidth  (Leaf _) = 0
dendroWidth (Node esq a dir) = dendroleft(esq) + dendroright(dir) + 2 * a

dendroleft :: Dendrogram -> Int
dendroleft (Leaf _) = 0
dendroleft (Node esq a _) = dendroleft(esq) + a

dendroright :: Dendrogram -> Int
dendroright (Leaf _) = 0
dendroright (Node _ a dir) = dendroright(dir) + a

--11
dendroInBounds :: Dendrogram -> Int -> [String]
dendroInBounds (Node esq a dir) n = dendroLeft esq a n ++ dendroRight dir a n 

-- left
-- recursivamente explorar arvore esquerda
-- se chegares a uma leaf, ver se a width da leaf > maxw
-- recursivamente iterar para arvore esquerda (w+v) e direita (w-v)
dendroLeft :: Dendrogram -> Int -> Int -> [String]
dendroLeft (Leaf s) curr_width max_width
  | curr_width > max_width = []
  | otherwise = [s]
dendroLeft (Node esq value dir) curr_width max_width = dendroLeft esq (curr_width + value) max_width ++ dendroLeft dir (curr_width - value) max_width

-- right
dendroRight :: Dendrogram -> Int -> Int -> [String]
dendroRight (Leaf s) curr_width max_width
  | curr_width > max_width = []
  | otherwise = [s]
dendroRight (Node esq value dir) curr_width max_width = dendroRight esq (curr_width - value) max_width ++ dendroRight dir (curr_width + value) max_width