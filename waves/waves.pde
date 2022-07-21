/* waves */

final float MAX_DEPTH = 3;
color COLOR;

void setup() {
  size(1150, 800);
  rectMode(CENTER);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 12; i++ ) {
    wave(random(0.35, 0.65)*height, random(40, 80), 0);
  }
}

void setColor() {
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
  COLOR = cs[int(random(cs.length))];
}

void wave(float h, float a, int depth) {
  final float d = random(2, 4);
  final float dt = PI / random(16, 256);
  float w = 0;
  float t = 0;
  float da = random(0.005, 0.020);

  if ( depth == 0 ) {
    setColor();
  }
  noStroke();
  fill(COLOR, 200*(1-0.8*depth/MAX_DEPTH));
  
  while ( a > 0 ) {
    circle(w, h+a*sin(t), d);
    w += 1;
    t += dt;
    a -= da;
    if ( depth < MAX_DEPTH && random(240) < 1 ) {
      pointStart(w, h+a*sin(t), d);
      pushMatrix();
      translate(w, h+a*sin(t));
      rotate(random(-1, 1)*PI/8);
      wave(0, a, depth+1);
      popMatrix();
    }
  }
  endPoint(w, h+a*sin(t), d);
}

void pointStart(float x, float y, float d) {
  stroke(COLOR);
  noFill();
  circle(x, y, 2.4*d);
  noStroke();
  fill(COLOR);
  circle(x, y, 2.0*d);
}

void endPoint(float x, float y, float d) {
  stroke(COLOR);
  noFill();
  square(x, y, 2.2*d);
  noStroke();
  fill(COLOR);
  square(x, y, 1.8*d);
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_bellatrix.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
