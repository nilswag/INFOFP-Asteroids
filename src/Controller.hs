-- Handles state changes
module Controller where
import Model (GameState)
import Graphics.Gloss.Interface.IO.Game

handleInput :: Event -> GameState -> IO GameState
handleInput _ state = pure state

step :: Float -> GameState -> IO GameState
step _ state = pure state
