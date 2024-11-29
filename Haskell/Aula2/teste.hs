import Data.Char (toUpper, isLetter)
stringtoUpper :: String -> String
stringtoUpper xs = [toUpper x | x <- xs]

countChar :: String -> Int
countChar xs = length[x | x <-xs , isLetter x]

listingSquares :: [Int] -> [Int]
listingSquares xs = [i^2 | i <- xs]
