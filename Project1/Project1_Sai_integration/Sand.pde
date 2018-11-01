class Sand {
  //location, velocity, and acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;

  //Mass 
  float mass;

  //radius
  float r;
  
  //id
  int id;  

  //color
  color c;

  //other sand
  Sand[] others;
  
  //constructor
  Sand(float x, float y, int id_, Sand[] others_) {
    mass = random(3,5);
    r = 3;
    id = id_;
    others = others_;
    colorMode(HSB, 360, 100, 100);
    c = color(10, random(100), 100);
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
    
    //set the velocity to 0 while the velocity is very small
    //so the sands can pile up as a mountain
    if (velocity.mag() < 0.1) {
      velocity.set(0, 0);
    }
  }

  //draw sand
  void display() {
    noStroke();
    fill(c);
    //change the location of sands when we filp over the window
    if(flip) {
    ellipse(location.x, height-location.y, r*2, r*2);
    }else {
    ellipse(location.x, location.y, r*2, r*2);
    }
  }

  //Bounce off boundary of window
  void checkEdges() {
    //hit right side
    if (location.x > width - r) {
      location.x = width - r;
      velocity.x *= -0.7;

      //hit left side
    } else if (location.x < r) {

      location.x = r;
      velocity.x *= -0.7;
    }
    //hit buttom
    if (location.y > height - r) {

      velocity.y *= -0.7;
      location.y = height - r;
      velocity.x *= -0.4;
    }
    //hit top
    if (location.y < r) {
      velocity.y *= -0.7;
      location.y =  r;
      velocity.x *= -0.4;
    }
  }

  void collide() {
    for (int i = id + 1; i < numSands; i++) {
      //calculate the distance between the sand and other sands 
      float d = dist(location.x, location.y, others[i].location.x, others[i].location.y);
      //calculate the minimum distance that could prevent two sands from overlapping
      float minDist = others[i].r + r;
      //if the distance is less than mininum distance, add opposite acceleration 
      //to their velocity so that they won't overlap
      if (d < minDist) {
        PVector distanceVect = PVector.sub(others[i].location, location);
        float angle = distanceVect.heading();
        float targetX = location.x + cos(angle) * minDist;
        float targetY = location.y + sin(angle) * minDist;
        float ax = (targetX - others[i].location.x) * 0.06;
        float ay = (targetY - others[i].location.y) * 0.06;
        velocity.x -= ax;
        velocity.y -= ay;
        others[i].velocity.x += ax;
        others[i].velocity.y += ay;
      }
    }
  }
}
