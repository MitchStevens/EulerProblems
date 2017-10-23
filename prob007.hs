not_dividing :: [Int] -> Int -> [Int]
not_dividing list n= case all (\x -> n`mod`x/=0) list of
  True  -> list ++ [n]
  False -> list

primes :: [Int]
primes = 2 : [x | x <- ]

main :: IO ()
main = print $ primes !! 10001
