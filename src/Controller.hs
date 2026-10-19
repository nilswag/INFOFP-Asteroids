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

-- handle s input
handleInput (EventKey (Char 's') Down _ _) state = pure state { keyboard = (keyboard state) { s = True } }
handleInput (EventKey (Char 's') Up _ _) state = pure state { keyboard = (keyboard state) { s = False } }

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

axis :: Bool -> Bool -> Float
axis pos neg = fromBool pos - fromBool neg
    where fromBool b = if b then 1 else 0

step :: Float -> GameState -> IO GameState
step dt state = pure state { world = w' { player = move newPlayer dt } }
    where
        w' = world state
        p = player w'
        keys = keyboard state

        turn = axis (a keys) (d keys) * turnSpeed * dt
        thrust = axis (w keys) (s keys) * accel * dt

        angle' = playerAngle p + turn
        (vx, vy) = playerVel p
        newVel = (vx + cos angle' * thrust, vy + sin angle' * thrust)
 
        newPlayer = p { playerAngle = angle', playerVel = newVel }