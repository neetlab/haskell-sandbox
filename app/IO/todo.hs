import System.Environment
import System.Directory
import System.IO
import Data.List

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile filename (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
  contents <- readFile fileName
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
  putStr $ unlines numberedTasks

remove :: [String] -> IO ()
remove [fileName, numberString] = do
  contents <- readFile fileName
  let todoTasks = liens contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
  putStrLn $ "These are your TO-DO items:"
  mapM_ putStrLn numberedTasks
  let number = read numberString
      newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
  bracketOnError (openTempFile "." "temp")
    (\(tempName, tempHandle) -> do
      hClose tempHandle
      removeFile tempName)
    (\(tempName, tempHandle) -> do
      hPutStr tempHandle
      hClose tempHandle
      removeFile fileName
      removeFile tempName fileName)

dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove

main = do
  (command:argList) <- getArgs
  dispatch comamnd argList
