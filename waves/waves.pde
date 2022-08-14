/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 48; i++ ) {
    wave(random(height));
  }
}

void wave(float h) {
  final color[] cs = {
    color(191, 198, 172),
    color(219, 212, 184),
    color(247, 226, 214),
    color(237, 175, 167),
    color(213, 112, 105),
    color(210,  65,  71),
    color(177, 122,  93),
    color( 90,  80,  63),
    color( 54,  45,  51)
  };
  final int n = 128;
  final float mw = random(-100, 100);
  final float a = random(4, 32);
  final float g = abs(mw);
  final float dt = PI / random(64, 128);
  color c = cs[int(random(cs.length))];
  float dw, da;

  noiseSeed(int(random(1024)));
  noFill();
  for ( int i = 0; i < n; i++ ) {
    stroke(c, random(20, 40));
    beginShape();
    dw = mw * i / n;
    da = 3 * a * i / n;
    for ( float w = -g, t = 0; w < width+g; w++, t += dt ) {
      vertex(w+dw, h+(a+da)*sin(t)*cos(t));
    }
    endShape();
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_fomalhaut.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
