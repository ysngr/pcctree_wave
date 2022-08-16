/* waves */

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 32; i++ ) {
    wave();
  }
}

void init(int n, float h, float a) {
  final float g = 50;
  final float dw = (width + 2*g) / n;
  final float dt = PI / random(32, 128);
  float w = 0, t = random(-PI, PI);
  ps = new PVector[n];
  for ( int i = 0; i < n; i++ ) {
    ps[i] = new PVector(w, h+a*cos(t));
    w += dw;
    t += dt;
  }
  noiseSeed(int(random(1024)));
}

void update(float a) {
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i].y += a * noise(20*ps[i].x/width);
  }
}

void wave() {
  final color[] cs = {
    color(218,  65,  72),
    color(208,  15,  49),
    color(165,  26,  41),
    color( 79,  53,  39),
    color( 68,  81,  54),
    color(231, 168,  73),
    color(166, 111, 167),
    color(131,  92, 143)
  };
  final float a = random(-3, 3);
  
  stroke(cs[int(random(cs.length))], random(30, 120));
  noFill();
  
  init(int(random(128, 256)), random(3*height/7, 4*height/7), random(40, 240));
  for ( int i = 0; i < 64; i++ ) {
    beginShape();
    for ( int j = 0; j < ps.length; j++ ) {
      vertex(ps[j].x, ps[j].y);
    }
    endShape();
    update(a);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_hadar.png");
    exit();
  } else if ( key == 'r' ) {
    noiseSeed(int(random(1024)));
    redraw();
  }
}
