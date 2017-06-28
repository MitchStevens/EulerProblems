import Data.Function.Memoize (memoize2)

f :: Integer -> Integer -> Integer
f 0 _ = 1
f n k = sum $ map (memo_f (n-1)) [k..9]

g :: Integer -> Integer -> Integer
g 0 _ = 1
g n k = sum $ map (memo_g (n-1)) [0..k]

memo_f = memoize2 f
memo_g = memoize2 g

increasing :: Integer -> Integer
increasing n = f n 1

decreasing :: Integer -> Integer
decreasing n = sum $ map (g (n-1)) [1..9]

non_bouncy :: Integer -> Integer
non_bouncy n = increasing n + decreasing n - 9

main :: IO ()
main = print $ sum $ map non_bouncy [1..100]
