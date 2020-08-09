import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;
int num, thr;
boolean rec = false;
int[] fibo;
int[] SGN = {1, 1, -1, -1};

void setup() {
  size(750, 750);
  controller();
}

void draw() {
  generateFibo(num);
  if (rec) {
    String namePDF = str(num) + "_" + str(thr) + ".pdf";
    beginRecord(PDF, namePDF);
  }
  colorMode(HSB, 1);
  background(0, 0, 1);
  divSq(0, 0, 0, 0, 1, 1);
  if (rec) {
    endRecord();
    String namePNG = str(num) + "_" + str(thr) + ".png";
    save(namePNG);
    rec = false;
  }
}

void colRect(float xPos, float yPos, float wd, float ht, int ind) {
  float scalar = (float) width / fibo[0];
  fill((ind * 1.0 / num) % 1, 1, 1);
  rect(scalar * xPos, scalar * yPos, scalar * wd, scalar * ht);
}

void controller() {
  cp5 = new ControlP5(this);
  cp5.addSlider("num")
  .setPosition(10, 10)
  .setSize(100, 20)
  .setRange(1, 20)
  .setValue(10)
  .setColorCaptionLabel(0)
  ;
  cp5.addSlider("thr")
  .setPosition(10, 50)
  .setSize(100, 20)
  .setRange(0, 9)
  .setValue(0)
  .setColorCaptionLabel(0)
  ;
  cp5.addBang("rec")
  .setPosition(10, 90)
  .setSize(50, 20)
  .setColorCaptionLabel(0)
  ;
}
