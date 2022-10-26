/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 40; i++ ) {
    waveCircle(random(width), random(height), random(80, 260));
  }
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
  for ( int i = 0; i < 3; i++ ) {
    stroke(cs[int(random(cs.length))], 160);
    rotate(random(-PI, PI));
    dt = PI / random(512, 1024);
    inr = d / random(1.8, 2.2);
    amp = random(0.04, 0.16) * d;
    hop = int(random(4, 16));
    for ( float t = 0; t < TWO_PI; t += dt ) {
      outr = inr + amp * cos(hop*t);
      line(inr*cos(t), inr*sin(t), outr*cos(t), outr*sin(t));
    }
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_miaplacidus.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
