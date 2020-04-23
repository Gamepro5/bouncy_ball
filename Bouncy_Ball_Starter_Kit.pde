// "Ball" is the class; "ball" is the object
int numOfBalls = 2;
Ball[] balls = new Ball[numOfBalls];

// Constants
final int LEFT_EDGE = -512;
final int TOP_EDGE = -384;
final int RIGHT_EDGE = 512;
final int BOTTOM_EDGE = 384;


void setup() {
  // Can't use RIGHT_EDGE and BOTTOM_EDGE here; wish Processing
  // were more sensible regarding constants
  size(1024, 768);
  // When we draw balls, do so from their centers
  ellipseMode(RADIUS);
  balls[0] = new Ball(-100, -110, 100, new PVector(3,-2), 0, color(#ff0000), 0.0000098);
  balls[1] =  new Ball(100, 100, 100, new PVector(-2,3), 0, color(#00ff00), 0.0000098);
}

void draw() {
  background(#ffffff);          // white
  translate(width/2, height/2); // draw from center of window
  
  ballsMove();   // Move all bouncy balls
  ballsDraw();   // Tell all bouncy balls to draw themselves
}

// Move all bouncy balls; this is different from drawing.
// This method changes (x,y) coordinates of the balls, it
// does not render them in the display.
public void ballsMove() {
  for (int i=0;i<balls.length;++i) {
    balls[i].move();
  }
}

// Tell all bouncy balls to draw themselves
public void ballsDraw() {
  for (int i=0;i<balls.length;++i) {
    balls[i].draw();
  }
}
