{-
  A basic calculator for arithmetic expressions
  Based on the example in Chapter 8 of "Programming in Haskell"
  by Graham Hutton.

  Pedro Vasconcelos, 2025
-}
module Calculator where

import Parsing
import Data.Char

--
-- a data type for expressions
-- made up from integer numbers, + and *
--
data Expr = Num Integer
          | Add Expr Expr
          | Mul Expr Expr
          | Sub Expr Expr
          | Div Expr Expr
          | Mod Expr Expr
          deriving Show

-- a recursive evaluator for expressions
--
eval :: Expr -> Integer
eval (Num n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Mul e1 e2) = eval e1 * eval e2
eval (Sub e1 e2) = eval e1 - eval e2
eval (Div e1 e2) = eval e1 / eval e2
eval (Mod e1 e2) = eval e1 `mod` eval e2

-- | a parser for expressions
-- Grammar rules:
--
-- expr ::= term exprCont
-- exprCont ::= '+' term exprCont | epsilon

-- term ::= factor termCont
-- termCont ::= '*' factor termCont | epsilon

-- factor ::= natural | '(' expr ')'

-- 1 + 2
-- expr -> term exprCont -> term + term ExprCont -> term + term
-- factor termCont + factor termCont
-- natural termCont + natural termCont -> 1 termCont + 2 termCont -> 1 + 2

-- 1 + 2 * 3 = 7
-- expr -> term exprCont -> term + term ExprCont -> term + term
-- factor termCont + factor termCont -> factor termCont + factor * factor termCont
-- natural termCont + natural termCont -> 1 termCont + 2 * 3 termCont -> 1 + 2 * 3

--- Add and Sub
expr :: Parser Expr
expr = do t <- term
          exprCont t

exprCont :: Expr -> Parser Expr
exprCont acc = do char '+'
                  t <- term
                  exprCont (Add acc t)
           <|> do char '-'
                  t <- term
                  exprCont (Sub acc t) 
           <|> return acc

--- Mul / Div / Mod
term :: Parser Expr
term = do f <- factor
          termCont f

termCont :: Expr -> Parser Expr
termCont acc = do char '*'
                  f <- factor  
                  termCont (Mul acc f)
           <|> do char '/'
                  f <- factor
                  termCont (Div acc f) 
           <|> do string "mod"
                  f <- factor
                  termCont (Mod acc f)
           <|> return acc

                

factor :: Parser Expr
factor = do n <- natural
            return (Num n)
          <|>
          do char '('
             e <- expr
             char ')'
             return e
             

natural :: Parser Integer
natural = do xs <- many1 (satisfy isDigit)
             return (read xs)

----------------------------------------------------------------             
  
main :: IO ()
main
  = do txt <- getContents
       calculator (lines txt)

-- | read-eval-print loop
calculator :: [String] -> IO ()
calculator []  = return ()
calculator (l:ls) = do putStrLn (evaluate l)
                       calculator ls  

-- | evaluate a single expression
evaluate :: String -> String
evaluate txt
  = case parse expr txt of
      [ (tree, "") ] ->  show (eval tree)
      _ -> "parse error; try again"  