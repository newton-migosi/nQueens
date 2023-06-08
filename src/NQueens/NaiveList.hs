module NQueens.NaiveList where

import NQueens.Types (Position (Position), safe)

type Solution = [Position]

queens :: Int -> [Solution]
queens dim = foldlM go [] [1 .. dim]
  where
    go placed column = do
      row <- [1 .. dim]
      let queen = Position row column
      guard $ all (safe queen) placed
      pure (queen : placed)
