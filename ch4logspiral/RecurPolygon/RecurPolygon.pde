PVector[] vec;
float gap = 0.05;
int gon = 8;
void setup() {
  size(750, 750);
  vec = new PVector[gon];
  for (int i = 0; i < gon; i++) {
    vec[i] = PVector.fromAngle(2 * i * PI / gon);
    vec[i].mult(width / 2);
  }
}

void draw() {
  translate(width / 2, height / 2);
  drawPolygon(vec);
  vec = getVector(vec);
}

void drawPolygon(PVector[] v) {
  for (int i = 0; i < gon; i++) {
    line(v[i].x, v[i].y, v[(i + 1) % gon].x, v[(i + 1) % gon].y);
  }
}

PVector[] getVector(PVector[] v) {
  PVector[] nextVec = new PVector[gon];
  for (int i = 0; i < gon; i++) {
    PVector dir = PVector.sub(v[(i + 1) % gon], v[i]);
    dir.mult(gap);
    nextVec[i] = PVector.add(v[i], dir);
  }
  return nextVec;
}

void mouseClicked() {
  //gap = random(1) / 2;
  gon = int(random(3, 8));
  background(255);
  vec = new PVector[gon];
  for (int i = 0; i < gon; i++) {
    vec[i] = PVector.fromAngle(2 * i * PI / gon);
    vec[i].mult(width / 2);
  }
}
