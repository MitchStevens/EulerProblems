import Control.Applicative (liftA2)

is_palindrome :: (Eq a) => [a] -> Bool
is_palindrome l = reverse l == l

products :: [Int]
products = liftA2 (*) [100..999] [100..999]

main :: IO ()
main = print . maximum . filter (\n -> is_palindrome (show n)) $ products
