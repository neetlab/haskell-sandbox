module Map where
import qualified Data.Map as Map

-- 連想リスト
phoneBook =
  [("betty", "555-2930")
  ,("bonnie", "452-2928")
  ,("patsy", "493-2928")
  ,("lucille", "205-2928")
  ,("wendy", "939-8282")
  ,("penny", "85302492")
  ]

-- snd tuple = tuple !! 1
-- head list = array !! 0
findKey :: (Eq k) => k -> [(k, v)] -> v
findKey key = snd . head . filter (\(k, v) -> key == k)
-- JS
-- findKey = (key, xs) => xs.filter(([k, v]) => key === k).[0].[1]

bettyPhoneNumber = findKey "betty" phoneBook
-- > 555-2930


-- Map
phoneBookAsMap = Map.fromList phoneBook
