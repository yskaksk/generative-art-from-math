int num = 1024;
int mod = 3;
int[][] state = new int[num][num];
void setup() {
  size(750, 750);
  colorMode(HSB, 1);
  initialize();
  frameRate(5);
}
void draw() {
  drawCell();
  updateState();
}
void drawCell() {
  float scalar = (float) height / num;
  float y = 0;
  float x;
  for (int i = 0; i < num; i++) {
    x = 0;
    for (int j = 0; j < num; j++) {
      noStroke();
      fill(state[i][j] * 1.0 / mod, state[i][j] * 1.0 / mod, 1);
      rect(x, y, scalar, scalar);
      x += scalar;
    }
    y += scalar;
  }
}
void initialize() {
  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++) {
      if (i == num / 2 && j == num / 2) {
        state[i][j] = 1;
      } else {
        state[i][j] = 0;
      }
    }
  }
}
void mouseClicked() {
  initialize();
  mod = int(random(2, 20));
  println(mod);
  background(0, 0, 1);
}
int transition(int i, int j) {
  int nextC;
  nextC = state[(i - 1 + num) % num][j]
    + state[(i + 1) % num][j]
    + state[i][j]
    + state[i][(j - 1 + num) % num]
    + state[i][(j + 1) % num];
  nextC = nextC % mod;
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
