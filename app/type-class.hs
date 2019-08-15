-- 型クラスはeqとかordとかを定義するインターフェイスのようなもの

-- Eq型クラス: == と /= を実装する
class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  -- == と /= の関係を定義することで
  -- 一方を定義すれば もう一方も導出されるようにしておく
  -- (minimal compelete definition)
  x == y = not (x /= y)
  x /= y = not (x == y)

data TrafficLight = Red | Yellow | Green

-- TrafficLight型を その実装とともに Eqのインスタンスにする
instance Eq TrafficLight where
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False

-- Showのばあい
instance Show TrafficLight where
  show Red = "Red light"
  show Yellow = "Yellow light"
  show Green = "Green light"

-- 型クラス宣言で型クラス制約を使う（サブクラス）
-- 「aがEqを満たす」=> Num a
-- 「Eqの定義を継承している」とも解釈できそう
class (Eq a) => Num a where
  -- ...

-- インスタンス宣言で型クラス制約を使う
-- 抽象型の振る舞いを定義する場合にべんり
-- 「Maybe<m> の m が Eq のインスタンスである」=> Eq (Maybe m) について...
instance (Eq m) => Eq (Maybe m) where
  Just x == Just y = x == y
  Nothing == Nothing = True
  _ == _ = False

-- :i (:info)で型クラスの実装とそのインスタンスが調べられる
-- λ:i Num
-- class Num a where
--   (+) :: a -> a -> a
--   (-) :: a -> a -> a
--   (*) :: a -> a -> a
--   negate :: a -> a
--   abs :: a -> a
--   signum :: a -> a
--   fromInteger :: Integer -> a
--   {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
--         -- Defined in ‘GHC.Num’
-- instance Num Word -- Defined in ‘GHC.Num’
-- instance Num Integer -- Defined in ‘GHC.Num’
-- instance Num Int -- Defined in ‘GHC.Num’
-- instance Num Float -- Defined in ‘GHC.Float’
-- instance Num Double -- Defined in ‘GHC.Float’
