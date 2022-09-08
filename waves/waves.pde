/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 4; i++ ) {
    waveflower(random(width), random(height), random(160, 240));
  }
  for ( int i = 0; i < 24; i++ ) {
    waveflower(random(width), random(height), random(40, 120));
  }
}

void waveflower(float cx, float cy, float id) {
  final color[] cs = {
    color(215,  16, 113),
    color(181,  82, 128),
    color(246, 239, 242),
    color(209,  47,  72),
    color(235, 230, 182),
    color(234, 191, 118),
    color(255, 253, 232),
    color(101, 147,  84),
    color(231, 238, 243)
  };
  final float u = random(8, 12);
  float d, r, dt, a;

  pushMatrix();
  translate(cx, cy);
  for ( int i = 0; i < 64; i++ ) {
    strokeWeight(random(1, 2));
    stroke(cs[int(random(cs.length))], random(40, 80));
    noFill();
    rotate(random(-PI, PI)/32);

    d = random(0.8, 1.25) * id;
    r = random(0.1, 0.4);
    dt = PI / random(64, 256);
    beginShape();
    for ( float t = 0; t <= 2*TWO_PI; t += dt ) {
      a = r * d * cos(u*t) + (1 - r) * d;
      vertex(a*cos(t), a*sin(t));
    }
    endShape();
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_juno.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
