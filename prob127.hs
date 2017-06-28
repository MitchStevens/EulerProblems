import Data.List (nub)
import Data.Numbers.Primes (primeFactors)

rad :: Int -> Int
rad = product . nub . primeFactors

generate_abc_hits :: Int -> (Int, Int, Int)

abc_hit :: (Int, Int, Int) -> Bool
abc_hit (a, b, c) = and [
    gcd a b == 1,
    gcd b c == 1,
    gcd c a == 1,
    a < b,
    a + b == c,
    rad (a*b*c) < c
  ]

(gcd a b) * (gcd b c) * (gcd a c) = 1
(lcm a b) * (lcm b c) * (lcm a c) = 2 * a * b * c
