// Use the PVector to change the x and y coordinates when needed 

class Ball {
  private float radius;     // radius of bouncy ball
  private float x;          // x-coordinate of center
  private float y;          // y-coordinate of center
  private PVector vector;   // direction and magnitude of movement
  private final int id;     // each ball has its own identifier
  private color fillColor;  // color of ball
  private double gravity;
  
  // Constructor used to store ball information
  public Ball(float x, float y, float radius, PVector vector, int id, color c, double gravity) {
    this.x = x;
    this.y = y;
    this.vector = vector;
    this.radius = radius;
    this.id = id;
    this.fillColor = c;
    this.gravity = gravity;
  }
  
  // Four of the fields are mutable: x, y, radius, v
  public float getX() { return x; }
  public float getY() { return y; }
  public float getRadius() { return radius; }
  public PVector getvector() { return vector; }
  public int getID() { return id; }
  public color getColor() { return fillColor; }

  public void setX(int x) { this.x = x; }
  public void setY(int y) { this.y = y; }
  
  public float distance(Ball other) {
    return (float) Math.sqrt(square(getX()-other.getX()) + square(getY()-other.getY()));
  }
  
  public boolean intersectsVertical() {
    // Note constants at start of Bouncy_Ball_Starter_Kit
    // LEFT_EDGE and RIGHT_EDGE
    //
    // Return true if ball touching either left or right edge
    if (y-radius <= TOP_EDGE || y+radius >= BOTTOM_EDGE) {
    return true;
    }
    return false;  // stub
  }
  
  public boolean intersectsBall(Ball ball) {
    if (distance(ball) <= (radius + ball.radius)) {
         fillColor = 0xff000000 | (color) random(0x1000000);
         return true;
      } else {
        return false;      
      }
  }
  
  public boolean intersectsHorizontal() {
    // Note constants at start of Bouncy_Ball_Starter_Kit
    // BOTTOM_EDGE and TOP_EDGE
    //
    // Return true if ball touching either top or bottom edge
    if (x+radius >= RIGHT_EDGE || x-radius <= LEFT_EDGE) {
    return true;
    }
    return false;  // stub
  }
  
  public boolean intersectsEdge() {
    // Return true if ball touching any edge.
    //
    // Use the above two methods to write this.
    
    return false;  // stub
  }
  
  public void move() {
    // Check to see if ball intersects edge; if so bounce
    
    if (intersectsVertical()) {
      vector.y = -vector.y;
    }
    
    if (intersectsHorizontal()) {
      vector.x = -vector.x;
    }
    
    // Move the ball
    // Uncomment the following two lines of code to see the ball move.
    y += vector.y;
    x += vector.x;
    
    for (int i=0;i<balls.length;++i) {
      if (balls[i] != this) {
        if (intersectsBall(balls[i])) {
          PVector positionDifference = new PVector(balls[i].getX() - x, balls[i].getY() - y) // The difference in position between that and this ball
          .mult(-0.001); // Make it point away from that ball
          vector.add(positionDifference);
        }
      }
    }
  }
    
  public void draw() {
    fill(fillColor);
    stroke(#000000);
    ellipse(x, y, radius, radius);
  }
}
