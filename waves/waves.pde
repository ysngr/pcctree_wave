/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 36; i++ ) {
    waveRing(random(width), random(height), random(40, 120));
  }
}

void waveRing(float x, float y, float r) {
  final color[] cs = {
    color(233,  84, 100),
    color(244, 173, 163),
    color(247, 185, 119),
    color(198, 104, 150),
    color(183,  40,  45),
    color(201, 153,  98),
    color(253, 237, 223),
    color(162, 215, 221),
    color( 92, 173,  75)
  };
  final float dt = PI / random(128, 256);
  final int hopt = int(random(2, 8));
  final float amp = 0.16 * r;
  float a;
  stroke(cs[int(random(cs.length))]);
  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  for ( float t = 0; t < TWO_PI; t += dt ) {
    a = amp * tan(hopt*t);
    line((r+a)*cos(t), (r+a)*sin(t), (r-a)*cos(t), (r-a)*sin(t));
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_neptune.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
