/*
Part 5. Flip over the sand picture using key "UP" and "DOWN".

Part5 Pseudocode:
1. Display sand picture which occupies half of the whole window.
2. Flip over the sand picture.
*/

Boolean flip = true;
float y = 0;
float speed = 0;
float gravity = 0.1;

void setup() {
  size(640, 360);
  }
  
void draw() {
  background(255);

  stroke(0);
  line(0, height/2, width, height/2);
  
  noStroke();
  fill(125);
  if (flip) {
  ellipse(width/2, y, 8, 8);
  y = y + speed;
  speed += gravity;
  }else {
  ellipse(width/2, height - y, 8, 8);
  y = y + speed;
  speed -= gravity;
  }
  

  if (y > height) {
      speed *= -0.6;
      y = height;
    }else if (y < 0) {
      y = 0;
      speed *= -0.6;
    }
 
}

void keyPressed() {
  flip = !flip;
}
    
