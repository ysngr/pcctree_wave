/* waves */

final float BLOCK_LEN = 50;

void setup() {
  size(1150, 800);
  strokeWeight(1.5);
  rectMode(CENTER);
  blendMode(ADD);
  noLoop();
}

void draw() {
  background(0);
  float a, t, dt;
  for ( int i = 0; i < 3; i++ ) {
    for ( float h = 0; h < height; h += BLOCK_LEN ) {
      for ( float w = 0; w < width; w += BLOCK_LEN ) {
        a = random(-1, 1) * BLOCK_LEN / 2.25;
        t = random(-PI, PI);
        dt = PI / random(16, 64);
        pushMatrix();
        translate(w+BLOCK_LEN/2, h+BLOCK_LEN/2);
        rotate(int(random(4))*HALF_PI);
        noStroke();
        if ( random(50) < 1 ) {
          fill(random(255), random(255), random(255), 180);
        } else {
          fill(255*noise(8*w/width), 220*noise(5*h/height), random(200), 60);
        }
        square(0, 0, BLOCK_LEN);
        stroke(100, 100, map(noise(w*h/10000), 0, 1, 128, 255), 120);
        for ( float bw = -BLOCK_LEN/2; bw < BLOCK_LEN/2; bw+=0.25 ) {
          point(bw, a*cos(t));
          t += dt;
        }
        popMatrix();
      }
    }
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wave_kepler.png");
    exit();
  } else if ( key == 'r' ) {
    noiseSeed(int(random(1024)));
    redraw();
  }
}
