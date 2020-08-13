PVector[] vec;
float gap = 0.1;
void setup() {
  size(750, 750);
  vec = new PVector[4];
  vec[0] = new PVector(0, 0);
  vec[1] = new PVector(width, 0);
  vec[2] = new PVector(width, height);
  vec[3] = new PVector(0, height);
  drawLogSpiral();
}

void draw() {
  stroke(0);
  strokeWeight(1);
  drawSquare(vec);
  vec = getVector(vec);
}

void drawLogSpiral() {
  float STEP = 2 * PI * 0.001;
  float b = sqrt(2 * gap * gap - 2 * gap + 1);
  float c = atan(gap / (1 - gap));
  PVector O = new PVector(width / 2, height / 2);
  PVector v = new PVector(0, 0);
  v.sub(O);
  translate(O.x, O.y);
  stroke(color(255, 0, 0));
  strokeWeight(3);
  while (v.mag() > 1) {
    PVector nextV = v.copy();
    nextV.rotate(STEP);
    nextV.mult(pow(b, STEP / c));
    line(v.x, v.y, nextV.x, nextV.y);
    v = nextV;
  }
}

void drawSquare(PVector[] v) {
  for (int i = 0; i < v.length; i++) {
    line(v[i].x, v[i].y, v[(i + 1) % 4].x, v[(i + 1) % 4].y);
  }
}

PVector[] getVector(PVector[] v) {
  PVector[] newVec = new PVector[4];
  for (int i = 0; i < v.length; i++) {
    PVector dir = PVector.sub(v[(i + 1) % 4], v[i]);
    dir.mult(gap);
    newVec[i] = PVector.add(v[i], dir);
  }
  return (newVec);
}

void mouseClicked() {
  background(255);
  gap = random(0.5);
  drawLogSpiral();
  vec[0] = new PVector(0, 0);
  vec[1] = new PVector(width, 0);
  vec[2] = new PVector(width, height);
  vec[3] = new PVector(0, height);
  println("gap = ", gap);
}
