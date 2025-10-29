{-
  A basic calculator for arithmetic expressions
  Based on the example in Chapter 8 of "Programming in Haskell"
  by Graham Hutton.

  Pedro Vasconcelos, 2025
-}
module Main where

import Parsing
import Data.Char

--
-- a data type for expressions
-- made up from integer numbers, + and *
--
data Expr = Num Integer
          | Var Expr
          | Add Expr Expr
          | Mul Expr Expr
          | Sub Expr Expr
          | Div Expr Expr
          | Mod Expr Expr
          deriving Show

type Name = String
type Env = [(Name, Integer)]

data Command = Assign Name Expr
             | Expression Expr
             deriving Show 

-- a recursive evaluator for expressions
-- TODO: ISTO
eval :: Env -> Expr -> Integer
eval env (Num n) = n
eval env (Var v) = searchEnv env v
eval env (Add e1 e2) = eval e1 + eval e2
eval env (Mul e1 e2) = eval e1 * eval e2
eval env (Sub e1 e2) = eval e1 - eval e2
eval env (Div e1 e2) = eval e1 / eval e2
eval env (Mod e1 e2) = eval e1 `mod` eval e2

searchEnv :: Env -> Name -> Integer 
searchEnv [] name = error ("Variável não encontrada: " ++ name)
searchEnv ((n,v) : rest) name 
       | n == name = v
       | otherwise = searchEnv rest name

updateEnv :: Env -> Name -> Integer -> Env
updateEnv [] name val = [(name,val)]
updateEnv ((n,v):rest) name val
       | n == name = (n,val) : rest
       | otherwise = (n,v) : updateEnv rest name val

-- | a parser for expressions
-- Grammar rules:
--
-- expr ::= term exprCont
-- exprCont ::= '+' term exprCont | epsilon

-- term ::= factor termCont
-- termCont ::= '*' factor termCont | epsilon

-- factor ::= variable | natural | '(' expr ')'

-- command ::= variable '=' expr | expr

-- 1 + 2
-- expr -> term exprCont -> term + term ExprCont -> term + term
-- factor termCont + factor termCont
-- natural termCont + natural termCont -> 1 termCont + 2 termCont -> 1 + 2

-- 1 + 2 * 3 = 7p
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
         do n <- variable
            return (Var n)
          <|>
          do char '('
             e <- expr
             char ')'
             return e

command :: Parser Command
command = do v <- variable
             char "="
             e <- expr
             return (Assign v e)
          <|>
          do e <- expr
             return (Expression e) 
             
natural :: Parser Integer
natural = do xs <- many1 (satisfy isDigit)
             return (read xs)

variable :: Parser Name
variable = do xs <- many1 (satisfy isAlpha)
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

-- Env -> String -> (String, Env)
execute :: Env -> String -> (String, Env)
execute env input 
  = case parse command input of 
     [ (cmd, "") ] -> cmdHelper env cmd
     _ -> "parse error; try again"

cmdHelper :: Env -> Command -> (String, Env)
cmdHelper env (Assign name expr) = -- Env -> String -> (String, Env)
       let var = eval env expr
           newEnv = updateEnv name var env
       in (show var, newEnv)
cmdHelper env (Expression expr) = 
       let var = eval env expr
       in (show var, env)