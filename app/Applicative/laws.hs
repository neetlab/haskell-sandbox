
main = do
  -- pure f <*> は fmap f xに等しい
  (pure f <*> x) == f <$> x

  -- idで呼び出したら同じ
  (pure id <*> v) == v

  -- 関数合成で<*>の順番を影響しない
  (pure (.) <*> u <*> v <*> w) == u <*> (v <*> w)

  -- 関数適用<*>の順番を影響しない
  (pure f <*> pure x) == pure (f x)

  -- 右辺と左辺のどちらがpureでつくられたものでも
  -- 同じ返り値である（ってことですか？）
  (f <*> pure x) == (pure ($ x) <*> f)



