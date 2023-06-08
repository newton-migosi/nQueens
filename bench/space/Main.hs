module Main where

import NQueens.BetterList qualified as BetterList
import NQueens.NaiveList qualified as NaiveList
import Weigh (Weigh, func, wgroup)
import Weigh qualified

main :: IO ()
main = Weigh.mainWith $ do
  wgroup "naiveList" naiveList
  wgroup "betterList" betterList
  pass

naiveList :: Weigh ()
naiveList = do
  func "naive list 1" NaiveList.queens 1
  func "naive list 3" NaiveList.queens 3
  func "naive list 5" NaiveList.queens 5
  func "naive list 8" NaiveList.queens 8
  func "naive list 10" NaiveList.queens 10

betterList :: Weigh ()
betterList = do
  func "better list 1" BetterList.queens 1
  func "better list 3" BetterList.queens 3
  func "better list 5" BetterList.queens 5
  func "better list 8" BetterList.queens 8
  func "better list 10" BetterList.queens 10
