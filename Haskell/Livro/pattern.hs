specialBirthday1 :: Int -> [Char]
specialBirthday1 age = 
  if age == 1
    then "First birthday!"
    else
      if age == 18
        then "You're an adult!"
        else
          if age == 60
            then "Finally, I can stop caring about new lingo!"
            else "Nothing special"

------Pattern Matching using Functions
specialBirthday2 :: Int -> [Char]
specialBirthday2 1 = "First birthday!"
specialBirthday2 18 = "You're an adult!"
specialBirthday2 60 = "finally, Ican stop caring about new lingo"
specialBirthday2 age = "Nothing special, you're just " ++ show age
 

------Patttern Matching using Lists
firstAndThird :: [Bool] -> String
firstAndThird (x:_:z:_) = "The first and third elements are " ++ show x ++ " and " ++ show z
firstAndThird _  = "Don't have them!"

initials :: String -> String -> String
initials (f:_) (l:_) = [f] ++ "." ++ [l] ++ "."
initials _ _ = "How was your name again?"


