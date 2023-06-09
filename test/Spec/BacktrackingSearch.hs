module Spec.BacktrackingSearch where

import Control.Monad.Logic (observeAll)
import NQueens.BacktrackingSearch qualified as BacktrackingSearch
import Test.Hspec (Spec, it, shouldBe)

spec :: Spec
spec = do
  let
    solve n = let ?dimension = n in observeAll BacktrackingSearch.solve
    solutionsLengths = map (length . solve) [1 .. 10]
  it "should produce expected number of results" $
    solutionsLengths `shouldBe` [1, 0, 0, 2, 10, 4, 40, 92, 352, 724]
