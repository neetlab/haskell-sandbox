main = interact respondPalindromes

respondPalindromes :: String -> String
respondPalindromes =
  unlines .
  map (\xs -> if isPal xs then "palidrome" else "not a palidromee") .
  lines

isPal :: String -> Bool
isPal xs = xs == reverse xs
