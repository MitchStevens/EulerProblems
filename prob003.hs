import Data.List (find)

factorize :: Integer -> [Integer]
factorize n = case find (\x -> n`mod`x == 0) (2:[3..(n-1)]) of
  Just x  -> x : factorize (n `div` x)
  Nothing -> [n]

main :: IO ()
main = print (last $ factorize 600851475143)
