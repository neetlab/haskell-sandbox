module PlaneVector where

-- 平面ベクトル
data Vector a = Vector a a
  deriving (Show, Eq)

-- 2点間の距離の公式
getDistance :: (Floating a) => a -> a -> a
getDistance x y = sqrt $ (x ** 2) + (y ** 2)

-- ベクトルの大きさ (成分に対して2点間の距離を測るだけ)
getLength :: (Floating a) => Vector a -> a
getLength (Vector x y) = getDistance x y

-- ベクトルの加算
vectorAdd :: (Floating a) => Vector a -> Vector a -> Vector a
vectorAdd (Vector x1 y1) (Vector x2 y2) = Vector (x1+x2) (x2+y2)

-- ベクトルの減算
vectorSubtract :: (Floating a) => Vector a -> Vector a -> Vector a
vectorSubtract  (Vector x1 y1) (Vector x2 y2) = Vector (x1-x2) (x2-y2)

-- 内積
getInnerProduct :: (Floating a) => Vector a -> Vector a -> a
getInnerProduct (Vector x1 y1) (Vector x2 y2) = (x1**x2) + (y1**y2)

-- なす角
getAngle :: (Floating a) => Vector a -> Vector a -> a
getAngle a b = acos $ (getInnerProduct a b) / (getLength a) * (getLength b)
