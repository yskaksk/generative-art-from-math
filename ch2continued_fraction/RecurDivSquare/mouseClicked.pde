void mouseClicked() {
  numA = int(random(1, 20));
  numB = int(random(1, 20));
  while (numA == numB) {
    numB = int(random(1, 20));
  }
  thr = int(random(10, 300));
  println("numA =", numA, "numB =", numB, "thr =", thr);
  ratio = (float) numA / numB;
  background(0, 0, 1);
  divSquare(0, 0, width);
}
void draw(){}
