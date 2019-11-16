import qualified Data.Map as Map

data LockerState = Taken | Free
  deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockers :: LockerMap
lockers = Map.fromList
  [(100, (Taken, "AAAAA"))
  ,(101, (Taken, "BBBBB"))
  ,(102, (Taken, "CCCCC"))
  ,(103, (Taken, "DDDDD"))
  ,(104, (Taken, "EEEEE"))
  ,(105, (Taken, "FFFFF"))
  ,(109, (Taken, "ASDAS"))
  ,(110, (Taken, "GRUCX"))
  ]

-- Map.lookup は Maybe<T>
-- lockerLookup :: ロッカー番号 -> ロッカーのMap -> Either<エラー, ロッカーコード>
lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
  case Map.lookup lockerNumber map of
    Just (state, code) ->
      if state /= Taken
        then Right code
        else Left $ "Locker " ++ show lockerNumber ++ " is alredy taken!"
    Nothing -> Left $ "Locker " ++ show lockerNumber ++ "don't exist!"

lockerLookup 109 lockers
-- > Right "ASDAS"

lockerLookup 200 lockers
-- > Left "Locker 200 is alredy taken!"

-- 関数への結合性宣言、演算子の優先順位を示す整数
-- 1~9 で宣言しないときは自動的に9
infixr 5 :-:

-- Empty か [a, [b, [c, Empty]]] みたいな
-- 値コンストラクタは関数だけど、関数と違って記号だけにはできない; コロンで始める
data List a = Empty | a :-: (List a)
        deriving (Show, Read, Eq, Ord)

-- Concat関数。
-- infixについて`:-:`の例だと関数の実装が無いだけで実際はシグネチャとかの前に書く
infixr 5 ^++
(^++) :: List a -> List a -> List a
Empty ^++ ys = ys
-- ↑ 中置だとわかりづらい。 基底部は右結合だからEmptyが先にくる
(x :-: xs) ^++ ys = x :-: (xs ^++ ys)
-- 前置記法
-- ^++ Empty      ys = ys
-- ^++ (x :-: xs) ys = x :-: (xs ^++ ys)

-- 重要!!
-- []とか(x:xs)でパタンマができるのは、
-- [] (0引数) や
-- : (2引数) が組み込みの値コンストラクタだから。上の実装にあるとおり

-- λ:{
-- Prelude| infixr 5 :-:
-- Prelude|
-- Prelude| data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)
-- Prelude|
-- Prelude| :}
-- λlet a = 1 :-: 2 :-: 3 :-: Empty
-- λa
-- 1 :-: (2 :-: (3 :-: Empty))
-- λ:{
-- Prelude| infixr 5 ^++
-- Prelude| (^++) :: List a -> List a -> List a
-- Prelude| Empty ^++ ys = ys
-- Prelude| (x :-: xs) ^++ ys = x :-: (xs ^++ ys)
-- Prelude| :}
-- λlet b = 4 :-: 5 :-: 6 :-: Empty
-- λa ^++ b
-- 1 :-: (2 :-: (3 :-: (4 :-: (5 :-: (6 :-: Empty)))))
