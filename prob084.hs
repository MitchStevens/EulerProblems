import Control.Applicative
import Numeric.Probability.Distribution

data Square = GO   | A1 | CC1 | A2  | T1 | R1 | B1  | CH1 | B2 | B3 |
              JAIL | C1 | U1  | C2  | C3 | R2 | D1  | CC2 | D2 | D3 |
              FP   | E1 | CH2 | E2  | E3 | R3 | F1  | F2  | U2 | F3 |
              G2J  | G1 | G2  | CC3 | G3 | R4 | CH3 | H1  | T2 | H2
              deriving (Eq, Ord, Enum, Show)

type Roll = (Int, Int)
type Die = T Float Roll
die26 :: Die
die26 = uniform [(a, b) | a <- [1..6], b <- [1..6]]

next :: Int -> Square -> Square
next n s = toEnum $ mod ((fromEnum s) + n) 40

next_tuple :: (Int, Int) -> Square -> Square
next_tuple

back :: Int -> Square -> Square
back n s = toEnum $ mod ((fromEnum s) - n) 40

prob :: Die -> (Square, Square) -> Float
prob = prob_rec 0

prob_rec :: Int -> Die -> (Square, Sqaure) -> Float
prob_rec =
  dubs


move_dist :: Die -> Int -> Square -> T Float Square
move_dist

move_dist s = case s of
  CC1 -> community_chest
  CC2 -> community_chest
  CC3 -> community_chest
  CH1 -> chance
  CH2 -> chance
  CH3 -> chance
  G2J -> certainly JAIL
  _   -> certainly s
  where
    community_chest = cons [(GO, p), (JAIL, p), (s, 14/16)]
    chance = cons [(GO, p), (JAIL, p), (C1, p), (E3, p), (H2, p), (R1, p),
                         (next_railway s, 2*p), (next_utility s, p),
                        (back 3 s, p), (s, 1/4)]
    p = 1/16

is_double :: (Int, Int) -> Bool
is_double = uncurry (==)

next_railway :: Square -> Square
next_railway square
  | square <= R1 = R1
  | square <= R2 = R2
  | square <= R3 = R3
  | square <= R4 = R4
  | otherwise    = R1

next_utility :: Square -> Square
next_utility square
  | square <= U1 = U1
  | square <= U2 = U2
  | otherwise    = U1












--
