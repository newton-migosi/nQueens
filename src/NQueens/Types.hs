module NQueens.Types where

type Dimension = Int
type SquareMatrix a = [[a]]
type Solution = Set Position

-- | 2D position on a chess board.
data Position = Position
  { row :: !Int
  , column :: !Int
  }
  deriving stock (Eq, Ord, Show, Generic)
  deriving anyclass (NFData)

--------------------------------------------------------------------------------

-- | Check if two queens are safe from each other.
safe :: Position -> Position -> Bool
safe (Position row col) (Position row' col') =
  row /= row' -- horizontal
    && col /= col' -- vertical
    && abs (row - row') /= abs (col - col') -- diagonal
{-# INLINE safe #-}

--------------------------------------------------------------------------------

-- | Create a 2D Square Matrix labeled based on the indices.
mkSquareMatrix :: Dimension -> (Dimension -> Dimension -> a) -> SquareMatrix a
mkSquareMatrix dimension f =
  [1 .. dimension] <&> \row ->
    [1 .. dimension] <&> \col ->
      f row col
{-# INLINE mkSquareMatrix #-}
