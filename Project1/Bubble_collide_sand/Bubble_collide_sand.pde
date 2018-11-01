//bubbles
int numBubbles = 100;
Bubble[] bubbles = new Bubble[numBubbles];
int total = 80;

//sands
int numSands = 300;
Sand[] sands = new Sand[numSands];

void setup() {
  //fullScreen();
  size(800, 320);
  //initiate bubbles
  for (int i = 0; i < numBubbles; i++) {
    bubbles[i] = new Bubble (random(width), height, i, bubbles, random(8,20));
  }
  
  //initiate sands
  for (int i = 0; i < numSands; i++) {
    sands[i] = new Sand (random(width/2 - 20, width/2 + 30), 0, i, sands);
  }
}

void draw() {
  colorMode(RGB, 255);
  background(255);
  
  //bubbles
  for (int i = 0; i < total; i++) {
    
    //gravity
    float m =  bubbles[i].mass;
    PVector gravity = new PVector(0, 0.1*m);
    gravity.mult(-1);

    //fluid resistance
    PVector v =  bubbles[i].velocity;
    PVector drag = v.copy();
    //coefficient of friction
    float c = 0.1;
    //magnitude is coefficient * speed squared
    float speed = v.mag();

    float dragMagnitude = c * speed * speed;  
    //direction is inverse of velocity
    drag.mult(-1);
    //scale according to magnityde
    drag.normalize();
    drag.mult(dragMagnitude);

    //Apply force

    bubbles[i].applyForce(gravity);
    bubbles[i].applyForce(drag);

    //update and display
    bubbles[i].update();
    bubbles[i].display();
    bubbles[i].checkEdges();
    bubbles[i].collide();
  }
  
  //sands
  for (Sand s : sands) {
    //gravity
    float m = s.mass;
    PVector gravity = new PVector(0, 0.1*m);

    //fluid resistance
    PVector v = s.velocity;
    PVector drag = v.copy();
    //coefficient of friction
    float c = 0.1;
    //magnitude is coefficient * speed squared
    float speed = v.mag();

    float dragMagnitude = c * speed * speed;  
    //direction is inverse of velocity
    drag.mult(-1);
    //scale according to magnityde
    drag.normalize();
    drag.mult(dragMagnitude);

    //Apply force

    s.applyForce(gravity);
    s.applyForce(drag);

    //update and display
    s.update();
    s.display();
    s.checkEdges();
    s.collide();
  }
  
  interact();
}


void interact() {
  for (Bubble b : bubbles) {
    for (Sand s : sands) {
      float d = dist(b.location.x, b.location.y, s.location.x, s.location.y);
      float minDist = b.r + s.r;
      if (d < b.r + s.r) {
        PVector distanceVect = PVector.sub(s.location, b.location);
        float angle = distanceVect.heading();
        float targetX = b.location.x + cos(angle) * minDist;
        float targetY = b.location.y + sin(angle) * minDist;
        float ax = (targetX - s.location.x) * 0.06;
        float ay = (targetY - s.location.y) * 0.06;
        //b.velocity.x -= ax;
        //b.velocity.y -= ay;
        s.velocity.x += ax;
        s.velocity.y += ay;
        s.crashing = true;
      }
      //else {
      //  s.crashing = false;
      //}
    }
  }
}

void mousePressed() {
  if ( total < numBubbles) {
    total++;
  }
}

void keyPressed() {
  if ( total > 0) {
    total--;
  }
}
