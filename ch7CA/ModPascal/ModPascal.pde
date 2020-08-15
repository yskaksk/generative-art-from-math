int num = 512;
int mod = 2;
int[] state = {1};
int gen = 0;
void setup() {
  size(750, 750);
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
  float scalar = (float) width / num;
  float x = (width - state.length * scalar) * 0.5;
  y *= scalar;
  noStroke();
  for (int i = 0; i < state.length; i++) {
    fill(state[i] * 1.0 / mod, state[i] * 1.0 / mod, 1);
    rect(x, y, scalar, scalar);
    x += scalar;
  }
}

int transition(int i){
  int nextC = (state[i + 1] + state[i]) % mod;
  return nextC;
}

void updateState(){
  int[] BOUNDARY = {0};
  int[] nextState = new int[state.length + 1];
  state = splice(state, BOUNDARY, 0);
  state = splice(state, BOUNDARY, state.length);
  for (int i = 0; i < state.length - 1; i++){
    nextState[i] = transition(i);
  }
  state = nextState;
  gen++;
}
