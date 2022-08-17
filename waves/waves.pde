/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  reverseWorld();
  final float dh = 100;
  final int d = 3;
  for ( float h = 0; h <= height; h += dh ) {
    for ( int i = -d; i < d; i++ ) {
      wave(h+i, int(random(4, 50)));
    }
  }
}

void reverseWorld() {
  translate(width/2, height/2);
  rotate(PI);
  translate(-width/2, -height/2);
}

void wave(float h, int n) {
  final color[] cs = {
    color(173, 128, 175),
    color(246, 237,  67),
    color(244, 159,  58),
    color( 78, 191, 213),
    color(232,  68, 126),
    color(182, 212,  88),
    color(250, 250, 245),
    color( 83,  78, 138)
  };
  final float[] xs = initXs(-600, 600, width);
  final float[] ps = getParams(-8, 8, n+1);
  float x;
  float[] ys = new float[xs.length];
  for ( int i = 0; i < ys.length; i++ ) {
    x = xs[i];
    ys[i] = synthwave(ps, x);
  }
  strokeWeight(random(1.5, 2.5));
  stroke(cs[int(random(cs.length))], random(80, 160));
  for ( int i = 0; i < ys.length-1; i++ ) {
    line(i, h+ys[i], i+1, h+ys[i+1]);
  }
}

float[] initXs(float min, float max, int n) {
  final float dx = (max - min) / n;
  float[] xs = new float[n];
  for ( int i = 0; i < n; i++ ) {
    xs[i] = min + dx * i;
  }
  return xs;
}

float[] getParams(float min, float max, int n) {
  float[] ps = new float[n];
  for ( int i = 0; i < n; i++ ) {
    ps[i] = random(min, max);
  }
  return ps;
}

float synthwave(float[] ps, float x) {
  float y = 0;
  for ( int i = 0; i < ps.length; i++ ) {
    y += ps[i] * sin(i*x);
  }
  return y;
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_elnath.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
