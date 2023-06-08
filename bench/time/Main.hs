module Bench where

import Criterion.Main (Benchmark)
import Criterion.Main qualified as Criterion

main :: IO ()
main =
  Criterion.defaultMain
    [ Criterion.bgroup "dummy" dummyTest
    ]

dummyTest :: [Benchmark]
dummyTest =
  [ Criterion.bench "integers count 0" $ Criterion.nf count 0
  , Criterion.bench "integers count 1" $ Criterion.nf count 1
  , Criterion.bench "integers count 2" $ Criterion.nf count 2
  , Criterion.bench "integers count 3" $ Criterion.nf count 3
  , Criterion.bench "integers count 10" $ Criterion.nf count 10
  , Criterion.bench "integers count 100" $ Criterion.nf count 100
  ]
  where
    count :: Int -> ()
    count 0 = ()
    count n = count (n - 1)
