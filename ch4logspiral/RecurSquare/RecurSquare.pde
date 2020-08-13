PVector[] vec;
float theta = 0;


void setup() {
  size(750, 750);
  vec = new PVector[4];
  vec[0] = new PVector(0, 0);
  vec[1] = new PVector(width, 0);
  vec[2] = new PVector(width, height);
  vec[3] = new PVector(0, height);
}

void draw() {
  drawSquare(vec);
  vec = getVector(vec);
}

void drawSquare(PVector[] v) {
  for (int i = 0; i < v.length; i++) {
    line(v[i].x, v[i].y, v[(i + 1) % 4].x, v[(i + 1) % 4].y);
  }
}

PVector[] getVector(PVector[] vec) {
  PVector[] nextVec = new PVector[vec.length];
  float gap = sin(theta) / 100;
  for (int i = 0; i < vec.length; i++) {
    PVector dir = PVector.sub(vec[(i + 1) % 4], vec[i]);
    dir.mult(gap);
    nextVec[i] = PVector.add(vec[i], dir);
  }
  theta += 2 * PI / 1000;
  return (nextVec);
}
