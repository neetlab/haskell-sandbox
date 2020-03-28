module PlaneVector where

import Data.Angle

-- 平面ベクトル
data Vector a = Vector a a
  deriving (Show, Eq)

-- 2点間の距離の公式
getDistance :: (Num a) => a -> a -> Floating
getDistance x y = sqrt $ x ** 2 + y ** 2

-- ベクトルの大きさ (成分に対して2点間の距離を測るだけ)
getLength :: Vector -> Floating
getLength (Vector x y) = getDistance x y

-- ベクトルの加算
vectorAdd :: Vector -> Vector -> Vector
vectorAdd (Vector x1 y1) (Vector x2 y2) = Vector x1+x2 x2+y2

-- ベクトルの減算
vectorSubtract :: Vector -> Vector -> Vector
vectorSubtract  (Vector x1 y1) (Vector x2 y2) = Vector x1-x2 x2-y2

-- 内積
getInnerProduct :: Vector -> Vector -> Int
getInnerProduct (Vector x1 y1) (Vector x2 y2) = x1**x2 + y1**y2

-- 内積が0 <=> 垂直
isRightAngle :: Vector -> Vector -> Bool
isRightAngle a b = (getInnerProduct a b) == 0

-- なす角
getAngle :: Vector -> Vector -> Radians
getAngle a b = acos $ (getInnerProduct a b) / (getLength a) * (getLength b)
