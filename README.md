# INFOFP Asteroids

## Building and running

    $ git clone https://github.com/nilswag/INFOFP-Asteroids asteroids  
    $ cd asteroids    
    $ cabal run  

### Handige links
[Google docs (voor design document)](https://docs.google.com/document/d/1lJTVHJS7DN4oJKSycekHZ2kn07AqDf3oTPmoXGk2WEE/edit?usp=sharing)

### Minimum requirements
[ ] - Player. The player controls (at least) one character, using the keyboard.  
[ ] - Enemies. The game has antagonistic characters in some sense, which try to make you lose the game. You should implement a minimal “intelligence” for those enemies.  
[ ] - Randomness. The game has to include random components: the place where new enemies appear, the place where bonus are located, and things like that.  
[ ] - Animation. Some events should trigger animations which span several frames. For example, destroying an enemy may create an explosion effect.  
[ ] - Pause. It should be possible for the player to pause the game by pressing a key of your choice.  
[ ] - Interaction with the file system. The program must read and write data in one or more files. You are free to decided what those files contain, a typical example would be a list of high scores.  

### Optional requirements
[ ] - Levels. The game has different screens with different characteristics, and the player can choose a level from a list.  
[ ] - Different enemies. Implement multiple enemy types with different appearances and substantially different behaviors. Introduce harder enemies later in the game.  
[ ] - Custom levels. Develop a file format that players can use to create new levels. Allow loading custom levels through an in-game menu or the command line.  
[ ] - Mouse input. Allow the player to interact with the game using the mouse in addition to the keyboard. Clicking a location should move the player toward it over several frames.  
[ ] - Multi-player. Implement cooperative or antagonistic multiplayer for two players at the same time. Ensure one player's actions do not interfere with the other player's actions.  
[ ] - Networking. Implement multiplayer through network communication. Consider using the Network library.  
[ ] - Complex graphics. Improve the graphics using techniques such as parallax scrolling or loading images from the file system. Focus on implementing the techniques rather than graphical quality.  
[ ] - Automated testing. Design the game to support testing with QuickCheck and use it to verify interesting properties.  
[ ] - JSON game state. Use Aeson to serialize and deserialize the full game state as JSON. Allow saving the state to disk and loading it again.  
