{-
Numはモノイドにできるけど、(+)と(*)の複数の実装があるので
どちらにすればいいのかわからない。一つの型クラスに同型で複数の実装ができないため
-}

-- Solution: newtype

-- ...at Data.Monoid
newtype Product a = Product { getProduct :: a }
  deriving (Eq, Ord, Read, Show, Bounded)

newtype Sum a = Sum { getProduct :: a }
  deriving (Eq, Ord, Read, Show, Bounded)

-- Then...
instance Num a => Monoid (Product a) where
  mempty = Product 1
  Product x = x `mappend` Product y = Product (x * y)

{-
λ getProduct $ Product 3 `mappend` Product 4 `mappend` Product 2
24
λ getSum $ Sum 3 `mappend` Sum 4 `mappend` Sum 2
9
-}
