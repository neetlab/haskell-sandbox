module DeclareModule where

-- module <モジュール名> where でファイル内の関数や型をモジュールとして定義可能
-- module <モジュール名> (エクスポートする関数, ...) where でエクスポートする関数や型を制限可能
-- <モジュール名> はファイル名と同じである必要がある

-- import <Hierarchy.Module> <(Function/Name)> [qualified <Module> as name]
import qualified Function (myFunc) as func
