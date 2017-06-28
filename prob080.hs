import Data.Ratio ((%), denominator)
import Data.Number.CReal
import Data.Char (digitToInt, isDigit)

num_iterations = 6

newton_sqrt :: Int -> Rational
newton_sqrt n = (iterate g initial) !! num_iterations
  where
    g x = x - (x^2 - (toRational n))/(2 * x)
    initial = toRational . sqrt . fromIntegral $ n

show_rational :: Rational -> String
show_rational num = showCReal 100 (fromRational num)

digital_sum :: Rational -> Int
digital_sum = sum . (map digitToInt) . (filter isDigit) . (take 101) . show_rational

f :: Int -> Int
f = digital_sum . newton_sqrt
