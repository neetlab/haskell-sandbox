module BinarySearchTree where

-- 二分探索木では、ひとつのノードが2つの子ノードの参照を持つ
-- EmptyTree: 引数なしの値コンストラクタ
-- Node:      自分 -> 子要素 -> 子要素 な値コンストラクタ
data Tree a = EmptyTree | Node a (Tree a) (Tree a)
  deriving (Show)

-- OOPのシングルトンじゃなくて、「単体」って意味
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

-- 追加する関数
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node root left right)
  | x == root = Node x left right                   -- 重複実装はしない
  | x < root  = Node root (treeInsert x left) right -- 常に左は小さい
  | x > root  = Node root left (treeInsert x right) -- 右は大きい

-- elemかどうか関数
treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node root left right)
  | x == root = True
  | x < root  = treeElem x left
  | x > root  = treeElem x right

let nums = [8,6,4,1,7,3,5]
let numTree = foldr treeInsert EmptyTree nums
-- equiv of nums.reduceRight(treeInsert, EmptyTree)
