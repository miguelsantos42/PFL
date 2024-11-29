--foldl reverse a list
rev :: [a] -> [a]
rev = foldl(\acc x -> x : acc) []

--foldr reverse a list
rev1 :: [a] -> [a]
rev1 = foldr(\x acc -> acc ++ [x])[]

rev2 :: [a] -> [a]
rev2 = foldr(\x acc -> acc ++ [x])[]

--foldl prefixes
prefixes :: [a] -> [[a]]
prefixes = tail . foldl (\acc x ->  acc ++ [last acc ++ [x]]) [[]] 




























myreverse3 :: [a] -> [a]
myreverse3 = foldl (\acc x -> [x] ++ acc) []
