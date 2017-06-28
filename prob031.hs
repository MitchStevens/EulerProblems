import Data.List (sort, tails)
import Data.Function.Memoize (memoize2)

coins = [200, 100, 50, 20, 10, 5, 2, 1]

f :: [Int] -> Int -> Int
f _ n	| (n <  0) = 0
			| (n == 0) = 1

f list target = case list of
	[] 	 -> 0
	x:[] -> if (target `mod` x == 0) then 1 else 0
	x:xs -> sum $ zipWith memo_f (tails list) (fmap (target-) list)

memo_f = memoize2 f

main :: IO ()
main = print $ f coins 200
