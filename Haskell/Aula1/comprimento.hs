main :: IO()
main = do
  let lista = [1,2,3,4]
  let comprimento = length lista
  putStrLn ("O comprimento da lista é: " ++ show comprimento)
