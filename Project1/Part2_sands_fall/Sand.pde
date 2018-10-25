class Sand {
  //location, velocity, and acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  //Mass 
  float mass;
  
  //radius
  float r;
  
  Sand(float m, float x, float y) {
    mass = m;
    r = 2;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
  }
  
  //A = F/M
  void applyForce(PVector force) {
    //Divide by mass
    PVector f = PVector.div(force, mass);
    //Accumulate all forces in acceleration
    acceleration.add(f);
  }
  
  void update() {
    //velocity changes according to acceleration
    velocity.add(acceleration);
    //location changes by velocity
    location.add(velocity);
    //clear acceleration each frame
    acceleration.mult(0);
  }
  
  //draw sand
  void display() {
    noStroke();
    fill(100);
    ellipse(location.x, location.y, r, r);
  }
  
  //Bounce off boundary of window
  void checkEdges() {
    //hit right side
    if (location.x > width) {
      location.x = width;
      velocity.x *= -0.6;
    //hit left side
    }else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -0.6;
    }
    //hit buttom
    if (location.y > height) {
      // A little dampening when hitting the bottom
      velocity.y *= -0.6;
      location.y = height;
    }
  }
  
  void checkInteract(Sand s) {
    float d = PVector.dist(location, s.location);
    //interact
    if (d < 4) {
    //do something???
    }
  }
}
