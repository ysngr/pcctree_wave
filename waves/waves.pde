/* waves */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  final float dh = height / 64;
  for ( float h = 0; h <= height; h += dh ) {
    wave(h, 8.0*dh);
  }
}

void wave(float h, float a) {
  final color[] cs = {
    color( 52, 114, 161), 
    color(  9,  86, 140), 
    color(250, 248, 240), 
    color(234, 235, 239), 
    color(205, 218, 219), 
    color(201, 194, 189), 
    color(158, 153, 130), 
    color(141, 156, 160), 
    color(161, 168, 174)
  };
  final float dw = random(0.5, 1.5);
  final float dt = PI / random(8, 128);
  final float d = 5;
  float t = 0;
  
  stroke(cs[int(random(cs.length))], 128);
  for ( float w = 0; w < width; w += dw ) {
    line(w, h, w, h+a*synthWave(t));
    circle(w, h+a*synthWave(t), d);
    t += dt;
  }
}

float synthWave(float theta) {
  return cos(theta) * cos(sqrt(theta));
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_altair.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
