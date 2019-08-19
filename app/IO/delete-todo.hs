import System.IO
import System.Directory
import Data.List

main = do
  contents <- readFile "todo.txt"

  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks

  {-
  numberedTasks ~=
  [ "0 - buy coffee"
  , "1 - buy chocolate"
  ]
  -}

  putStrLn "These are your TO-DO items:"
  mapM_ putStrLn numberedTasks

  putStrLn "Which one do you want to delete?"
  numberString <- getLine

  -- [] !! n == [][n]
  let number = read numberString
      newTodoItems = unlines $ delete (todoTasks !! number) todoTasks

  -- openTempFileはtempファイル作成時にいろいろ便利
  -- e.g. ファイル名テンプレート機能, 上書き防止
  (tempName, tempHandle) <- openTempFile "." "temp"

  hPutStr tempHandle newTodoItems
  hClose tempHandle

  removeFile "todo.txt"
  renameFile tempName "todo.txt"
