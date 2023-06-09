module Main where

import Control.Monad.Logic (Logic, observeAll)

import Criterion.Main (Benchmark, bench, bgroup, nf)
import Criterion.Main qualified as Criterion

import NQueens.BacktrackingSearch qualified as BacktrackingSearch

main :: IO ()
main =
  Criterion.defaultMain
    [ bgroup "listMonad" listMonad
    , bgroup "logictMonad" logictMonad
    ]

listMonad :: [Benchmark]
listMonad =
  let solver n =
        let ?dimension = n
         in BacktrackingSearch.solve @[]
   in [ bench "list (n=1, s=1)" $ nf solver 1
      , bench "list (n=3, s=0)" $ nf solver 3
      , bench "list (n=5, s=10)" $ nf solver 5
      , bench "list (n=8, s=92)" $ nf solver 8
      , bench "list (n=10, s=724)" $ nf solver 10
      ]

logictMonad :: [Benchmark]
logictMonad =
  let solver n =
        let ?dimension = n
         in observeAll $ BacktrackingSearch.solve @Logic
   in [ bench "logict (n=1, s=1)" $ nf solver 1
      , bench "logict (n=3, s=0)" $ nf solver 3
      , bench "logict (n=5, s=10)" $ nf solver 5
      , bench "logict (n=8, s=92)" $ nf solver 8
      , bench "logict (n=10, s=724)" $ nf solver 10
      ]
