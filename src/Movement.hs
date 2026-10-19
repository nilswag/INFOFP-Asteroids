-- Defines moveable and turnable instances
module Movement where
import Model

class Moveable a where
    move :: a -> Float -> a

-- moves player based on x and y velocity
instance Moveable Player where
    move p@Player
        {
            playerX = x,
            playerY = y,
            playerVel = (vx, vy)
        } dt = p { playerX = x + vx * dt, playerY = y + vy * dt }
    