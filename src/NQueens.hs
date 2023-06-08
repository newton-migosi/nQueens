module NQueens where

queens :: Int -> [[(Int, Int)]]
queens dim = go 1 []
  where
    go column placed
      | column > dim = pure placed
      | otherwise = do
          row <- [1 .. dim]
          let queen = (row, column)
          guard $ all (safe queen) placed
          go (column + 1) (queen : placed)

--------------------------------------------------------------------------------

safe ::
  forall (a :: Type). (Eq a, Num a) => (a, a) -> (a, a) -> Bool
safe x y = not $ attacking x y
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

--------------------------------------------------------------------------------
