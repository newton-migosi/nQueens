module NQueens.Pretty where

import Prettyprinter (Doc, hsep, vsep)

import NQueens.Types (Position (Position))

newtype SparseMatrix = SparseMatrix {sparseMatrix :: [[Bool]]}

type Solution = [Position]

-- mark an entry to be true if it is in the list of 2d coordinates
fromSparseMatrix :: Int -> Solution -> SparseMatrix
fromSparseMatrix dim xs = SparseMatrix $ do
  row <- [1 .. dim]
  pure $ do
    col <- [1 .. dim]
    pure $ Position row col `elem` xs

sparseMatrixToDoc :: SparseMatrix -> Doc ann
sparseMatrixToDoc (SparseMatrix xs) =
  vsep $ map (hsep . map showChar) xs
  where
    showChar col = if col then "♛" else "."
