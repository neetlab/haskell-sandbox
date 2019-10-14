import Control.Monad

-- 左恒等 (xは値、fはモナド関数)
return x >>= f == f x
-- 例
return "some" >>= (\x -> Just x ++ "thing") == "some" $ (\x -> Just x ++ "thing")

-- 右恒等 (mはモナド値)
m >>= return == m
-- 例
Just "something" >>= return == Just "something"

-- 結合法則
f <=< g $ x == f <=< (g $ x)
-- 2つのモナド関数を合成できる関数 (<=<) がある
(<=<) :: (Monad m) => (b -> m c) -> (a -> m b) -> (b -> m c)
f <=< g = (\x -> g x >>= f)
