-- Monoidの定義
-- mになれるのは具体型のみ
class Monoid m where
  mempty :: m
  mappend :: m -> m -> m
  mconcat :: [m] -> m
  mconcat = foldr mappend mempty

-- mempty: 演算しても結果が変わらない単位元 (identify)。多層定数って謂うらしい...
-- mappend: m -> m -> mな関数
-- mconcat: [m] -> mな関数。mappendさえ定義すればfoldrしてくれるデフォルト実装がある

-- モノイド則
-- 単位元である保証
mempty `mappend` x == x
-- 交換法則
x `mappend` mempty == x
-- 結合法則
(m `mappend` y) `mappend` z = x `mappend` (y `mappend` z)

-- Listはmonoid (自明)
instance Monoid [a] where
  mempty = []
  mappend = (++)

-- a `mappend` b /= b `mappend` a
"abc" `mappend` "def" == "abcdef"
"def" `mappend` "abc" == "defabc"
