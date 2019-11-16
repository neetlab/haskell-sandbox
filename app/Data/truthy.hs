module Truthy where

import BinarySearchTree
import TypeClasses

class Truthy a where
  isTruthy :: a -> Bool

instance Truthy Int where
  isTruthy 0 = False
  isTruthy _ = True

instance Truthy [a] where
  isTruthy [] = False
  isTruthy _ = True

instance Truthy Bool where
  isTruthy = id -- 全く同じ値を返す関数

instance Truthy (Maybe a) where
  isTruthy (Just _) = True
  isTruthy Nothing = False

instance Truthy Tree where
  isTruthy EmptyTree = False
  isTruthy _         = True

instance Truthy TrafficLight where
  isTruthy Red = False
  isTruthy _   = True

ifTruthy :: (Truthy b) => b -> a -> a -> a
ifTruthy fuzzyValue whenTruthy whenFalsy =
  if isTruthy fuzzyValue
    then whenTruthy
    else whenFalsy
