//Week1: Generate Idea and Pseudocode
/* Idea
[Moving sand picture]
Create a moving sand picture in simulated water. Then sand flows down the 
gaps between the air bubbles to create the mountains, valleys and dunes. 
Flip over the sand picture using key "UP" and "DOWN".

*/

/* Parts
Part 1. Create a sand picture. 
Part 2. Sands fall down to create different mountains, valleys and dunes.
Part 3. Sands flow down the gap between the bubbles in simulated water.
Part 4. Bubbles will always display in the bottom edge of the upper sand picture.
Part 5. Flip over the sand picture using key "UP" and "DOWN".
Part 6. Clean the display window and restart.

Extra(do this if time is enough)
Part 6. Add fantasy background.
Part 7. Puncture the bubbles with the mouse.
Part 8. Create chaotic and random flows when mouse moves.
Part 9. Add objects in simulated water to change the motion of sands.

*/

/* Algorithm Pseudocode
Part1 Pseudocode:
1. Use pixels to create five kinds of particles with different color, shape, 
density(weight), and size.
2. Create arrays of different particles
3. Display them randomly to create a sand picture


Part2 Pseudocode:
1. Use pixels to create sands.
2. Sand falls under the influence of gravity and resistance from water.
3. Sands won't mixed.
4. When sand hits the boundary of the display window, it will bounce and finally
stay in the bottom under the influence of friction.
5. When sand hits other sands, it will bounce and finally stay in the edge of 
dunes under the influence of friction.
(!!!I don't know if it works)


Part3 Pseudocode:
1. Use pixels to create sands.
2. Use ellipse() and array to create a bunch of air bubbles. 
3. Display a row of bubbles with gaps in the display window.
4. When sands hit the bubbles, fall along the edge of bubbles and gaps between bubbles.


Part4 Pseudocode:
1. Display sand picture which occupies half of the whole window.
2. Use ellipse() and array to create a bunch of air bubbles. 
3. Display a row of bubbles with gaps under the bottom edge of the sand picture.
4. When the height of sand picture reduces, the bubble will always fit snugly 
against the bottom edge of the picture.


Part5 Pseudocode:
1. Display sand picture which occupies half of the whole window.
2. Flip over the sand picture.


Part6 Pseudocode:
1. Erase all of things displayed in the window
2. Restart drawing the sand picture
*/


//Week2: Algorithm Code & Objects
/* Algorithm Code
Implement that algorithm with code


*/

/* Objects
Take the data and functionality associated with that algorithm and 
build it into a class


*/

//Week3: Integration
