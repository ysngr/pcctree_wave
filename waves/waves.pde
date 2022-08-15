/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  pushMatrix();
  translate(width/2, height/2);
  for ( int i = 0; i < 32; i++ ) {
    rotate(i);
    wave(720);
  }
  popMatrix();
}

void wave(float d) {
  final color[] cs = {
    color(218, 205, 139),
    color(174, 154, 107),
    color( 92, 118, 100),
    color(  0, 126, 118),
    color(248, 246, 222),
    color(230, 224, 196),
    color( 85, 125,  62),
    color( 73,  49,  60),
    color(235,  92,  50)
  };
  final int n = int(random(32, 128));
  final float dt = PI / random(32, 128);
  final float A = random(20, 80);
  float a;
  stroke(cs[int(random(cs.length))], random(20, 120));
  noFill();
  for ( int i = 0; i < n; i++ ) {
    beginShape();
    for ( float w = -d/2, t = 0; w < d/2; w++, t += dt ) {
      a = A * (noise(t/5) + float(i)/n);
      vertex(w+float(i)/n, a*cos(t));
    }
    endShape();
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_graffias.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
