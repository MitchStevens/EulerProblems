import Data.List (sort, tails)
import Data.Function.Memoize (memoize2)

f :: [Integer] -> Integer -> Integer
f _ n	| (n <  0) = 0
			| (n == 0) = 1

f list target = case list of
	[] 	 -> 0
	x:[] -> if (target `mod` x == 0) then 1 else 0
	x:xs -> sum $ zipWith memo_f (tails list) (fmap (target-) list)

memo_f = memoize2 f

main :: IO ()
main = print $ f [1..99] 100
