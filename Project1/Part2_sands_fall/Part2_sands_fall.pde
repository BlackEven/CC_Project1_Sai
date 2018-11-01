
int numSands = 1500;
Sand[] sands = new Sand[numSands];

void setup() {
  //fullScreen();
  size(800, 320);
  for (int i = 0; i < numSands; i++) {
    sands[i] = new Sand (random(width/2 - 20, width/2 + 30), 0, i, sands);
  }
}

void draw() {
  colorMode(RGB,255);
  background(255);

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
}
