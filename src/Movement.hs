-- Defines moveable and turnable instances
import Model

class Moveable a where
    move :: a -> Float -> a
    turn :: a -> Float -> Float -> a

instance Moveable Player where
    move p@Player
        {
            playerX = x,
            playerY = y,
            playerVel = vel,
            playerAngle = angle
        } dt = p { playerX = x + cos angle * vel * dt, playerY = y + sin angle * vel * dt }

    turn p@Player { playerAngle = a } da dt
        = p { playerAngle = a + da * dt }