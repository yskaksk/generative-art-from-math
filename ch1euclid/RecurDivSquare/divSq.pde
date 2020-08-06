void divSquare(float xPos, float yPos, float wd) {
  int itr = 0;
  float xEndPos = wd + xPos;
  float yEndPos = wd + yPos;
  fill(color(random(1), 1, 1));
  rect(xPos, yPos, wd, wd);
  while (wd > thr) {
    itr++;
    if (itr % 2 == 1) {
      while (xPos + wd * ratio < xEndPos + 0.1) {
        divRect(xPos, yPos, wd * ratio);
        xPos += wd * ratio;
      }
      wd = xEndPos - xPos;
    } else {
      while (yPos + wd / ratio < yEndPos + 0.1) {
        divRect(xPos, yPos, wd);
        yPos += wd / ratio;
      }
      wd = yEndPos - yPos;
    }
  }
}
