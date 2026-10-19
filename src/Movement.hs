import Model

class Moveable a where
    move :: a -> Float -> a

class Turnable a where
    turn :: a -> Float -> Float -> a


instance Moveable Player where
    move :: Player -> Float -> Player
    move p@Player
        {
            playerX = x,
            playerY = y,
            playerVel = (vx, vy)
        } dt = p { playerX = x + vx * dt, playerY = y + vy * dt }

instance Turnable Player where
    turn :: Player -> Float -> Float -> Player
    turn p@Player { playerAngle = a } da dt
        = p { playerAngle = a + da * dt }