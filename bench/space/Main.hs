module Space where

import Weigh (Weigh)
import Weigh qualified

main :: IO ()
main = Weigh.mainWith $ do
  Weigh.wgroup "dummy" dummyTest
  pass

-- TODO: Profile memory usage of library functions
dummyTest :: Weigh ()
dummyTest = do
  Weigh.func "integers count 0" count 0
  Weigh.func "integers count 1" count 1
  Weigh.func "integers count 2" count 2
  Weigh.func "integers count 3" count 3
  Weigh.func "integers count 10" count 10
  Weigh.func "integers count 100" count 100
  where
    count :: Int -> ()
    count 0 = ()
    count n = count (n - 1)
