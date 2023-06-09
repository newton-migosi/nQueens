module NQueens.BacktrackingSearch where

import Control.Monad.Logic (Logic)
import Data.Set qualified as Set

import NQueens.Types (Dimension, Position (Position), Solution, safe)

solve ::
  forall (m :: Type -> Type).
  (Monad m, Alternative m, ?dimension :: Dimension) =>
  m Solution
solve = foldlM stepFn Set.empty [1 .. ?dimension]
  where
    stepFn alreadyPlaced row = do
      col <- choose [1 .. ?dimension]
      let queen = Position row col
      guard $ all (safe queen) alreadyPlaced
      pure (Set.insert queen alreadyPlaced)

    choose = asum . fmap pure
    {-# INLINE choose #-}

--------------------------------------------------------------------------------

{-# SPECIALIZE solve :: (?dimension :: Dimension) => [Solution] #-}
{-# SPECIALIZE solve :: (?dimension :: Dimension) => Logic Solution #-}
