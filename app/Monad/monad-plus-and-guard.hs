-- 内包表記はモナドの糖衣構文
[ x | x <- [1..50], '7' `elem` show x ]

-- MonadPlusモナドとguard関数に変換される
class Monad m => MonadPlus m where
  mzero :: m a
  mplus :: m a -> m a -> m a

-- ListのMonadPlusインスタンス
instance MonadPlus [] where
  mzero = []   -- mempty
  mplus = (++) -- mappend

guard :: (MonadPlus m) => Bool -> m ()
guard True -> return ()
guard False -> mzero

-- 上を使って、これになっている
[1..50] >>= (\x -> guard ('7' `elem` show x) >> return x)

sevensOnly = do
  x <- [1..50]
  -- <-を使わない限り、>>と等価
  guard ('7' `elem` show x)
  return x
