
applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x
-- Just 3 `applyMaybe` \x -> Just (x+1)

class Monad m where
  -- pure, memptyみたいなもの
  return :: a -> m a

  (>>=) :: m a -> (a -> m b) -> m b

  -- 必ずyを返す関数...?
  (>>) :: m a -> m b -> m b
  x >> y = x >>= _ -> y

  fail :: String -> m a
  fail msg = error msg

instance Monad Maybe where
  return x = Just x
  Nothing >>= f = Nothing
  Just x >>= f = f x
  fail _ = Nothing

{-
returnは文脈を付けてくれるので、関数にreturnをつければ文脈が推論される
返り値がreturnでラップされてさえいればパターンマッチをしなくても関数適用ができる
-}
Just 9 >>= \x -> return (x + 1)
Nothing >>= \x -> return (x + 1) -- Nothing
