module Main where

import Main.Utf8 qualified as Utf8
import NQueens qualified
import NQueens.Pretty qualified as PrettyQueens
import Prettyprinter qualified as Pretty

main :: IO ()
main = Utf8.withUtf8 $ do
  let
    nQueens = 8
    res = NQueens.queens nQueens
    showQueens =
      PrettyQueens.fromSparseMatrix nQueens
        >>> PrettyQueens.sparseMatrixToDoc
  print $ length res
  print $ Pretty.fillSep $ take 1 $ map showQueens res
