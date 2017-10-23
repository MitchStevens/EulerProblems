fibs :: [Integer]
fibs = map fst $ iterate fib_tail (0, 1)
  where fib_tail (a, b) = (b, a+b)

main :: IO ()
main = print . sum . filter even . takeWhile (<4000000) $ fibs
