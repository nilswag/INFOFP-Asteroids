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


accel :: Float
accel = 50.0

turnSpeed :: Float
turnSpeed = 50.0


step :: Float -> GameState -> IO GameState
step dt state = pure state { world = (world state)
        {
            player = move newPlayer dt
        }
    }

    where
        p = player (world state)
        keys = keyboard state
        
        newPlayer = p {
            playerAngle = 
                (if a keys then turnSpeed * dt else 0) - 
                ((if d keys then turnSpeed * dt else 0))

            , playerVel = playerVel p 
                + (if w keys then accel * dt else 0)
                - (if s keys then accel * dt else 0)
        }