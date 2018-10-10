module Functions.Reducers where

-- Fold ウィズダム英和辞典
-- 〈紙など〉を折りたたむ(up);
-- …を折り曲げる(over, down, under);
-- …を折り返す(back);
-- 〈翼など〉を閉じる (↔ unfold); 折って…を作る

-- 実装部分の右辺 foldl1 は関数を返すけど、カリー化されてるから
-- 3rd引数 (対象になる配列) を省略していい感じに
maximum' :: (Ord num) => [num] -> num
maximum' = foldl1 (\prev curr -> if curr > prev then curr else prev)

-- 1. (λ e [e] -> [e]) なシグネチャの `:` 関数をflipして (λ [e] e -> [e]) にする
-- 2. flipしたやつがアキュームレータのシグネチャと合致するのでそれを渡す
-- 3. 2nd引数にアキュームレータの初期値を渡す (foldl1で代用可)
reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []

-- scanl/scanr というやつもある、使いどころがイマイチわからないけど
-- Accumulatorで (prev curr -> current : prev) みたいなことをしなくて良くなる
sumWithSteps :: [Int] -> [Int]
sumWithSteps = scanl (+) 0
