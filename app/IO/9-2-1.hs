import System.IO

main = do
  withFile "baabaa.txt" ReadMode $ \handle -> do -- コールバック関数
    contents <- hGetContents handle
    putStr contents -- 紛れもなく `-> IO r`
