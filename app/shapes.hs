module Shapes
( Point(..)
, Shape(..)
, area
) where

data Point = Point Float Float
  deriving (Show)

data Shape
  = Circle Point Float
  | Rectangle Point Point Float
  deriving (Show)

area :: Shape -> Float
area (Circle _ r) pi * r ^ 2
area (Rectangle (Point x1 y2) (Point x2 y2))
  = (abs $ x2 - x1) * (abs $ y2 - y1)


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
                 } deriving (Eq, Ord, Enum)

responseSpadeOrDiamond :: String -> Either Spade Diamond
responseSpadeOrDiamond x = Right x
responseSpadeOrDiamond x = Left  x

isRoyalStraightFlush :: [Card] -> Bool
isRoyalStraightFlush cards =
   isStraightFlush cards &
   map (\(a:b) -> a == b) zip
    map (\card -> rank card) cards
    [1] ++ [10..13]

isStraightFlush :: [Card] -> Bool
isStraightFlush cards = isStraight . isFlush cards

isFlush :: [Card] -> Bool
isFlush (x:xs) = all (\card -> suit card == suit x) xs

isStraight :: [Card] -> Bool
isStraight (x:xs) =
  | length xs == 0               = True
  | x.rank - rank . head xs == 1 = isStraight xs
  | otherwise                    = False

checkHand :: [Card] -> Hand
checkHand cards =
  | isFlush card    = Flush
  | isStraight card = Straight
  | otherwise       = NoPair
