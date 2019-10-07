{-
newtype: 既存の型を使って新しい型を作る時に使う。
dataでも同じことができるけど、newtypeは最適化が加わる。
-}
newtype ZipList a = { getZipList :: [a] }

-- さらに、newtypeはフィールドを1つしか持てない制約がある
newtype User = User Name Gender -- ERROR
data User = User Name Gender    -- Works fine

{-
Dataで宣言した型は引き数が評価されてしまう
-}
data CoolBool = { getCoolBool :: Bool }
-- CoolBool undefined -> Error

newtype CoolBool' = { getCoolBool :: Bool }
-- CoolBool undefined -> Works

{- 全く別の型として認識される -}
newtype CoolString = CoolString String
  deriving (Show)

{- [Char] と CoolString は ++ できない -}
(CoolString "foo") ++ "foo" -- errors
