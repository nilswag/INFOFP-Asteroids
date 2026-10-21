-- defines all data types
module Model where

import Graphics.Gloss.Data.Vector

-- keyboard state
data KeyboardState = KeyboardState {
    w :: Bool,
    a :: Bool,
    d :: Bool,
    space :: Bool
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
    asteroids :: [Asteroid],
    projectiles :: [Projectile]
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
    deriving (Eq)
data Asteroid = Asteroid {
    asteroidX :: Float,
    asteroidY :: Float,
    asteroidVel :: Vector,
    asteroidAngle :: Float,
    asteroidType :: AsteroidType,
    asteroidLives :: Int
}


-- SETTERS
-- update player field by passing custom function
-- works because records are syntactic sugar for generating functions named as fields
updatePlayer :: (Player -> Player) -> GameState -> GameState
updatePlayer f state =
    state {
        world = (world state) {
            player = f (player (world state))
        }
    }

-- update asteroids field by passing custom function
updateAsteroids :: ([Asteroid] -> [Asteroid]) -> GameState -> GameState
updateAsteroids f state =
    state {
        world = (world state) {
            asteroids = f (asteroids (world state))
        }
    }

updateEnemy :: (Enemy -> Enemy) -> GameState -> GameState
updateEnemy f state =
    state {
        world = (world state) {
            enemy = f (enemy (world state))
        }
    }

updateProjectiles :: ([Projectile] -> [Projectile]) -> GameState -> GameState
updateProjectiles f state =
    state {
        world = (world state) {
            projectiles = f (projectiles (world state))
        }
    }
