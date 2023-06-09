module NQueens.Utils where

{- | Given a linear index into an nxn square board, return the row and column
 all indices are 0-based

The inverse of 'positionToIndex'
-}
indexToPosition :: Int -> Int -> (Int, Int)
indexToPosition dim pos = (pos `div` dim, pos `mod` dim)

{- | Given a row and column on an nxn square board, return the position's linear index
 all indices are 0-based

The inverse of 'indexToPosition'
-}
positionToIndex :: Int -> (Int, Int) -> Int
positionToIndex dim (row, col) = row * dim + col
