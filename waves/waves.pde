/* waves */

void setup() {
  size(1150, 800);
  blendMode(ADD);
  noLoop();
}

void draw() {
  background(0);
  for ( int i = 0; i < 512; i++ ) {
    waveMicelle(random(width), random(height), random(32, 64));
  }
}

void waveMicelle(float x, float y, float r) {
  final color[] cs = {
    color(227, 236, 244),
    color(112, 148, 192),
    color( 56,  90, 158),
    color(234, 235, 235),
    color(212, 212, 211),
    color( 51,  49, 115),
    color(232, 211, 207),
    color(204, 104, 117),
    color(164, 125,  90)
  };
  float dt, headDiam, tailHeight, ahd, ath, dht;

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));

  noStroke();
  fill(cs[int(random(cs.length))], 8);

  dt = PI / random(512, 1024);
  headDiam = random(0.04, 0.08) * r;
  tailHeight = random(0.8, 1.6) * r;
  ahd = 0.016 * headDiam;
  ath = 0.020 * tailHeight;
  dht = random(8, 16);

  for ( float t = 0; t < TWO_PI; t += dt ) {
    circle(tailHeight*cos(t), tailHeight*sin(t), headDiam);
    headDiam += ahd * cos(t);
    tailHeight += ath* tan(dht*t);
  }

  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_larawag.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
