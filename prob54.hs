import Control.Applicative (liftA2)

data Rank = Two | Three | Four | Five | Six | Seven | Eight |
            Nine | Ten | Jack | Queen | King | Ace deriving Ord
data Suit = Diamonds | Hearts | Spades | Clubs
data Card a = Card a Suit
data Hand = Hand [Card Rank]
data Game = Game (Hand) Hand
data RankedGames = HighCard Card | OnePair Int | TwoPair Int | ThreOfAKind Int

instance Functor Card where
  fmap f (Card r suit) = Card (f r) suit

instance Applicative Card where
  pure x = Card x Diamonds
  Card f _ <*> Card x suit = Card (f x) suit

instance Ord a => Ord (Card a) where
  compare = liftA2 compare

high_card :: Game -> Either Ordering Game
high_card game@(Game (Hand cards1) (Hand cards2)) = case cmp of
  EQ -> Right game
  _  -> Left cmp
    where cmp = compare $ (max cards1) (max cards2)

one_pair :: Game -> Either Ordering Game
one_pair Game
  where has_pair () = impure . (length . (groupBy same_rank) <$>

two_pair :: Game -> Either Ordering Game
two_pait

royal_flush :: Game -> Either Ordering Game
royal_flush (Game hand1 hand2) =

same_rank :: Ord a => Card a -> Card a -> Bool
same_rank = impure . (liftA2 (==))

impure :: Card a -> a
impure (Card v _) = v
