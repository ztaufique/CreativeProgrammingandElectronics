![](/July15/cookiemain.png)
![](/July15/mazeimage.png)

When completing this assignment, I was inspired by the computer games I used to play as a child. More specifically, I drew inspiration from the "Impossible game." I wanted to build an interactive maze with shooting blocks and maze lines that were "dangerous" to touch. 

Rules:
  1. Do not touch anything on the screen that is blue or you will lose the game
  2. Grab the middle cookie to win the game
  3. Use your cursor to guide Cookie Monster through the game.

I found the "class" feature to be most helpful for the moving squares because I only had to code 5 of them. The class feature was something I have not seen before, mostly due to my limited coding experience, but I'm most proud of the animated squares. The animated squares act as obstacles to the Cookie Monster character; if you hit the square, you lose the game, and you must restart. When adjusting the speeds to check for wall collisions, I found that the boxes were moving only for a few spaces, and then moving back quickly. I realized that I had one box too close to the boundaries, which was causing all the boxes to move back only after moving "left" or "right" for a short distance. To remedy this, I changed the position of the boxes and made the boundaries larger. This homework assignment showed me the true value of thoroughly commenting as it was useful to look back at when I was referring back to old code. I used lines to create the maze, along with images for the Cookie Monster and the cookie. Using images was very helpful in that I was able to upload a high quality image rather than trying to draw one using Processing. 

However, I was unable to excecute the "lose" and "win" game states. I spent many hours trying to figure out how to get the code to read "lose" after hitting a certain block, and I was unsuccessful. I attempted to use the "color" objects, but the cursor would simply move through the lines of the maze, ignoring the lose game statements. For a moment I was successful because the "lose" screen was loading, but it was resulting immediately after I pressed "start", not when the character hit a box or a line. If I were to do this again, that is something that I must remedy, and I also want to implement the idea of a timer. For the timer, I'm thinking that I could change the color and use frame rates to slow the color change.

Something that I found interesting during the assignment wass the idea of colors. I did not know that hex colors are somewthat "universal." When searching up color schemes for Cookie Monster, I was amazed when I was able to simply type in the hex color codes to retreive my desired color in Processing. I also had fun working with the fonts and adjusting the placement.
