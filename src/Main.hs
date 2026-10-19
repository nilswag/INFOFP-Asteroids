module Main (main) where
import Graphics.Gloss.Interface.Environment (getScreenSize)
import Graphics.Gloss.Interface.IO.Game

import View 
import Model
import Controller

main :: IO()
main = do 
        (desktopWidth, desktopHeight) <- getScreenSize

        let screenSize@(screenWidth, screenHeight) = (1200, 1200)
        let screenPos = (
                desktopWidth  `div` 2 - screenWidth  `div` 2, 
                desktopHeight `div` 2 - screenHeight `div` 2
                )

        playIO
            (InWindow "Asteroids" screenSize screenPos)
            black
            60
            initialState
            view
            handleInput
            step


initialState :: GameState
initialState = GameState {
    world = initialWorld,
    keyboard = initialKeyboard,

    score = 0
}


initialWorld :: World
initialWorld = World {
    player = Player {
        playerX = 0,
        playerY = 0,
        playerVel = 0.0,
        playerAngle = 0,
        playerLives = 3
    },

    enemy = Enemy {
        enemyX = 0,
        enemyY = 0,
        enemyVel = 0.0,
        enemyAngle = 0,
        enemyLives = 3
    },

    asteroids = []
}

initialKeyboard :: KeyboardState
initialKeyboard = KeyboardState {
    w = False,
    a = False,
    s = False,
    d = False
}