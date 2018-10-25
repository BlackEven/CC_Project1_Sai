/*
Part 1. Create a sand picture. 

Part1 Pseudocode:
1. Use pixels to create five kinds of particles with different color, shape, 
density(weight), and size.
2. Create arrays of different particles
3. Display them randomly to create a sand picture

#haven't been solved
*/

int cols = 640;
int[] rows = {100, 160, 180};
Sand[][] sand1 = new Sand[cols][rows[0]];
Sand[][] sand2 = new Sand[cols][rows[1]];
Sand[][] sand3 = new Sand[cols][rows[2]];

void setup() {
  size(640, 360);
  for (int i = 0; i < cols; i++) {
     for (int j = 0; j < rows[0]; j++) {
       sand1[i][j] = new Sand(i, j, color(54,23,15));
     }
     for (int k = 100; k < rows[1]; k++) {
       sand2[i][k] = new Sand(i, k, color(83,194,158));
     }
  }
}

void draw() {
  background(255);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows[0]; j++) {
       sand1[i][j].display();
     }
    for (int k = 100; k < rows[1]; k++) {
       sand2[i][k].display();
    }
  }
}
