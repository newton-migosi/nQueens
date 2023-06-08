module Main where

import Main.Utf8 qualified as Utf8
import Test.Hspec (describe, hspec)

import Spec.NaiveList qualified as NaiveList

main :: IO ()
main = Utf8.withUtf8 $ hspec $ do
  describe "naive list" NaiveList.spec
  pass
