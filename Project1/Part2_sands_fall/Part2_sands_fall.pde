
int numSands = 2000;
Sand[] sands = new Sand[numSands];
boolean clean = false;

void setup() {
  //fullScreen();
  size(640, 320);
  for (int i = 0; i < numSands; i++) {
    sands[i] = new Sand (random(width/2 - 50, width/2 + 50), 0, i, sands);
  }
}

void draw() {
  colorMode(RGB,255);
  background(255);

  //for (Sand s : sands) {
    for (int i = 0; i < numSands; i++) {

    //gravity
    float m = sands[i].mass;
    PVector gravity = new PVector(0, 0.1*m);

    //fluid resistance
    PVector v = sands[i].velocity;
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

    sands[i].applyForce(gravity);
    sands[i].applyForce(drag);

    //update and display
    sands[i].update();

    sands[i].checkEdges();
    sands[i].collide();
    sands[i].display();
    
    if (clean) {
    clear();
    background(255);
    sands[i].location.y = random(mouseY - 100, mouseY + 100);
      sands[i].location.x = random(mouseX - 100, mouseX + 100);
  }
  }
 
}

void keyPressed() {
  if (key == 'c') {
    clean = !clean;
  }
}
    
