-- Handles state changes
module Controller where
import GHC.Event
import Model (GameState)

handleInput :: Event -> GameState -> IO GameState
handleInput = undefined

step :: Float -> GameState -> IO GameState
step = undefined
