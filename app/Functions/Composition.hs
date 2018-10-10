module Functions.Composition where

-- 関数合成 $(f∘g∘h)(x)$
f = (+ 1)
g = (+ 2)
h = (+ 3)

fgh :: (Int x) => x -> x
fgh x = f . g . h -- fgh x = (+ 3 (+ 2 (+ 1 x)))

-- 右辺いちばん右のmaxの第二引数をポイントフリーにしたい
superCoolFn = ceiling . negate . tan . cos . max 50
