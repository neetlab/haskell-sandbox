-- Maybeもいくつかのmonoidインスタンスがある

-- 1. Monoid a => Maybe aなとき
Nothing `mappend` "hello" == "hello"
Nothing `mappend` [1,2,3] == [1,2,3]
-- *NumはMonoidじゃないから SumかProduct
Nothing `mappend` Just (Sum 1) == Just (Sum 1)

-- 2. Firstでラップするとき
newtype First a = First { getFirst :: Maybe a }
  deriving (Eq, Ord, Read, Show)

getFirst . mconcat . map First $
  [Nothing, Nothing, Just 1,] == Just 1

-- 3. Lastでラップするとき
getFirst . mconcat . map First $
  [Just 1, Just 2, Just 3] == Just 3
