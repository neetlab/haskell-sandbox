-- ファンクター則 1
id <$> Just 123
id <$> [1, 2, 3]
id <$> Right "right"
id <$> Left  "wrong"

-- ファンクター則 2 呼び出し順を影響しない的な
f :: Num x => x -> x
f = (+ 1)
g :: Num x => x -> x
g = (+ 2)

f . g <$> Just 0 == f <$> g <$> Just 0

-- 2引数関数で使うと...
h = (*) <$> Just 2
-- h = Just (2 *)

