int num = 512;
int mod = 2;
int[] state = {1};
int gen = 0;
void setup() {
  size(1000, 500);
  colorMode(HSB, 1);
  background(0, 0, 1);
}
void draw() {
  if (gen < num) {
    drawCell(gen);
    updateState();
  }
}
void mouseClicked() {
  gen = 0;
  state = new int[]{1};
  mod = int(random(2, 20));
  println(mod);
  background(0, 0, 1);
}

void drawCell(float y) {
  float scalar = width * 0.5 / num;
  float x = (width - state.length * scalar) * 0.5;
  y *= scalar;
  noStroke();
  for (int i = 0; i < state.length; i++) {
    fill(state[i] * 1.0 / mod, state[i] * 1.0 / mod, 1);
    rect(x, y, scalar, scalar);
    x += scalar;
  }
}

int transition(int a, int b, int c) {
  int d;
  if (random(1) < 0.9999) {
    d = (a + b + c) % mod;
  } else {
    d = (a + c) % mod;
  }
  return d;
}

void updateState() {
  int[] BOUNDARY = {0, 0};
  int[] nextState = new int[state.length + 2];
  state = splice(state, BOUNDARY, 0);
  state = splice(state, BOUNDARY, state.length);
  for (int i = 1; i < state.length - 1; i++) {
    nextState[i - 1] = transition(state[i - 1], state[i], state[i + 1]);
  }
  state = nextState;
  gen++;
}
