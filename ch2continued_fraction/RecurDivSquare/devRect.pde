void divRect(float xPos, float yPos, float wd) {
  int itr = 0;
  float xEndPos = xPos + wd;
  float yEndPos = yPos + wd / ratio;
  fill(color(random(1), 1, 1));
  rect(xPos, yPos, wd, wd / ratio);
  while (wd > thr) {
    itr++;
    if (itr % 2 == 0) {
      while (xPos + wd < xEndPos + 0.1) {
        divSquare(xPos, yPos, wd);
        xPos += wd;
      }
      wd = xEndPos - xPos;
    } else {
      while (yPos + wd < yEndPos + 0.1) {
        divSquare(xPos, yPos, wd);
        yPos += wd;
      }
      wd = yEndPos - yPos;
    }
  }
}
