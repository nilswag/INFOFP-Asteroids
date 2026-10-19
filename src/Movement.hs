-- Defines moveable and turnable instances
module Movement where
import Model

class Moveable a where
    move :: a -> Float -> a

instance Moveable Player where
    move p@Player
        {
            playerX = x,
            playerY = y,
            playerVel = vel,
            playerAngle = angle
        } dt = p { playerX = x + cos angle * vel * dt, playerY = y + sin angle * vel * dt }
    