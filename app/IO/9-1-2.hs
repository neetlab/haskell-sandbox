import Data.Char

shortLinesOnly :: String -> String
shortLinesOnly = unlines . filter (\line -> length line < 10) . lines

main = do
  -- fs.promises.readFile / fs.createReadStream
  contents <- getContents -- :: IO String
  putStr (shortLinesOnly contents)

  {-
  or interact :: (String -> String) -> IO ()
  -}
