/* waves */

void setup() {
  size(1150, 800);
  strokeWeight(0.4);
  blendMode(SCREEN);
  noLoop();
}

void draw() {
  background(0);
  for ( int i = 0; i < 32; i++ ) {
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
  float dt, alp, headDiam, tailHeight, ahd, ath, dht;
  color c = cs[int(random(cs.length))];

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));

  dt = PI / random(512, 1024);
  headDiam = random(0.01, 0.04) * r;
  tailHeight = random(1.0, 1.6) * r;
  ahd = 0.04 * headDiam;
  ath = 0.01 * tailHeight;
  dht = random(4, 8);

  for ( float t = 0; t < TWO_PI; t += dt ) {
    alp = 24 * (1 + sin(7*t));
    stroke(c, alp);
    line(r*cos(t), r*sin(t), tailHeight*cos(t), tailHeight*sin(t));
    noStroke();
    fill(c, alp);
    circle(tailHeight*cos(t), tailHeight*sin(t), headDiam);
    headDiam += ahd * cos(t);
    tailHeight += min(r, ath*tan(dht*t));
  }

  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_luna.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
