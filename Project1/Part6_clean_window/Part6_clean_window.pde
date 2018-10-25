/*
Part 6. Clean the display window and restart.

Part6 Pseudocode:
1. Erase all of things displayed in the window
2. Restart drawing the sand picture
*/

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  
  noStroke();
  fill(125);
  ellipse(width/2, height/2, 8, 8);
  ellipse(60, 200, 16, 16);
  
  if (keyPressed && key == 'r') {
    clear();
    background(255);
  }
}
