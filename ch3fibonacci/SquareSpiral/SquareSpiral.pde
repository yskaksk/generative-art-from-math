int[] fibo = {0, 1};

void setup() {
  size(500, 500);
  colorMode(HSB, 1);
  drawSpiral();
}

void drawSpiral() {
  int[] SGN = {-1, 1, 1, -1};
  float xPos = 0;
  float yPos = 0;
  float scalar = (float) width / (2 * fibo[fibo.length - 1]);
  background(0, 0, 1);
  translate(width / 2, width / 2);
  for (int i = 1; i < fibo.length - 1; i++) {
    fill((0.1 * i) % 1, 1, 1);
    rect(
        scalar * xPos,
        scalar * yPos,
        scalar * SGN[(i + 1) % 4] * fibo[i],
        scalar * SGN[i % 4] * fibo[i]
    );
    if (i % 2 == 1) {
      xPos += SGN[i % 4] * (fibo[i] + fibo[i + 1]);
    } else {
      yPos += SGN[i % 4] * (fibo[i] + fibo[i + 1]);
    }
  }
}

void mouseClicked() {
  int nextFibo = fibo[fibo.length - 2] + fibo[fibo.length - 1];
  fibo = append(fibo, nextFibo);
  drawSpiral();
  println(nextFibo);
}

void draw(){}
