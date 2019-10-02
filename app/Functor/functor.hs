import BinarySearchTree

class Functor f where -- fは引数を1つ取る型コンストラクタ
  -- aを取ってbを返す関数
  -- fを適用できるa
  -- fを適用できるb
  fmap :: (a -> b) -> f a -> f b

-- fmap :: Functor f => (a -> b) -> f a -> f b
-- map ::               (a -> b) -> [a] -> [b]
-- `f` に 型コンストラクタである `[]` が渡されているということ

decorate :: (String a) => a -> a
decorate = (++ " is there")

-- MaybeもFunctor、 aをMaybeに写す (map) イメージ
fmap decorate (Just "Something")
-- > Something is there
fmap decorate Nothing
-- > Nothing

instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node x left right)
    = Node (f x) (fmap f left) (fmap f right)

--           (f x)
--         /       \
-- (fmap f left) (fmap f right)

{-
  Either :: left -> right -> Either left right （型引数が2つ）で
  functorのfはカインドが * -> * （具体型 -> 具体型) じゃないといけないから
  そのままではfunctorにできないため、型を (Either a) にして
  残ったb (right部分) を型引数にする
-}
instance Functor (Either a) where
  fmap f (Right x) = Right (f x)
  fmap f (Left x)  = Left x -- leftなら何もしない

yell = String -> String
yell = (++ " yeah")
-- のとき
(yell <$> Right "right") == Right "right yeah"
-- だけど
(yell <$> Left  "wrong") == Left "wrong"
-- になる。
