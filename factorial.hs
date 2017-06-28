import Data.Function.Memoize (memoize)

fac :: Integer -> Integer
fac 0 = 1
fac 1 = 1
fac n = memo_fac (n-1) + memo_fac (n-2)
memo_fac = memoize fac

main :: IO ()
main = print $ fac 1000
