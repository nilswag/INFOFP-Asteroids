-- Handles displaying game state
module View where
import Model
import Graphics.Gloss
import Graphics.Gloss.Geometry.Angle (radToDeg)

view :: GameState -> IO Picture
view s = pure (renderPlayer s)

square :: Float -> Float -> Color -> Picture
square w h c = color c (rectangleSolid w h)

renderPlayer :: GameState -> Picture
renderPlayer state = translate x y (rotate (negate (radToDeg angle)) body)
        where
            x = getPlayerField playerX state
            y = getPlayerField playerY state
            angle = getPlayerField playerAngle state
            body = pictures [square 64 64 red, translate 32 0 (square 16 8 white)]
