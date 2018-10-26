module Functions.Caesar where

import Data.Char

caesar :: Int -> String -> String
caesar shift = map (\c -> chr $ ord c + shift)
