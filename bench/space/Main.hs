module Main where

import NQueens.NaiveList qualified as NaiveList
import Weigh (Weigh, func, wgroup)
import Weigh qualified

main :: IO ()
main = Weigh.mainWith $ do
  wgroup "naiveList" naiveList
  pass

naiveList :: Weigh ()
naiveList = do
  func "naive list 1" NaiveList.queens 1
  func "naive list 2" NaiveList.queens 2
  func "naive list 3" NaiveList.queens 3
  func "naive list 4" NaiveList.queens 4
  func "naive list 5" NaiveList.queens 5
  func "naive list 6" NaiveList.queens 6
  func "naive list 7" NaiveList.queens 7
  func "naive list 8" NaiveList.queens 8
  func "naive list 9" NaiveList.queens 9
  func "naive list 10" NaiveList.queens 10
