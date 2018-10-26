/*
Part 2. Sands fall down to create different mountains, valleys and dunes.
 
 Part2 Pseudocode:
 1. Use pixels to create sands.
 2. Sand falls under the influence of gravity and resistance from water.
 3. Sands won't mixed.
 4. When sand hits the boundary of the display window, it will bounce and finally
 stay in the bottom under the influence of friction.
 5. When sand hits other sands, it will bounce and finally stay in the edge of 
 dunes under the influence of friction.
 
 #have trouble in #5. 
 */

ArrayList<Sand> sands;

void setup() {
  size(640, 360);
  sands = new ArrayList<Sand>();
}

void draw() {
  background(255);
  int total = 1;
  int count = 0;
  int attempts = 0;

  while (count < total) { 
    Sand newS = newSand();
    if (newS != null) {
      sands.add(newS);
      count++;
    }
    attempts++;
    if (attempts > 1000) {
      noLoop();
      println("Finished");
      break;
    }
  }

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
    ;
    float dragMagnitude = c * speed * speed;  
    //direction is inverse of velocity
    drag.mult(-1);
    //scale according to magnityde
    drag.normalize();
    drag.mult(dragMagnitude);

    //normal force and friction from other sands
    PVector normal = new PVector();
    //PVector friction = new PVector();

    //update and display
    for (Sand other : sands) {
      if (s != other) {
        float d = dist(s.location.x, s.location.y, other.location.x, other.location.y);
        if (d - 2 <= s.r + other.r) {
          s.crashing = true;
          //apply normal force
          normal = PVector.sub(s.location, other.location);
          normal.normalize();
          normal.mult(0.3);

          //how to calculate friction to stop it??
          //friction = v.copy();
          //friction.mult(-1);
          //friction.normalize();
          //friction.mult(0.2);
          //;
        }
      }
    }

    //Apply force
    s.applyForce(gravity);
    s.applyForce(drag);
    if (s.crashing) {
      s.applyForce(normal);
      //s.applyForce(friction);
    }

    s.update();
    s.display();
    s.checkEdges();
  }
}

Sand newSand() {
  float x = random(width);
  float y = 0;
  float m = random(8, 10);

  boolean valid = true;
  for (Sand s : sands) {
    float d = dist(x, y, s.location.x, s.location.y);
    if (d < s.r) {
      valid = false;
      break;
    }
  }
  if (valid) {
    return new Sand(m, x, y);
  } else {
    return null;
  }
}
