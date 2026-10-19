-- Handles displaying game state
module View where
import Model
import Graphics.Gloss

view :: GameState -> IO Picture
view s = pure (renderPlayer s)

square :: Float -> Float -> Color -> Picture
square w h c = color c (rectangleSolid w h)

renderSquare :: Float -> Float -> Float -> Float -> Color -> Picture
renderSquare x y w h c = translate x y (square w h c)

renderPlayer :: GameState -> Picture
renderPlayer GameState
    { world = World 
        { player = Player 
            { playerX = x,
              playerY = y
            }
        }
    } = renderSquare x y 64 64 red