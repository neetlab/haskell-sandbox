import Control.Monad (guard)
import Data.List (find)

type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c, r) = do
  (c', r') <-
    [ (c+2, r-1)
    , (c+2, r+1)
    , (c-2, r-1)
    , (c-2, r+1)
    , (c+1, r-1)
    , (c+1, r-2)
    , (c-1, r-2)
    , (c-1, r+2)
    ]
  -- boardに載っている?
  guard (c' `elem` [1..8] && r' `elem` [1..8])
  return (c', r')

allPathsIn3 :: KnightPos -> [(KnightPos, KnightPos, KnightPos)]
allPathsIn3 start = do
  -- 3回計算して可能性を全て出す
  first <- moveKnight start
  second <- moveKnight first
  thrid <- moveKnight second
  return (first, second, thrid)

findPathIn3 :: KnightPos -> KnightPos -> Maybe (KnightPos, KnightPos, KnightPos)
findPathIn3 start end = find (\(_, _, third) -> third == end) (allPathsIn3 start)

