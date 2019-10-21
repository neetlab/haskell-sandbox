import Control.Monad.State

type Stack = [Int]

-- State = 状態 -> 処理結果的な -> ...
newtype State s a = State { runState :: s -> (a, s)}

-- Reducer内のImmutable.JSみたいな
pop :: State Stack Int
pop state $ \(x:xs) -> (x, xs) -- 処理結果x, 状態xs

push :: Int -> State Stack ()
push a state $ \xs -> ((), a:xs)

-- Reducer
manipulateStack = do
  push 3
  pop
  pop


runState manipulateStack [5, 8, 2, 1]

get = state $ \s -> (s, s)
put newState = state $ \s -> ((), newState)
