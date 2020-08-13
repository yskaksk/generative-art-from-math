float theta = 0;
float STEP = 2 * PI * 0.01; //2pi / 100

void setup() {
  size(750, 750);
}

void draw() {
  translate(width / 2, height / 2);
  line(rad(theta) * cos(theta), rad(theta) * sin(theta),
       rad(theta + STEP) * cos(theta + STEP), rad(theta + STEP) * sin(theta + STEP));
  theta += STEP;
}

float rad(float t) {
  //float r = 5 * t;
  float r = 5 * sqrt(t);
  return (r);
}
