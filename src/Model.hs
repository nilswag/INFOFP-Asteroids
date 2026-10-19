-- Defines all data types
module Model where

import Graphics.Gloss.Data.Vector

-- keyboard state
data KeyboardState = KeyboardState {
    w :: Bool,
    a :: Bool,
    d :: Bool
}

-- game state
data GameState = GameState {
    world :: World,
    keyboard :: KeyboardState,

    score :: Int
}


-- world state
data World = World {
    player :: Player,
    enemy :: Enemy,
    asteroids :: [Asteroid]
}

-- projectile (e.g. bullets)
data Projectile = Projectile {
    projX :: Float,
    projY :: Float,
    projVel :: Vector,
    projAngle :: Float,
    projTimeAlive :: Float
}

-- enemy (specifically enemy ship)
data Enemy = Enemy {
    enemyX :: Float,
    enemyY :: Float,
    enemyVel :: Vector,
    enemyAngle :: Float,
    enemyLives :: Int
}

-- player (ship)
data Player = Player {
    playerX :: Float,
    playerY :: Float,
    playerVel :: Vector,
    playerAngle :: Float,
    playerLives :: Int
}

-- asteroid and its type
data AsteroidType = AsteroidLarge | AsteroidMedium | AsteroidSmall
data Asteroid = Asteroid {
    asteroidX :: Float,
    asteroidY :: Float,
    asteroidVel :: Vector,
    asteroidAngle :: Float,
    asteroidType :: AsteroidType,
    asteroidLives :: Int
}

-- update player field by passing custom function
-- works because records are syntactic sugar for generating functions named as fields
updatePlayer :: (Player -> Player) -> GameState -> GameState
updatePlayer f state =
    state {
        world = (world state) {
            player = f (player (world state))
        }
    }

-- get plater field by passing a custom function
getPlayerField :: (Player -> a) -> GameState -> a
getPlayerField f = f . player . world