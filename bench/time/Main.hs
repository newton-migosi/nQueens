module Main where

import Criterion.Main (Benchmark, bench, nf)
import Criterion.Main qualified as Criterion
import NQueens.BetterList qualified as BetterList
import NQueens.NaiveList qualified as NaiveList

main :: IO ()
main =
  Criterion.defaultMain
    [ Criterion.bgroup "naiveList" naiveList
    , Criterion.bgroup "betterList" betterList
    ]

naiveList :: [Benchmark]
naiveList =
  [ bench "naive list 1" $ nf NaiveList.queens 1
  , bench "naive list 3" $ nf NaiveList.queens 3
  , bench "naive list 5" $ nf NaiveList.queens 5
  , bench "naive list 8" $ nf NaiveList.queens 8
  , bench "naive list 10" $ nf NaiveList.queens 10
  ]

betterList :: [Benchmark]
betterList =
  [ bench "better list 1" $ nf BetterList.queens 1
  , bench "better list 3" $ nf BetterList.queens 3
  , bench "better list 5" $ nf BetterList.queens 5
  , bench "better list 8" $ nf BetterList.queens 8
  , bench "better list 10" $ nf BetterList.queens 10
  ]
