-- defines moveable and turnable instances
module Movement where

import Model

-- typeclass for movable types 
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

-- moves enemy based on x and y velocity
instance Moveable Enemy where
    move e@Enemy
        {
            enemyX = x,
            enemyY = y,
            enemyVel = (vx, vy)
        } dt = e { enemyX = x + vx * dt, enemyY = y + vy * dt }

-- moves projectile based on x and y velocity
instance Moveable Projectile where
    move p@Projectile
        {
            projX = x,
            projY = y,
            projVel = (vx, vy)
        } dt = p { projX = x + vx * dt, projY = y + vy * dt }

-- moves asteroid based on x and y velocity
instance Moveable Asteroid where
    move a@Asteroid
        {
            asteroidX = x,
            asteroidY = y,
            asteroidVel = (vx, vy)
        } dt = a { asteroidX = x + vx * dt, asteroidY = y + vy * dt }