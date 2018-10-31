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
int protection = 0;
  
void setup() {
  size(640, 360);
  sands = new ArrayList<Sand>();
}

void draw() {
  background(255);

  //use a variable to prevent from generating too much sands
  if (protection < 500) {
    Sand newS = newSand();
    if (newS != null) {
      sands.add(newS);
      protection++;
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
    
    float dragMagnitude = c * speed * speed;  
    //direction is inverse of velocity
    drag.mult(-1);
    //scale according to magnityde
    drag.normalize();
    drag.mult(dragMagnitude);

    //normal force and friction from other sands
    PVector normal = new PVector();
    
    //check crushing
    for (Sand other : sands) {
      if (s != other && s.life > 0) {
        float d = dist(s.location.x, s.location.y, other.location.x, other.location.y);
        if (d <= s.r + other.r) {
          s.crashing = true;
          //calculate normal force
          normal = PVector.sub(s.location, other.location);
          normal.normalize();
          normal.mult(0.7);
          s.life-=1;
        }
      }
    }

    //Apply force
    if (s.life > 1) {
    s.applyForce(gravity);
    s.applyForce(drag);
    if (s.crashing) {
      s.applyForce(normal);
    }
    }
    
    //update and display
    s.update();
    s.display();
    s.checkEdges();
    s.life();
    

  }
}

Sand newSand() {
  float x = random(width/2 - 10, width/2 + 10);
  float y = 0;
  float m = 2;

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
