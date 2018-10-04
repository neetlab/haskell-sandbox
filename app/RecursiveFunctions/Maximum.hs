module RecursiveFunctions.Maximum where

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list!"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
-- ↑ バブルソート的に配列の先頭をxにバインドして、Array restをxsに束縛
-- あるいは@all(x:xs)で全体への束縛も可能
-- [x, y, z] は x:y:z:[]の糖衣構文なので
-- JS: maximum = ([ x, ...xs ]) => { ... }
