module Tuple where

vector = (1, 1)

-- fst <pair> - 1つめを返す
firstElement = fst vector

-- snd <pair> - 2つめを返す
secondElement = snd vector

-- zip <list> <list> - 2つのリストをペアのリストにする
numberAndReading = zip [1, 2, 3, 4, 5] ["one", "two", "tree", "four", "five"]

-- トリプルから
-- ・各辺が整数でかつ10以下
-- ・周囲の長さが24
-- の直角三角形を生み出す
rightTriangle = [(a, b, c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a + b + c == 24]
