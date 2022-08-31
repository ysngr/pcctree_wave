/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  final float dh = 50;
  for ( float h = 0; h <= height; h += dh ) {
    waveCircles(h, dh/5);
  }
}

void waveCircles(float h, float md) {
  final color[] cs = {
    color( 70,  61, 149),
    color(231,  62, 112),
    color( 66, 123, 191),
    color(251, 251, 251),
    color(175, 200, 232),
    color(196, 221, 241),
    color(108, 149,  70),
    color( 63,  54,  27),
    color(137, 164, 178)
  };
  final float g = 100;
  final float dt = PI / random(128, 256);
  int n;
  float t, d, dw;
  n = int(random(2, 12));
  t = random(-PI, PI);
  noStroke();
  for ( float w = -g; w < width+g; w += dw ) {
    fill(cs[int(random(cs.length))]);
    d = md * waveDiag(n, t);
    circle(w, h, d);
    dw = random(0.02, 0.04) * d;
    t += dt;
  }
}

float waveDiag(int n, float t) {
  float y = 0;
  for ( int i = 0; i < n; i++ ) {
    y += cos(i*t);
  }
  return y;
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_intercrus.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
