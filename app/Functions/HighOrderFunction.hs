module Functions.HighOrderFunction where

-- ts: applyTwice<A>(x: (a -> A), y: A): A
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- Haskellがすごいことがよく分かるTypeScriptとの対比:
--
-- const zipWith = <A, B, C>(f: (...args: any[]) => any, [x, ...xs]: A[], [y, ...ys]: B[]): C[] => {
--   if (!(x && xs && y && ys)) {
--     return [];
--   }
--   return [
--     ...f(x, y),
--     ...zipWith(f, xs, ys)
--   ];
-- }
