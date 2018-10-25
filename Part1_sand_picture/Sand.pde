class Sand {
  PVector location;
  float size;
  color c;
  
  Sand(float x, float y, color sandColor) {
    location = new PVector(x, y);
    c = sandColor;
    size = 2;
  }
  
  void checkInteract() {
    
  }
  
  void display() {
    stroke(c);
    strokeWeight(size);
    point (location.x, location.y);
  }
}
  
