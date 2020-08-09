int m = 1;
int num = 10;
float x = m;
float alpha = (m + sqrt(m * m + 4)) / 2;
size(750, 750);
float limPos = map(alpha, m, m + 1, 0, height);
stroke(255, 0, 0);
line(0, limPos, width, limPos);
float step = (float) width / num;
stroke(0);
for (int i = 0; i < num; i++) {
  float nextX = m + 1.0 / x;
  float pos = map(x, m, m + 1, 0, height);
  float nextPos = map(nextX, m, m + 1, 0, height);
  line(i * step, pos, (i + 1) * step, nextPos);
  x = nextX;
}
