-- かつて fold関数s に Foldable 型クラス制約が付いていなかったが
-- 今はついている (GHC 8.4.3)
-- import qualified Data.Foldable as F

data Tree a = EmptyTree | Node a (Tree a) (Tree a)
  deriving (Show)

{-
Foldable型クラスの関数であるfoldMap:
foldMap :: (Foldable t, Monoid m) => (a -> m) -> t a -> m
-}

instance Foldable Tree where
  foldMap f EmptyTree = mempty
  -- xはプリミティブ, l, rは再帰的にプリミティブに変換される
  -- から`mappend`で１つのモノイド値に畳み込むことができる
  foldMap f (Node x l r) = foldMap f l `mappend`
                           f x         `mappend`
                           foldMap f r

tree = Node 5
  (Node 3
      (Node 1 EmptyTree EmptyTree)
      (Node 6 EmptyTree EmptyTree)
  )
  (Node 9
      (Node 8 EmptyTree EmptyTree)
      (Node 10 EmptyTree EmptyTree)
  )

foldl (+) 0 tree
foldl (*) 1 tree
getAny $ foldMap (\x -> Any $ x == 3) tree -- True

-- これでリストに変換することもできる
-- ノードを再帰的に 要素が一つの配列にして
-- 配列（which is a monoid）を`mappend`するから
foldMap (\x -> [x]) tree
