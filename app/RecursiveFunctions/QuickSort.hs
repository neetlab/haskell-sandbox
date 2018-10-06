module RecursiveFunctions.QuickSort where

quicksort :: (Ord a) => [a] -> [a] -- 型変数aをOrd型クラスに制約して束縛
quicksort [] = []
quicksort (x:xs) =
  let smallerOrEqual = [a | a <- xs, a <= x]
      larger = [a | a <- xs, a > x]
  in quicksort smallerOrEqual ++ [x] ++ quicksort larger
