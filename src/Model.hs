-- Defines all data types
module Model where
import Graphics.Gloss (Vector)

data GameState = GameState {
    world :: World,
    score :: Int
}

data World = World {
    player :: Ship,
    enemy :: Ship,
    asteroids :: [Asteroid]
}

data Ship = Ship {
    shipX :: Float,
    shipY :: Float,
    shipVel :: Vector,
    shipAngle :: Float,
    shipLives :: Int
}

data Asteroid = Asteroid {
    asteroidX :: Float,
    asteroidY :: Float,
    asteroidVel :: Vector,
    asteroidType :: AsteroidType,
    asteroidLives :: Int
}

data AsteroidType = AsteroidLarge | AsteroidMedium | AsteroidSmall