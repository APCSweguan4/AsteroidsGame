class Asteroid extends Floater {
  private double rotSpeed;
  public Asteroid() {
    rotSpeed = Math.random() * 11 - 5;
    corners = 6;
    xCorners = new int[]{-13, 13, 20, 13, -13, -20};
    yCorners = new int[]{-15, -15, 0, 15, 15, 0};
    myColor = color(105, 105, 105);
    myCenterX = (int)(Math.random() * 601);
    myCenterY = (int)(Math.random() * 601);
    myXspeed = (int)(Math.random() * 5) - 2;
    myYspeed = (int)(Math.random() * 5) - 2;
    while (myXspeed == 0) {
      myXspeed = (int)(Math.random() * 5) - 2;
    }
    while (myYspeed == 0) {
      myYspeed = (int)(Math.random() * 5) - 2;
    }
    myPointDirection = (int)(Math.random() * 361);
  }
  public void move() {
    turn(rotSpeed);
    super.move();
  }
  public void show() {
    noFill(); //changed fill
    strokeWeight(5);
    stroke(myColor);    
      
      //translate the (x,y) center of the ship to the correct position
      translate((float)myCenterX, (float)myCenterY);
  
      //convert degrees to radians for rotate()     
      float dRadians = (float)(myPointDirection*(Math.PI/180));
      
      //rotate so that the polygon will be drawn in the correct direction
      rotate(dRadians);
      
      //draw the polygon
      beginShape();
      for (int nI = 0; nI < corners; nI++)
      {
        vertex(xCorners[nI], yCorners[nI]);
      }
      endShape(CLOSE);
  
      //"unrotate" and "untranslate" in reverse order
      rotate(-1*dRadians);
      translate(-1*(float)myCenterX, -1*(float)myCenterY);  
    }
    public double getCenterX() {
      return myCenterX;
    }
    public double getCenterY() {
      return myCenterY;
  }
}
