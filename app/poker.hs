data Hand
  = RoyalStraightFlush
  | StraightFlush
  | Straight
  | Flush
  | FullHouse
  | FiveOfAKind
  | FourOfAKind
  | ThreeOfAKind
  | TwoPair
  | OnePair
  | NoPair
  deriving (Eq, Ord, Bounded, Enum)

data Suit
  = Spade
  | Diamond
  | Club
  | Heart
  deriving (Eq, Bounded, Enum)

data Card = Card { suit :: String
                 , rank :: Int
                 } deriving (Eq, Enum)

instance Ord Card where
  a <= b = rank a <= rank b

isRoyalStraightFlush :: [Card] -> Bool
isRoyalStraightFlush cards =
  isStraightFlush cards &
  map (\card rank -> rank card == rank) zip cards [1, 10, 11, 12, 13]

isStraightFlush :: [Card] -> Bool
isStraightFlush cards = isStraight . isFlush cards

isFlush :: [Card] -> Bool
isFlush (x:xs) = all (\card -> suit card == suit x) xs

isStraight :: [Card] -> Bool
isStraight (x:xs) =
  | length xs == 0               = True
  | rank x - rank . head xs == 1 = isStraight xs
  | otherwise                    = False

checkHand :: [Card] -> Hand
checkHand cards =
  | isFlush card    = Flush
  | isStraight card = Straight
  | otherwise       = NoPair
