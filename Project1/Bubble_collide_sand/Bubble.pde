class Bubble {
  //location, velocity, and acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;

  //Mass 
  float mass;

  //radius
  float r;

  int id;  

  //color
  color c;


  //other bubbles
  Bubble[] others;
  

  Bubble(float x, float y, int id_, Bubble[] others_, float r_) {
    mass = 3;
    r = r_;
    id = id_;

    others = others_;

    c = color(200, 25);
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

    //if (velocity.mag() < 0.1) {
    //  velocity.set(0, 0);
    //}
  }

  //draw bubbles
  void display() {
    stroke(175);
    fill(c);
    ellipse(location.x, location.y, r*2, r*2);
  }

  //Bounce off boundary of window
  void checkEdges() {
    //hit right side
    if (location.x > width - r) {
      location.x = width - r;
      velocity.x *= -0.7;
      velocity.y *= -0.4;

      //hit left side
    } else if (location.x < r) {

      location.x = r;
      velocity.x *= -0.7;
      velocity.y *= -0.4;
    }
    //hit buttom
    if (location.y > height - r) {

      velocity.y *= -0.7;
      location.y = height - r;
      velocity.x *= -0.4;
    }
    //hit top
    if (location.y < r + 1 ) {
      location.y =  r + 1;
      velocity.y *= -0.7;
      velocity.x *= -0.4;
    }
  }

  void collide() {

    for (int i = id + 1; i < numBubbles; i++) {
      float d = dist(location.x, location.y, others[i].location.x, others[i].location.y);
      float minDist = others[i].r + r;
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
