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

data Enemy = Enemy {
    enemyX :: Float,
    enemyY :: Float,
    enemyVel :: Vector,
    enemyAngle :: Float,
    enemyLives :: Int
}

data Player = Player {
    playerX :: Float,
    playerY :: Float,
    playerVel :: Vector,
    playerAngle :: Float,
    playerLives :: Int
}

data Asteroid = Asteroid {
    asteroidX :: Float,
    asteroidY :: Float,
    asteroidVel :: Vector,
    asteroidType :: AsteroidType,
    asteroidLives :: Int
}

data AsteroidType = AsteroidLarge | AsteroidMedium | AsteroidSmall