module Functions.Application where

-- $関数 (application operator) は2引数関数なので 中置 (右結合) で関数適用が出来る
-- f g x = g x

-- ^カッコを省略できる:
-- sum (map sqrt [1..130])
sqrtOfOneToOneHoundredThirteen = sum $ map sqrt [1..130]

-- ($ x)でxを、xを適用する関数として扱えるらしい 嬉しいらしい
doManipulation :: (Floating x) => x -> [x]
doManipulation x = map ($ x) [(4+), (10*), (^2), sqrt]
