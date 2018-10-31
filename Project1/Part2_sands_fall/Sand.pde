class Sand {
  //location, velocity, and acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  //Mass 
  float mass;
  
  //radius
  float r;
  
  //life
  float life;
  
  //color
  color c;
  
  //crush
  boolean crashing = false;
  
  Sand(float m, float x, float y) {
    mass = m;
    r = 10;
    life = 300;
    c = color(random(255),0,0);
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
    fill(c);
    ellipse(location.x, location.y, r*2, r*2);
  }
  
  //Bounce off boundary of window
  void checkEdges() {
    //hit right side
    if (location.x > width - r) {
      if (life > 1) {
      location.x = width - r;
      velocity.x *= -0.7;
      }else {
        location.x = width - r;
      }
    //hit left side
    }else if (location.x < r) {
      if (life > 1) {
      location.x = r;
      velocity.x *= -0.7;
      }else {
        location.x = r;
      }
    }
    //hit buttom
    if (location.y > height - r) {
      if (life > 1) {
      // A little dampening when hitting the bottom
      velocity.y *= -0.7;
      location.y = height - r;
      velocity.x *= -0.7;
    }else {
      location.y = height - r;
    }
    }
  }
  
  void life() {
    if (life <= 1) {
      acceleration.mult(0);
      velocity.mult(0);
    }
  }
  
}
