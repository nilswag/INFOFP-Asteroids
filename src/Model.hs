-- Defines all data types

module Model where
import Graphics.Gloss (Vector)

data GameState = GameState {
        world :: World,
        score :: Int
    }

data World = World {
        player :: Player,
        asteroids :: [Asteroid]
    }

data Player = Player {
        playerX :: Float,
        playerY :: Float,
        playerVel :: Vector,
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