import System.IO

{-
data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
-}

main = do
  -- openFile :: FilePath -> IOMode -> IO Handle
  -- FilePath = String
  handle <- openFile "baabaa.txt" ReadMode -- IOMode
  contents <- hGetContents handle          -- "h*" is short of "handle*"
  putStr contents
  hClose handle                            -- a manual closing is required
