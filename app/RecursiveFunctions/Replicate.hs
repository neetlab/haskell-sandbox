module RecursiveFunctions.Replicate where

replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0    = [] -- 第一引数=ループカウンターがnegativeだったときのためにガードを利用
  | otherwise = x : replicate' (n - 1) x

-- replicate = <T>(times: number, element: T): T[] => {
--   if (times <= 0) {
--     return []
--   }
--   return replicate(times - 1, element);
-- }
