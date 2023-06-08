module Spec.BetterList where

import Test.Hspec (Spec, it, shouldBe)

import NQueens.BetterList qualified as BetterList

spec :: Spec
spec = do
  let solutions = map BetterList.queens [1 .. 10]
  it "should produce the expected number of results" $
    map length solutions `shouldBe` [1, 0, 0, 2, 10, 4, 40, 92, 352, 724]
