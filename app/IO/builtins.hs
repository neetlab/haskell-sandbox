import Control.Monad
import Data.Char

main = do
  putChar 'a'      -- 文字を表示
  putStr "hello"   -- 文字列を表示
  putStrLn "hello" -- 文字列 + \n を表示
  print 1          -- putStrLn . show

  -- when: else return () を省略できる
  input <- getLine
  when (input == "SWORDFISH") $ do
    putStrLn input

  -- sequence: IOアクションを順番にexecute
  -- Promise.all的なやつ
  sequel <- sequence [getLine, getLine, getLine]
  print sequel -- [IO, IO, IO, IO]

  -- mapM = sequence . map
  -- (f, seq) => Promise.all(seq).then(res => res.map(f)) と同じ
  mapM print [1,2,3]

  -- mapM_: mapMだけど返り値を捨てる。 JSの[].forEach vs [].map の関係と同じ
  -- printは -> ()だから[(), (), ()]が返されるけどこれを無視する
  mapM_ print [1,2,3]

  -- forever
  forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map toUpper l

  -- forM = flip . mapM
  colors <- forM [1,2,3,4] $ \a -> do
    putStrLn $ "which color do you associate with the number " ++ show a ++ "?"
    color <- getLine
    return color
  putStrLn "The colors that you associate with 1, 2, 3, 4 are: "
  mapM putStrLn colors
