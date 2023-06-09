module Main where

import Control.Monad.Logic (observeMany)
import Main.Utf8 qualified as Utf8
import Prettyprinter qualified as Pretty

import NQueens.BacktrackingSearch qualified as BacktrackingSearch
import NQueens.Pretty (prettySolution)

main :: IO ()
main = Utf8.withUtf8 $ do
  print $
    Pretty.fillSep . observeMany 1 $
      prettySolution <$> BacktrackingSearch.solve
  where
    ?dimension = 8
