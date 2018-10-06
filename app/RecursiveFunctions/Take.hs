module RecursiveFunctions.Take where

take' :: Int -> [a] -> [a]
take' n _           -- Return an empty array if counter is lesser than or equal to zero
  | n <= 0     = [] -- Using guard without `otherwise` to falling back to next impl
take' _ []     = [] -- Return an empty array if target array is also empty
take' n (x:xs) = x : take' (n - 1) xs -- main imeplementation
