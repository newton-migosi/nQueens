module NQueens.BetterList where

import Data.IntMap.Strict qualified as IntMap

queens :: Int -> [IntMap Int]
queens dim = foldlM go IntMap.empty [1 .. dim]
  where
    go placed col = do
      row <- [1 .. dim]
      guard $ getAll $ safe (row, col) placed
      pure $ IntMap.insert row col placed

--------------------------------------------------------------------------------

safe :: (Int, Int) -> IntMap.IntMap Int -> All
safe (r, c) = IntMap.foldMapWithKey $ \r' c' ->
  All $ not $ attacking (r, c) (r', c')
{-# INLINE safe #-}

attacking :: forall (a :: Type). (Eq a, Num a) => (a, a) -> (a, a) -> Bool
attacking (r, c) (r', c') =
  horizontal (r, c) (r', c')
    || vertical (r, c) (r', c')
    || diagonal (r, c) (r', c') -- here ordering may affect performance
{-# INLINE attacking #-}

diagonal :: forall (a :: Type). (Eq a, Num a) => (a, a) -> (a, a) -> Bool
diagonal (r, c) (r', c') = abs (r - r') == abs (c - c')
{-# INLINE diagonal #-}

vertical ::
  forall (a :: Type) (x :: Type) (y :: Type). Eq a => (x, a) -> (y, a) -> Bool
vertical (_, c) (_, c') = c == c'
{-# INLINE vertical #-}

horizontal ::
  forall (a :: Type) (x :: Type) (y :: Type). Eq a => (a, x) -> (a, y) -> Bool
horizontal (r, _) (r', _) = r == r'
{-# INLINE horizontal #-}