import Data.Monoid

-- 文字数比較 -> 辞書順比較でorderingを返す関数

lengthCompare :: String -> String -> Ordering
lengthCompare x y = let a = length x `compare` length y
                        b = x `compare` y
                    in if a == EQ then b else a

lengthCompare :: String -> String -> Ordering
lengthCompare x y = (length x `compare` length y) `mappend`
                    (x `compare` y)
