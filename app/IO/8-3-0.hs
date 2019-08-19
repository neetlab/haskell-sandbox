main = do --継続のsugarly syntaxらしい
  putStrLn "hello, what's your name?"
  name <- getLine -- `name <- IO`は `name = await Promise`みたいなものだと思う
  putStrLn ("Hey " ++ name ++ ", you rock!") -- putStrLnもIOモナドだけど、doの最後は束縛できないらしい
