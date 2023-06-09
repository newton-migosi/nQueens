module Main where

import Main.Utf8 qualified as Utf8
import Test.Hspec (describe, hspec)

import Spec.BacktrackingSearch qualified as BacktrackingSearch

main :: IO ()
main = Utf8.withUtf8 $ hspec $ do
  describe "backtracking search" BacktrackingSearch.spec
  pass
