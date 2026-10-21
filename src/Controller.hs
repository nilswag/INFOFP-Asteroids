-- handles state changes
module Controller where

import Graphics.Gloss.Interface.IO.Game
import Model
import Movement


handleInput :: Event -> GameState -> IO GameState
-- handle w input
handleInput (EventKey (Char 'w') Down _ _) state = pure state { keyboard = (keyboard state) { w = True } }
handleInput (EventKey (Char 'w') Up _ _) state = pure state { keyboard = (keyboard state) { w = False } }

-- handle a input
handleInput (EventKey (Char 'a') Down _ _) state = pure state { keyboard = (keyboard state) { a = True } }
handleInput (EventKey (Char 'a') Up _ _) state = pure state { keyboard = (keyboard state) { a = False } }

-- handle d input
handleInput (EventKey (Char 'd') Down _ _) state = pure state { keyboard = (keyboard state) { d = True } }
handleInput (EventKey (Char 'd') Up _ _) state = pure state { keyboard = (keyboard state) { d = False } }

-- handle space input
handleInput (EventKey (Char 'p') Down _ _) state = pure state { keyboard = (keyboard state) { space = True } }
handleInput (EventKey (Char 'p') Up _ _) state = pure state { keyboard = (keyboard state) { space = False } }
-- TODO: what is the char for spacebar???

handleInput _ state = pure state

-- pixels per second per second
accel :: Float
accel = 150.0

-- radians per second
turnSpeed :: Float
turnSpeed = 2.5

-- get normalized axis to use in acceleration/velocity calculations
axis :: Bool -> Bool -> Float
axis pos neg = fromBool pos - fromBool neg
    where fromBool b = if b then 1 else 0

-- physics step in main loop
step :: Float -> GameState -> IO GameState
step dt s = pure (steps s)
    where steps = enemyStep dt . projectilesStep dt . asteroidsStep dt . playerStep dt
        
-- player update
playerStep :: Float -> GameState -> GameState
playerStep dt s = updatePlayer (\_ -> move newPlayer dt) s
    where 
        p = player (world s)
        keys = keyboard s

        -- calculate turning amount (velocity) and thrust amount (acceleration)
        turn = axis (a keys) (d keys) * turnSpeed * dt
        thrust = axis (w keys) False * accel * dt

        -- apply velocity and turning
        angle' = playerAngle p + turn -- (radians btw)
        (vx, vy) = playerVel p
        newVel = (vx + cos angle' * thrust, vy + sin angle' * thrust)

        -- update player
        newPlayer = p { playerAngle = angle', playerVel = newVel }

        --when getting to killing/collision, needs change

-- asteroids update
asteroidsStep :: Float -> GameState -> GameState
asteroidsStep dt s = updateAsteroids (\_ -> newAsteroids) s
    where
         --when getting to killing/collision, needs change
        newAsteroids = map (\a -> move a dt ) (asteroids (world s))

-- projectiles update
projectilesStep :: Float -> GameState -> GameState
projectilesStep dt s = updateProjectiles (\_ -> newProjectiles) s
    where
        -- move existing projectiles
        movedProjectiles = map (\a -> move a dt ) (projectiles (world s))

        -- shoot new projectile if space is pressed        
        addedProjectiles | (space (keyboard s)) == False = []
                         | otherwise = [spawnProjectile]
        
        -- create new projectile at player, shooting in the angle the player is looking with some constant velocity
        spawnProjectile = Projectile{
            projX = playerX p, -- perhaps prettier to not spawn from player, but players "gun"
            projY = playerY p,
            projVel = (cos pa , sin pa), -- TODO: direction of projectile is still very weird
            projAngle = pa,
            projTimeAlive = 4.0
        }
            where 
                p = player (world s)
                pa = playerAngle p
    
        --when getting to killing/collision/timealive/cooldown!, needs change
        newProjectiles = movedProjectiles ++ addedProjectiles


-- enemy update
enemyStep :: Float -> GameState -> GameState
enemyStep dt s = updateEnemy (\_ -> newEnemy) s
    where 
        e = enemy (world s)
        --needs change after defining player-following algorithm + collision/killing
        newEnemy = e
