int[] fibo = {0, 1};

void setup() {
  size(500, 500);
  colorMode(HSB, 1);
  drawSquare();
}

void drawSquare() {
  float xPos = 0;
  float yPos = 0;
  int nextFibo = fibo[fibo.length - 2] + fibo[fibo.length - 1];
  float scalar = (float) width / nextFibo;
  background(0, 0, 1);
  for (int i = 1; i < fibo.length; i++) {
    fill((0.1 * i) % 1, 1, 1);
    rect(scalar * xPos, scalar * yPos, scalar * fibo[i], scalar * fibo[i]);
    if (i % 2 == 1) {
      xPos += fibo[i];
      yPos -= fibo[i-1];
    } else {
      xPos -= fibo[i-1];
      yPos += fibo[i];
    }
  }
}

void mouseClicked() {
  int nextFibo = fibo[fibo.length - 2] + fibo[fibo.length - 1];
  fibo = append(fibo, nextFibo);
  drawSquare();
  println(nextFibo);
}

void draw(){}
