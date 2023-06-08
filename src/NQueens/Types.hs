module NQueens.Types where

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