module Euclid where

euclideanAlgorithm :: Int -> Int -> Either String Int
euclideanAlgorithm x y
  | x < y            = Left "The first value must be greater than or equal to the second value"
  | (x `mod` y) == 0 = Right y
  | otherwise        = euclideanAlgorithm y (x `mod` y)
