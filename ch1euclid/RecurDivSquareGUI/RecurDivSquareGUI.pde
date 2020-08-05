import controlP5.*;
import processing.pdf.*;
ControlP5 cp5;
int numA, numB;
float ratio, thr;
float[] rand = new float[0];
boolean rec = false;
int count;
void setup() {
  size(1000, 1000);
  colorMode(HSB, 1);
  controller();
}
void draw() {
  background(1, 0, 1);
  ratio = (float) numB / numA;
  count = 0;
  if (rec) {
    String namePDF = str(numA) + "_" + str(numB) + "_" + str(int(thr)) + ".pdf";
    beginRecord(PDF, namePDF);
  }
  if (ratio != 1) {
    divSq(0, 0, width);
  }
  if (rec) {
    endRecord();
    rec = false;
  }
}
