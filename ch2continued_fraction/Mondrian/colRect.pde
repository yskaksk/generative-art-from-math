void colorRect(float xPos, float yPos, float wd, float ht) {
  color col;
  float val = random(1);
  if (val < 0.15) {
    col = color(0, 1, 1); // red
  } else if (val < 0.3) {
    col = color(2.0 / 3, 1, 1); // blue
  } else if (val < 0.45) {
    col = color(1.0 / 6, 1, 1); // yellow
  } else if (val < 0.5) {
    col = color(0, 1, 0); // black
  } else if (val < 0.7) {
    col = color(0, 0, 0.9); // gray
  } else {
    col = color(0, 0, 1); // white
  }
  fill(col);
  strokeWeight(5);
  rect(xPos, yPos, wd, ht);
}
