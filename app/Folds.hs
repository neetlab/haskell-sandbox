module Folds where

maximum' :: (Ord num) => [num] -> num
maximum' = foldl1 (\prev curr -> if curr > prev then curr else prev)

-- 1. (λ e [e] -> [e]) なシグネチャの `:` 関数をflipして (λ [e] e -> [e]) にする
-- 2. flipしたやつがアキュームレータのシグネチャと合致するのでそれを渡す
-- 3. 2nd引数にアキュームレータの初期値を渡す (foldl1で代用可)
reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []
