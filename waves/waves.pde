/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 24; i++ ) {
    wave(height/2);
  }
}

void wave(float h) {
  final color[] cs = {
    color(248, 206, 218),
    color(209, 186, 218),
    color(160, 216, 239),
    color(104, 183, 161),
    color(216, 230, 152),
    color(240, 193, 192),
    color(233,  82, 149),
    color(112,  84, 160),
    color( 35, 157, 218)
  };
  final float A = random(40, 280);
  final float D = random(50, 100);
  final float dt = PI / random(256, 512);
  float d;
  float t = random(-PI, PI);

  stroke(cs[int(random(cs.length))], random(40, 80));
  noFill();
  for ( float w = -D; w < width+D; w++ ) {
    d = D * abs(sin(noise(t/4096)*t));
    circle(w, h+A*cos(t), d);
    t += dt;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_canopus.png");
    exit();
  } else if ( key == 'r' ) {
    noiseSeed(int(random(1024)));
    redraw();
  }
}
