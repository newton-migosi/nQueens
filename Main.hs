module Main where

import Main.Utf8 qualified as Utf8
import Prettyprinter qualified as Pretty

import NQueens.NaiveList qualified as NaiveList
import NQueens.Pretty qualified as PrettyQueens

main :: IO ()
main = Utf8.withUtf8 $ do
  let
    nQueens = 8
    res = NaiveList.queens nQueens
    showQueens =
      PrettyQueens.fromSparseMatrix nQueens
        >>> PrettyQueens.sparseMatrixToDoc
  print $ length res
  print $ Pretty.fillSep $ take 1 $ map showQueens res
