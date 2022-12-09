/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 64; i++ ) {
    wave(random(width), random(height), random(80, 600));
  }
}

void wave(float x, float y, float d) {
  final color[] cs = {
    color(173, 128, 175),
    color(246, 237,  67),
    color(244, 159,  58),
    color( 78, 191, 213),
    color(232,  68, 126),
    color(182, 212,  88),
    color(250, 250, 245),
    color( 83, 250, 245)
  };
  final color c = cs[int(random(cs.length))];
  final float dt = PI / random(32, 128);
  float ta = random(-PI, PI);
  noFill();
  for ( float r = 0; r < d/2; r++ ) {
    stroke(c, 64*(1+sin(ta)));
    circle(x+random(-1, 1)/32, y+random(-1, 1)/32, 2*r);
    ta += dt;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_omega.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
