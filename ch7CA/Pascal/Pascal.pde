int num = 15;
int[] state = {1};
int gen = 0;
void setup() {
  size(750, 750);
}
void draw() {
  if (gen < num) {
    drawNumber(gen);
    updateState();
  }
}

void drawNumber(float y) {
  float scalar = (float) width / num;
  float x = (width - state.length * scalar) * 0.5;
  y *= scalar;
  fill(0);
  for (int i = 0; i < state.length; i++) {
    textSize(scalar * 0.5);
    text(state[i], x + scalar * .5, y + scalar * 0.5);
    x += scalar;
  }
}

void updateState() {
  int[] BOUNDARY = {0};
  int[] nextState = new int[state.length + 1];
  state = splice(state, BOUNDARY, 0);
  state = splice(state, BOUNDARY, state.length);
  for (int i = 0; i < state.length - 1; i++) {
    nextState[i] = transition(i);
  }
  state = nextState;
  gen++;
}

int transition(int i) {
  int nextC = state[i + 1] + state[i];
  return nextC;
}
