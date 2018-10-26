module Functions.Composition where

-- 関数合成 $(f∘g∘h)(x)$
f = (+ 1)
g = (+ 2)
h = (+ 3)

fgh :: Integer -> Integer
fgh x = f (g (h x))

-- 右辺いちばん右のmaxの第二引数をポイントフリーにしたい
superCoolFn = ceiling . negate . tan . cos . max 50
