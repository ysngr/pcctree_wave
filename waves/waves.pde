/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  wavePlate();
}

void wavePlate() {
  final float R = 260;
  pushMatrix();
  translate(width/2, height/2);
  for ( int i = 0; i < 512; i++ ) {
    rotate(random(-PI, PI));
    wave(random(0.5, 1.5)*R);
  }
  popMatrix();
}

void wave(float l) {
  final color[] cs = {
    color(  0, 132, 168),
    color( 56, 158, 169),
    color(235, 239, 244),
    color(243, 236, 227),
    color(240, 244, 228),
    color(247, 244, 240),
    color( 72, 120, 127),
    color(158, 181, 210),
    color(184, 203, 191),
    color(252,  96,  18)
  };
  final float da = 1 + random(0.002, 0.008);
  final float d = 5;
  final float dt = PI / 64;
  final float dw = random(0.4, 1.0);
  float a = random(5, 10);
  float t = 0;
  noStroke();
  fill(cs[int(random(cs.length))], 160);
  for ( float w = 0; w < l; w += dw ) {
    circle(w, a*sin(t), d);
    a *= da;
    t += dt;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_deneb.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
