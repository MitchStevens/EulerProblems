import Control.Applicative (liftA2)

data Frac a = Frac {numer :: a, denom :: a}

instance Show a => Show (Frac a) where
    show (Frac a b) = show a ++"/"++ show b

instance Functor Frac where
    fmap f (Frac a b) = Frac (f a) (f b)

instance Num a => Applicative (Frac a) where
    pure x = Frac x (fromInteger 1)
    Frac f g <*> Frac x y = Frac (f x) (g y)

instance Num a => Num (Frac a) where
    (+) = liftA2 (+)
    (*) = liftA2 (*)
    (-) = liftA2 (-)
    fromInteger n = Frac

get_digit :: Integral a => a -> Int -> a
get_digit n 1 = n `mod` 10
get_digit n 2 = n `div` 10
