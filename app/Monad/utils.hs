-- liftM: 普通の関数をモナド関数に昇格してくれる
-- <$>と全く同じ
liftM (+3) (Just 8) -- Just 11
liftM (++"bc") (Just "a") -- Just "abc"


-- ap: モナドに入った関数をモナド値に適用できる
-- <*>と全く同じ
ap (Just (+1)) (Just 2) -- Just 3
-- liftA2 <-> liftM2 とかもある


-- join: モナド値に入ったモナド値をflatにしてくれる
join (Just (Just 8)) -- Just 8
join [[1,2,3], [1,2,3]] -- [1,2,3,1,2,3]

runWriter $
  join (writer (writer (1, "we got one")), "we have something")
-- (1, "we got onewe have something")

runState $
  join (state $ \s -> (push 10, 1:2:s)) [0, 0, 0]
-- ((), [10, 1, 2, 0, 0, 0])

-- 実装
join :: (Monad m) => m (m a) -> m a
join mm = do
  m <- mm
  m


-- mapM: モナド値でmapできる
mapM (\x -> Just (x + 1)) [1..10]
-- Just [1,2,3,4,5,6,7,8,9,10]


-- filterM: モナド値でfilterできる関数
runWriter $
  filterM (\x -> writer ((x > 5), [show x ++ " is lesser than 5"]) :: Writer [String] Bool)
  [1..10]

-- do版
filterSmall :: Int -> Writer [String] Bool
filterSmall x
  | x > 5 = do
    tell [show x ++ " is bigger than 5"]
    return True
  | otherwise = do
    tell [show x ++ " is lesser than 5"]
    return False

runWriter $ filterM filterSmall [1..10]


-- foldM: モナド値でfoldできる
addWithLogs :: Int -> Int -> Writer [String] Int
addWithLogs r x = writer (r + x, ["adding " ++ show x ++ " to " ++ show r ++ " then got " ++ r + x])

sumWithLogs :: [Int] -> Writer [String] Int
sumWithLogs xs = foldM addWithLogs 0 xs

mapM_ putStrLn $ snd $ runWriter $ sumWithLogs [1..10]
{-
adding 1 to 0
adding 2 to 1
adding 3 to 3
adding 4 to 6
adding 5 to 10
adding 6 to 15
adding 7 to 21
adding 8 to 28
adding 9 to 36
adding 10 to 45
-}
