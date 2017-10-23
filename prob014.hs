import Data.Function.Memoize (memoize)
import Data.List (maximumBy)
import Data.Ord (comparing)

collatz :: Int -> Int
collatz n = if even n then n`div`2 else 3*n+1

collatz_len :: Int -> Int
collatz_len a = 1 + if (a==1) then 0 else collatz_memo (collatz a)

collatz_memo = memoize collatz_len

main :: IO ()
main = print $ maximumBy (comparing collatz_len) [1..999999]
