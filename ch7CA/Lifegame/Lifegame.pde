int num = 256;
int[][] state = new int[num][num];
void setup() {
  size(750, 750);
  colorMode(HSB, 1);
  initialize();
  frameRate(20);
}
void draw() {
  drawCell();
  updateState();
  if (frameCount <= 400) {
    saveFrame("frames/####.png");
  }
}
void drawCell() {
  float scalar = (float) height / num;
  float y = 0;
  float x;
  for (int i = 0; i < num; i++) {
    x = 0;
    for (int j = 0; j < num; j++) {
      noStroke();
      if (state[i][j] == 1) {
        fill(1, 1, 1);
      } else {
        fill(0, 0, 1);
      }
      rect(x, y, scalar, scalar);
      x += scalar;
    }
    y += scalar;
  }
}
void initialize() {
  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++) {
      if (random(1.0) < 0.25) {
        state[i][j] = 1;
      } else {
        state[i][j] = 0;
      }
    }
  }
}
void mouseClicked(){
  initialize();
  background(0, 0, 1);
}
int transition(int i, int j) {
  int nextC = 0;
  int envSum = state[(i - 1 + num) % num][(j - 1 + num) % num]
                 + state[(i - 1 + num) % num][j]
                 + state[(i - 1 + num) % num][(j + 1) % num]
                 + state[i][(j - 1 + num) % num]
                 + state[i][(j + 1) % num]
                 + state[(i + 1) % num][(j - 1 + num) % num]
                 + state[(i + 1) % num][j]
                 + state[(i + 1) % num][(j + 1) % num];
  if (envSum <= 1) {
    nextC = 0;
  } else if (envSum == 2) {
    nextC = state[i][j];
  } else if (envSum == 3) {
    nextC = 1;
  } else if (envSum >= 4) {
    nextC = 0;
  }
  return nextC;
}
void updateState() {
  int[][] nextState = new int[num][num];
  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++) {
      nextState[i][j] = transition(i, j);
    }
  }
  state = nextState;
}
