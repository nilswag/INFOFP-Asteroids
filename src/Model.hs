-- Defines all data types
module Model where
import Graphics.Gloss (Vector)

class Moveable a where
    move :: a -> Float -> a

data GameState = GameState {
    world :: World,
    score :: Int
}


data World = World {
    player :: Player,
    enemy :: Enemy,
    asteroids :: [Asteroid]
}


data Projectile = Projectile {
    projX :: Float,
    projY :: Float,
    projVel :: Float,
    projAngle :: Float,
    projTimeAlive :: Float
}

instance Moveable Projectile where
    move = undefined


data Enemy = Enemy {
    enemyX :: Float,
    enemyY :: Float,
    enemyVel :: Vector,
    enemyAngle :: Float,
    enemyLives :: Int
}

instance Moveable Enemy where
    move = undefined


data Player = Player {
    playerX :: Float,
    playerY :: Float,
    playerVel :: Vector,
    playerAngle :: Float,
    playerLives :: Int
}

instance Moveable Player where
    move = undefined


data AsteroidType = AsteroidLarge | AsteroidMedium | AsteroidSmall

data Asteroid = Asteroid {
    asteroidX :: Float,
    asteroidY :: Float,
    asteroidVel :: Vector,
    asteroidType :: AsteroidType,
    asteroidLives :: Int
}

instance Moveable Asteroid where
    move = undefined
