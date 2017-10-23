data DartShot = Single Int | Double Int | Treble Int | OuterBull | InnerBull

score :: DartShot -> Int
score shot = case score of
  Single n  -> n
  Double n  -> 2*n
  Treble n  -> 3*n
  OuterBull -> 25
  InnerBull -> 50
