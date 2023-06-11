module NQueens.BacktrackingSearch where

import Data.Set qualified as Set

import Control.Monad.Logic (Logic)
import NQueens.Types (Dimension, Position (Position), Solution, safe)

solve' ::
  forall (m :: Type -> Type).
  (?dimension :: Dimension, MonadPlus m) =>
  StateT Solution m ()
solve' =
  forM_ [1 .. ?dimension] $ \row -> do
    col <- choose [1 .. ?dimension]
    let queen = Position row col
    guardM $ gets $ all (safe queen)
    modify' $ Set.insert queen
  where
    choose = asum . fmap pure
    {-# INLINE choose #-}

solve ::
  forall (m :: Type -> Type).
  (?dimension :: Dimension, MonadPlus m) =>
  m Solution
solve = execStateT solve' Set.empty
--------------------------------------------------------------------------------

{-# SPECIALIZE solve :: (?dimension :: Dimension) => [Solution] #-}
{-# SPECIALIZE solve :: (?dimension :: Dimension) => Logic Solution #-}
