void divRect(float xPos, float yPos, float wd) {
  int itr = 0;
  float xEndPos = xPos + wd;
  float yEndPos = yPos + wd / ratio;
  while (wd > thr) {
    itr++;
    if (itr % 2 == 0) {
      while (xPos + wd < xEndPos + 0.1) {
        colorRect(xPos, yPos, wd, wd);
        if (random(1) < thr2) {
          divSquare(xPos, yPos, wd);
        }
        xPos += wd;
      }
      wd = xEndPos - xPos;
    } else {
      while (yPos + wd < yEndPos + 0.1) {
        colorRect(xPos, yPos, wd, wd);
        if (random(1) < thr2) {
          divSquare(xPos, yPos, wd);
        }
        yPos += wd;
      }
      wd = yEndPos - yPos;
    }
  }
}

void divSquare(float xPos, float yPos, float wd) {
  int itr = 0;
  float xEndPos = wd + xPos;
  float yEndPos = wd + yPos;
  while (wd > thr) {
    itr++;
    if (itr % 2 == 1) {
      while (xPos + wd * ratio < xEndPos + 0.1) {
        colorRect(xPos, yPos, wd * ratio, wd);
        if (random(1) < thr2) {
          divRect(xPos, yPos, wd * ratio);
        }
        xPos += wd * ratio;
      }
      wd = xEndPos - xPos;
    } else {
      while (yPos + wd / ratio < yEndPos + 0.1) {
        colorRect(xPos, yPos, wd, wd / ratio);
        if (random(1) < thr2) {
          divRect(xPos, yPos, wd);
        }
        yPos += wd / ratio;
      }
      wd = yEndPos - yPos;
    }
  }
}
