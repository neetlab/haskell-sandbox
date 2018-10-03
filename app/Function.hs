module Function where

myFunc :: String -> String
myFunc x = "Hello " ++ x

addDoubleNumbers :: Int -> Int -> Int
addDoubleNumbers x y = x + y

-- 関数のオーバーライド (パターンマッチ)
isOne :: Int -> Bool
isOne 1 = True
isOne x = False

-- 引数の階乗を求める再帰関数
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- ガード
convertJapaneseEra :: Int -> String
convertJapaneseEra year
  | year <= 2019 = "???"
  | year <= 1989 = "平成"
  | year <= 1926 = "昭和"
  | year <= 1912 = "大正"
  | year <= 1868 = "明治"
  | otherwise = "すごい昔" -- otherwiseは予約語

-- where句でブロック内の変数を定義
convertChineseZodiacWithGuard :: Int -> String
convertChineseZodiacWithGuard year
  | index == 0 = "申"
  | index == 1 = "酉"
  | index == 2 = "戌"
  | index == 3 = "亥"
  | index == 4 = "子"
  | index == 5 = "丑"
  | index == 6 = "寅"
  | index == 7 = "卯"
  | index == 8 = "辰"
  | index == 9 = "巳"
  | index == 10 = "午"
  | index == 11 = "未"
  | otherwise = "?"
  where index = year `mod` 12;

-- case式
convertChineseZodiacWithCase :: Int -> String
convertChineseZodiacWithCase year = case year `mod` 12 of
    0  -> "申"
    1  -> "酉"
    2  -> "戌"
    3  -> "亥"
    4  -> "子"
    5  -> "丑"
    6  -> "寅"
    7  -> "卯"
    8  -> "辰"
    9  -> "巳"
    10 -> "午"
    11 -> "未"
    _  -> "?"
