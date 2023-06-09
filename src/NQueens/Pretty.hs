module NQueens.Pretty where

import Data.Set qualified as Set
import Prettyprinter (Doc, hsep, vsep)

import NQueens.Types (
  Dimension,
  Position (Position),
  Solution,
  mkSquareMatrix,
 )

prettySolution :: (?dimension :: Dimension) => Solution -> Doc ann
prettySolution solution =
  vsep $
    map (hsep . map showChar) $
      mkSquareMatrix ?dimension Position
  where
    showChar :: Position -> Doc ann
    showChar = bool "." "♛" . (`Set.member` solution)
