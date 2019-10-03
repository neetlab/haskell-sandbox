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

-- Arrayにもつかえるよ
(:) <$> Just 2 <*> Just [] -- Just [2]
filter (>50) $ (*) <$> [2,5,10] <*> [8,10,11]

-- I/O Monad
action :: IO String
action = (++) <$> getLine <*> getLine

pure "foo" :: [String]     -- ["foo"]
pure "foo" :: Maybe String -- Just "foo"
pure "foo"                 -- "foo" (->らしい)

{-
action = pure (++) <*> getLine <*> getLine
action = return (++) <*> getLine <*> getLine
action = do
  a <- getLine
  b <- getLine
  return f a b
-}

{-
Applicativeとして使いづらいからという理由で[]とは別の
zip用途のZipListというのがある。
-}
getZipList $ (+) <$> ZipList [1,2,3] <*> ZipList [100,100,100]
-- [101,102,103]
(+) <$> [1,2,3] <*> [100,100,100]
-- [101,101,101,102,102,102,103,103,103]
