import System.Environment
import System.Directory
import System.IO
import Control.Exception
import Data.List

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
  contents <- readFile fileName
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
  putStr $ unlines numberedTasks

remove :: [String] -> IO ()
remove [fileName, numberString] = do
  contents <- readFile fileName
  let todoTasks = lines contents
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
      hPutStr tempHandle newTodoItems
      hClose tempHandle
      removeFile fileName
      renameFile tempName fileName)

handleCommandNotFound :: String -> [String] -> IO ()
handleCommandNotFound commandName _ =
  putStrLn $ "The " ++ commandName ++ "command doesn't exist"

dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
dispatch commandName = handleCommandNotFound commandName

main = do
  (command:argList) <- getArgs
  dispatch command argList
