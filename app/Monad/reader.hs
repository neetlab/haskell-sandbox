f = (*5)
g = (+3)

fg  = (f <$> g) 8
-- \x -> g (f x)

fg' = ((+) <$> f <*> g) 3
-- (+ (f 3) (g 3))

instance Monad ((->) r) where
  return x = _ -> x
  h >>= f = \w -> f (h w) w
  -- (h, f) => (w) => f(h(w), w)

main :: Int -> Int
main = do
  a <- (+2)
  b <- (*2)
  return (a + b)
