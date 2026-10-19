-- Handles state changes
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
step dt state = pure (updatePlayer (\_ -> move newPlayer dt) state) -- update player
    where
        w' = world state
        p = player w'
        keys = keyboard state

        -- calculate turning amount (velocity) and thrust amount (acceleration)
        turn = axis (a keys) (d keys) * turnSpeed * dt
        thrust = axis (w keys) False * accel * dt

        -- apply velocity and turning
        angle' = playerAngle p + turn -- (radians btw)
        (vx, vy) = playerVel p
        newVel = (vx + cos angle' * thrust, vy + sin angle' * thrust)

        -- update player
        newPlayer = p { playerAngle = angle', playerVel = newVel }