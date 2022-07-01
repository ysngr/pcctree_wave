/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  wave(height/2);
}

void wave(float h) {
  final float a = 100;
  final float d = 10;
  final float dt = PI / 32;
  float t = random(-PI, PI);
  for ( float w = 0; w < width; w++ ) {
    circle(w, h+a*cos(t), d);
    t += dt;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
