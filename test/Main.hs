module Main where

import Main.Utf8 qualified as Utf8
import Test.Hspec (Spec, describe, hspec, it, shouldBe)

main :: IO ()
main = Utf8.withUtf8 $ hspec $ do
  describe "dummy test" dummySpec
  pass

dummySpec :: Spec
dummySpec = do
  it "integers count 0" $
    count 0 `shouldBe` ()
  where
    count :: Int -> ()
    count 0 = ()
    count n = count (n - 1)
