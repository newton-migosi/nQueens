module Spec.NaiveList where

import NQueens.NaiveList qualified as NaiveList
import Test.Hspec (Spec, it, shouldBe)

spec :: Spec
spec = do
  let
    solutions = map (length . NaiveList.queens) [1 .. 10]
  it "should produce expected number of results" $
    solutions `shouldBe` [1, 0, 0, 2, 10, 4, 40, 92, 352, 724]
