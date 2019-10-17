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

--------------------

-- Writerは型コンストラクタが公開されてない、代わりにwriter関数を使う
-- 型注釈が必須
a = writer (1, ["initialized!"]) :: Writer [String] Int

-- 継ぎ足すのにはwriterを意識しないでいい
-- モナドなのでwriterを返せば上手くやってくれる
b = a >>= (\x -> writer (x + 1, ["incremented!!"]))

-- タプルに変換できる関数がある
runWriter b
-- (2, ["initialized!", "incremnted!!"])

-- ログをつなげる
let (_, xs) = runWriter b in foldr (++) "" xs
let (_, xs) = runWriter b in mapM_ putStrLn xs
mapM_ putStrLn $ snd $ runWriter b

foo :: Writer [String] Int
foo = do
  a <- return (1, ["initialized"])     -- <-はMonadから取り出すから, aはInt
  b <- return (a + 1, ["incremented"]) -- Int + Int は可能
  tell ["everything's done"]           -- tellはwriterの2ndのほうに継ぎ足せるやつ
  return b                             -- returnは最小の文脈に入れるから、これまでの結果は保たれる

-- こういう書き方もできる
foo' :: Writer [String] Int
foo' = do
  tell ["initialized"]
  let a = 0
  let b = a + 1
  let c = b + 1
  tell ["added two"]
  let d = c * 3
  tell ["timed 3"]
  tell ["everything's done"]
  return d
