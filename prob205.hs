import Numeric.Probability.Distribution (T, uniform, cons, fromFreqs, expected, variance)
import Control.Monad (replicateM)
import Numeric.Probability.Visualize
import Data.Function.Memoize (memoize3)

{-
  Given `a` dice with `x` sides, how many ways can n be rolled?

-}

c :: Int -> Int -> Int
c n k = if (0 <= k && k <= n)
        then product [(n-k+1)..n] `div` product [1..k]
        else 0

die_roll_prob :: Int -> Int -> Int -> Int
die_roll_prob 0 _ _ = 0
die_roll_prob 1 x n = if (1 <= n && n <= x)then 1 else 0
die_roll_prob a x n = sum (map f [1..(n-1)])
  where
    f k = (memoized_prob a' x k) * (memoized_prob (a - a') x (n - k))
    a' = a `div` 2
    memoized_prob = memoize3 die_roll_prob

plot_normal :: Int -> Plot
plot_normal n = Plot xs ys Red Solid 1 "Ploting a list of binomial coefcients"
  where
    ys = map fromIntegral [0..n]
    xs = map (fromIntegral.c n) [0..n]



type Roll = T Float Float
d :: Int -> Int -> Roll
d a x = fromFreqs (zip (map fromIntegral dice_values) dice_probabilities)
  where
    dice_values = [a..x*a]
    dice_probabilities = map (fromIntegral . die_roll_prob a x) dice_values


pyramidal_pete :: Roll
pyramidal_pete = 9 `d` 4

cubic_colin :: Roll
cubic_colin = 6 `d` 6
