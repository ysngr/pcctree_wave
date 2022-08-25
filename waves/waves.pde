/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  final float dh = 50;
  for ( float h = 0; h <= height; h += dh ) {
    waveCircles(h, dh/2);
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
  final float dt = PI / random(16, 32);
  float t, d, dw;
  t = random(-PI, PI);
  noStroke();
  for ( float w = -g; w < width+g; w += dw ) {
    fill(cs[int(random(cs.length))]);
    d = md * (1 + cos(t));
    circle(w, h, d);
    dw = random(0.1, 0.2) * d;
    t += dt;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_izar.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
