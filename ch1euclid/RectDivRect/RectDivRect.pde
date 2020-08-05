int numA = 38;
int numB = 9;
float ratio = (float) numB / numA;

void setup() {
  size(500, 500);
  colorMode(HSB, 1);
  int itr = 0;
  float xPos = 0;
  float yPos = 0;
  float wd = width * ratio;
  while (wd > 0.1) {
    itr++;
    if (itr % 2 == 1) {
      while (xPos + wd < width + 0.1) {
        divSquare(xPos, yPos, wd);
        xPos += wd;
      }
      wd = width - xPos;
    } else {
      while (yPos + wd < width * ratio + 0.1) {
        divSquare(xPos, yPos, wd);
        yPos += wd;
      }
      wd = width * ratio - yPos;
    }
  }
}
