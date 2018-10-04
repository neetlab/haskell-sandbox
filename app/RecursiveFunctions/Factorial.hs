module RecursiveFunctions.Factorial where

-- 引数の階乗を求める再帰関数
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
