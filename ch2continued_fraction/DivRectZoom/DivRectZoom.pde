float ratio = sqrt(2);
void setup() {
  size(500, 350);
  colorMode(HSB, 1);
}
void draw() {
  background(0, 0, 1);
  float scalar = pow(50, mouseX * 1.0 / width) * width;
  divRect(width - scalar, height - scalar / ratio, scalar);
}
