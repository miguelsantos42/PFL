data Arv a = Vazia | No a (Arv a) (Arv a) deriving (Show)

--4.1
sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No a esq dir) = a + sumArv esq + sumArv dir

--4.2
listar :: Arv a -> [a]
listar Vazia = []
listar (No a esq dir) = listar dir ++ [a] ++ listar esq

--4.3
nivel :: Int -> Arv a -> [a]
nivel 0 (No a esq dir) = [a]
nivel n (No a esq dir) = nivel (n-1) esq ++ nivel (n-1) dir

--4.5
mapArv :: (a -> b) -> Arv a -> Arv b
mapArv _ Vazia = Vazia
mapArv f (No a esq dir) = No (f a) (mapArv f esq) (mapArv f dir)

--4.6
--a
mais_dir :: Arv a -> a
mais_dir (No a esq Vazia) = a 
mais_dir (No a esq dir) =  mais_dir dir 

--b 
remover :: Ord a => a -> Arv a -> Arv a
remover _ Vazia = Vazia
remover x (No a Vazia dir) 
   | x == a = dir
   | otherwise = (No a Vazia (remover x dir))
remover x (No a esq Vazia) 
   | x == a = esq
   | otherwise = (No a (remover x esq) Vazia)
remover x (No a esq dir)
  | x > a = (No a esq (remover x dir))
  | x < a = (No a (remover x esq) dir)
  | otherwise = (No z (remover z esq) dir)
      where z = mais_dir esq
      

--4.7
data Expr = Lit Integer |Op Ops Expr Expr
data Ops = Add | Sub | Mul | Div

eval :: Expr -> Integer 
eval (Lit n) = n
eval (Op Add n1 n2) = eval n1 + eval n2
eval (Op Sub n1 n2) = eval n1 - eval n2
eval (Op Mul n1 n2) = eval n1 * eval n2
eval (Op Div n1 n2) = eval n1 `div` eval n2

myshow :: Expr -> String
myshow (Lit n) = show n
myshow (Op Add n1 n2) = "(" ++ myshow n1 ++ " + " ++ myshow n2 ++ ")"
myshow (Op Sub n1 n2) = "(" ++ myshow n1 ++ " - " ++ myshow n2 ++ ")"
myshow (Op Mul n1 n2) = "(" ++ myshow n1 ++ " * " ++ myshow n2 ++ ")"
myshow (Op Div n1 n2) = "(" ++ myshow n1 ++ " / " ++ myshow n2 ++ ")"
