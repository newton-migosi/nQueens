module Main where

import Control.Monad.Logic (Logic, observeAll)

import Weigh (Weigh, func, wgroup)
import Weigh qualified

import NQueens.BacktrackingSearch qualified as BacktrackingSearch

main :: IO ()
main = Weigh.mainWith $ do
  wgroup "listMonad" listMonad
  wgroup "logictMonad" logictMonad
  pass

listMonad :: Weigh ()
listMonad = do
  let solver n =
        let ?dimension = n
         in BacktrackingSearch.solve @[]
  func "list (n=1, s=1)" solver 1
  func "list (n=3, s=0)" solver 3
  func "list (n=5, s=10)" solver 5
  func "list (n=8, s=92)" solver 8
  func "list (n=10, s=724)" solver 10

logictMonad :: Weigh ()
logictMonad = do
  let solver n =
        let ?dimension = n
         in observeAll $ BacktrackingSearch.solve @Logic
  func "logict (n=1, s=1)" solver 1
  func "logict (n=3, s=0)" solver 3
  func "logict (n=5, s=10)" solver 5
  func "logict (n=8, s=92)" solver 8
  func "logict (n=10, s=724)" solver 10
