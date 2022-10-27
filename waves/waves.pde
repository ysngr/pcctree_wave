/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  pushMatrix();
  translate(width/2, height/2);
  for ( float r = 60; r < 360; r += 60 ) {
    for ( float t = 0; t < TWO_PI; t += PI / 5 ) {
      waveCircle(r*cos(t), r*sin(t), map(r, 60, 360, 40, 200));
    }
  }
  popMatrix();
}

void waveCircle(float cx, float cy, float d) {
  final color[] cs = {
    color(245,  40, 118),
    color(234,  85,  75),
    color( 82, 177, 187),
    color(251, 203, 103),
    color(175,  98, 154),
    color(192, 184,  95),
    color(159, 192, 141),
    color(179, 120,  85),
    color(150, 205, 196)
  };
  float dt, inr, amp, hop, outr;
  pushMatrix();
  translate(cx, cy);
  noFill();
  for ( int i = 0; i < 3; i++ ) {
    strokeWeight(random(1, 3));
    stroke(cs[int(random(cs.length))], 200);
    rotate(random(-PI, PI));
    dt = PI / int(random(32, 64));
    inr = d / 2;
    amp = random(0.04, 0.32) * d;
    hop = int(random(8, 16));
    for ( float t = 0; t < TWO_PI; t += dt ) {
      outr = 1.5 * inr + amp * cos(hop*t);
      line(inr*cos(t), inr*sin(t), outr*cos(t), outr*sin(t));
      circle(outr*cos(t), outr*sin(t), 5);
    }
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_mars.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
