/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  final float dh = height / 6;
  for ( float h = 0; h <= height; h += dh ) {
    dwave(h);
  }
}

void dwave(float h) {
  final color[] cs = {
    color( 52, 114, 161),
    color(  9,  86, 140),
    color(205, 218, 219),
    color(201, 194, 189),
    color(158, 153, 130),
    color(141, 156, 160),
    color(161, 168, 174)
  };
  final float dt = PI / random(4, 16);
  final float d = 4;
  float[] ps;
  float t;

  stroke(cs[int(random(cs.length))]);
  fill(cs[int(random(cs.length))]);

  ps = initWave(24, -12, 12);
  t = random(-PI, PI);
  for ( float w = 0; w < width; w++ ) {
    line(w, h, w, h+synthWave(ps, t));
    circle(w, h+synthWave(ps, t), d);
    t += dt;
  }
}

float[] initWave(int deg, float l, float r) {
  float[] ps = new float[deg];
  for ( int i = 0; i < deg; i++ ) {
    ps[i] = random(l, r);
  }
  return ps;
}

float synthWave(float[] a, float t) {
  float y = 0;
  for ( int i = 0; i < a.length; i++ ) {
    y += a[i] * cos(i*t);
  }
  return y;
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_algol.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
