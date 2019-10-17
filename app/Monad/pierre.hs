type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
  | abs ((left + n) - right) < 4 = Just (left + n, right)
  | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight  n (left, right)
  | abs (left - (right + n)) < 4 = Just (left, right + n)
  | otherwise                    = Nothing

-- ここでreturnが効くのは遅延評価だからってことですか？？
return (0, 0) >>= (landLeft 4) >>= (landRight 3)

banana :: Pole -> Maybe Pole
banana = (>> Nothing)

return (0, 0) >>= (landLeft 4) >>= banana >>= (landRight 3)

-- IO Monadみたいに do expression も使える
evaluation :: Maybe Pole
evaluation = do
  initial <- return (0, 0) -- returnを必ず付けてモナドにする
  second  <- landLeft 1 inital
  third   <- landRight 2 second
  return third -- モナドしか返しちゃいけないからreturnをつける
