/* waves */

final float MAX_DEPTH = 4;

void setup() {
  size(1150, 800);
  rectMode(CENTER);
  noLoop();
}

void draw() {
  background(240);
  wave(height/2, 220, 0);
}

void wave(float h, float a, int depth) {
  final color[] cs = {
    color( 80, 124, 144),
    color( 87, 100, 116),
    color( 17,  18,  22),
    color( 63,  77, 159),
    color(228, 243, 251),
    color( 80, 115,  65),
    color(231,  97,  52),
    color(201,  49,  40),
    color(242, 216,  80)
  };
  final float d = random(6, 14);
  final float dt = PI / random(8, 256);
  color c = cs[int(random(cs.length))];
  float w = 0;
  float t = 0;
  float da = random(0.005, 0.200);

  noStroke();
  while ( a > 0 ) {
    fill(c, 220*(1-depth/MAX_DEPTH/2));
    circle(w, h+a*sin(t), d);
    w += 1;
    t += dt;
    a -= da;
    if ( depth < MAX_DEPTH && random(280) < 1 ) {
      pointStart(w, h+a*sin(t), d, c);
      pushMatrix();
      translate(w, h+a*sin(t));
      rotate(random(-PI, PI));
      wave(0, a, depth+1);
      popMatrix();
    }
  }
  endPoint(w, h+a*sin(t), d, c);
}

void pointStart(float x, float y, float d, color c) {
  stroke(c);
  noFill();
  circle(x, y, 2.4*d);
  noStroke();
  fill(c);
  circle(x, y, 2.0*d);
}

void endPoint(float x, float y, float d, color c) {
  stroke(c);
  noFill();
  square(x, y, 2.2*d);
  noStroke();
  fill(c);
  square(x, y, 1.8*d);
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_betelgeuse.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
