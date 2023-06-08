module Main where

import Criterion.Main (Benchmark, bench, nf)
import Criterion.Main qualified as Criterion
import NQueens.NaiveList qualified as NaiveList

main :: IO ()
main =
  Criterion.defaultMain
    [ Criterion.bgroup "naiveList" naiveList
    ]

naiveList :: [Benchmark]
naiveList =
  [ bench "naive list 1" $ nf NaiveList.queens 1
  , bench "naive list 3" $ nf NaiveList.queens 3
  , bench "naive list 5" $ nf NaiveList.queens 5
  , bench "naive list 8" $ nf NaiveList.queens 8
  , bench "naive list 10" $ nf NaiveList.queens 10
  ]
