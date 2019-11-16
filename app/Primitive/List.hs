module List where

import Data.List

-- Adding
a = 1 : [2, 3] -- [1, 2, 3]

-- Getting
b = [1, 2, 3] !! 2 -- 3

-- Sorting
c = sort [3, 2, 1] -- [1, 2, 3]

-- Includes
d = 4 `elem` [3, 2, 1] -- False
