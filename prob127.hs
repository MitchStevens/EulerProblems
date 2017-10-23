import Data.Array (Array, listArray, (!), (//))
import Data.List (nub, sort)
import Data.Numbers.Primes (primeFactors)

n = 120000
facs :: Array Int [Int]
facs = listArray (1, n) (map (nub . primeFactors) [1..n])

rad_pred :: (Int, Int, Int) -> Bool
rad_pred (a, b, c) = (product prime_facs) < c
  where prime_facs = facs ! a ++ facs ! b ++ facs ! c

generate_abc_hits :: Int -> [(Int, Int, Int)]
generate_abc_hits c = filter rad_pred $ filter gcd_pred list
  where
    list = [(i, c-i, c) | i <- [1..((c-1) `div` 2)]]
    gcd_pred (a, b, c) = (gcd a b == 1) && (gcd b c == 1) && (gcd c a == 1)

all_coprimes :: Int -> [Int]
all_coprimes n = foldl filter_divs [1..(n-1)] prime_facs
  where
    prime_facs = nub . primeFactors $ n

    filter_divs :: [Int] -> Int -> [Int]
    filter_divs nums m = filter (\x -> x `mod` m /= 0) nums

xor :: Ord a => [a] -> [a] -> [a]
xor x [] = x
xor [] y = y
xor x y = xor_rec (sort x) (sort y)
  where
    xor_rec (x:xs) (y:ys) = case compare x y of
      LT -> x : xor xs (y:ys)
      EQ -> xor xs ys
      GT -> y : xor (x:xs) ys

distinct :: Ord a => [[a]] -> Bool
distinct list = case list of
  [[]] -> True
  v:vs -> (sum $ map length list) == (length $ foldl xor v vs)

f (a, b, c) = c

g :: Int -> Int
g c_max = sum . (map f) . concat . (map generate_abc_hits) $ [1..c_max]

h :: Int -> [(Int, Int, Int)]
h c_max = concat $ map generate_abc_hits [1..c_max]













--
