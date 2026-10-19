-- Handles displaying game state
module View where
import Model (GameState)
import Graphics.Gloss (Picture (Blank))

view :: GameState -> IO Picture
view _ = pure Blank