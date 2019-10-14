import Data.Monoid
import Control.Monad.Writer

isBigGang :: Int -> (Bool, String)
isBigGang x = (x > 9, "Compared gang size to 9.")

applyLog :: (Monoid m) => (a, m) -> (a -> (b, m)) -> (b, m)
applyLog (x, log) f = let (y, newLog) = f x in
  (y, log `mappend` newLog)

(3, "Smallish gang.") `applyLog` isBigGang
(30, "A freaking platoon") `applyLog` isBigGang

-------------------

type Food = String
type Price = Sum Int

addDrink :: Food -> (Food, Price)
addDrink "beans" = ("milk", Sum 25)
addDrink "jerky" = ("whiskey", Sum 99)
addDrink _ = ("beer", Sum 30)

("beams", Sum 10) `applyLog` addDrink

-------------------

newtype Writer w a = Writer { runWriter :: (a, w) }

instance (Monoid w) => Monad (Writer w) where
  return x = Writer (x mempty)
  (Writer (x, v)) >>= f = let (Writer (y, v')) = f x
                            in Writer (y, v `mappend` v')

-------------------

logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["Got number: " ++ show x])

multiplyWithLog = Writer [String] Int
multiplyWithLog = do
  a <- logNumber 3 -- (3, "Got number: 3")
  b <- logNumber 5 -- (5, "Got number: 5")
  return (a * b)   -- (15, "Got number: 15")

multiplyWithLog' :: Writer [String] Int
multiplyWithLog' = do
  a <- logNumber 3
  b <- logNumber 5
  tell ["Gonna multiply these two"]
  return (a * b)
