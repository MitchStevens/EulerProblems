sum_squares :: (Num a) => [a] -> a
sum_squares = sum . map (^2)

square_sum :: (Num a) => [a] -> a
square_sum = (^2) . sum

main :: IO ()
main = print $ abs(sum_squares[1..100] - square_sum[1..100])
