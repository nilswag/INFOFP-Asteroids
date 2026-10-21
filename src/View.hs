-- handles displaying game state
module View where

import Model
import Graphics.Gloss
import Graphics.Gloss.Geometry.Angle (radToDeg)

-- image that is rendered each frame
view :: GameState -> IO Picture
view s = pure (renderAll s)

-- helper to render rectangle
square :: Float -> Float -> Color -> Picture
square w h c = color c (rectangleSolid w h)

-- function to render all entities
renderAll :: GameState -> Picture
renderAll s = pictures [renderPlayer s, renderAsteroids s, renderEnemy s, renderProjectiles s]

-- function to render player
renderPlayer :: GameState -> Picture
renderPlayer state = renderEntity x y angle body
        where
            p = player (world state)
            x = playerX p
            y = playerY p
            angle = playerAngle p
            body = pictures [square 64 64 red, translate 32 0 (square 16 8 white)] 
            -- temporary player with direction indicator

-- function to render the asteroids
renderAsteroids :: GameState -> Picture
renderAsteroids s = pictures (map renderAsteroid (asteroids (world s)))
 
-- function to an asteroid
renderAsteroid :: Asteroid -> Picture
renderAsteroid a = renderEntity x y angle body
        where
            x = asteroidX a
            y = asteroidY a
            angle = asteroidAngle a
            size | t == AsteroidLarge = 50
                 | t == AsteroidMedium = 30
                 | otherwise = 10
                where
                    t = asteroidType a
            body = square size size blue

-- function to render enemy
renderEnemy :: GameState -> Picture
renderEnemy state = renderEntity x y angle body
        where
            e = enemy (world state)
            x = enemyX e
            y = enemyY e
            angle = enemyAngle e
            body = pictures [square 55 55 green, translate 28 0 (square 12 6 orange)] 

-- function to render the projectiles
renderProjectiles :: GameState -> Picture
renderProjectiles s = pictures (map renderProjectile (projectiles (world s)))

-- function to render a projectile
renderProjectile :: Projectile -> Picture
renderProjectile p = renderEntity x y angle body
        where
            x = projX p
            y = projY p 
            angle = projAngle p
            body = square 10 6 yellow

-- function for world render of entity
renderEntity :: Float -> Float -> Float -> Picture -> Picture
-- rotate first then translate and turn radians into degrees
renderEntity x y a b =  translate x y (rotate (negate (radToDeg a)) b)