{-
class Functor f => Applicative (f :: * -> *) where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b
-}

pure (+1) <*> Just 3 -- Just 4
Just (+1) <*> Just 3 -- Just 4

-- aを取って、適用するなら
-- コンテキストのfanctorに入れる
f = pure (+1)
f Just 3  -- Just 4
f Right 3 -- Right 4

-- MaybeのApplicativeインスタンス
instance Applicative Maybe where
  -- MaybeがコンテキストならJustに入る
  pure = Just
  -- 左辺がNothingならNothing
  Nothing  <*> _         = Nothing
  -- 左辺がJust f (a -> b) なら fを右辺に適用
  (Just f) <*> something = fmap f something

Just (+1) <*> Just 3  -- Just 4
pure (2:) <*> [] -- Just [2]

f <$> Just 3       -- これを使う方法が無い
f <*> Just 3 <*> g -- applicativeなら `g` で使えばいい


