class Asteroid extends Floater {
  private boolean isSmall;
  private double rotSpeed, randNum;
  public Asteroid() {
    isSmall = false;
    randNum = Math.random();
    rotSpeed = Math.random() * 11 - 5;
    if (randNum < 0.2)  {
      corners = 6;
      xCorners = new int[]{-13, 13, 20, 13, -13, -20};
      yCorners = new int[]{-15, -15, 0, 15, 15, 0};
    } else if (randNum > 0.2 && randNum < 0.4) {
      corners = 7;
      xCorners = new int[]{-14, -10, -12, -14, 8, 15, 7};
      yCorners = new int[]{10, 0, -8, -13, -15, 0, 15};
    } else if (randNum > 0.4 && randNum < 0.6) {
      corners = 5;
      xCorners = new int[]{-10, 10, 15, 0, -15};
      yCorners = new int[]{-10, -10, 10, 20, 10};
    } else {
      corners = 7;
      xCorners = new int[]{-10, -4, 10, 18, 11, -9, -18};
      yCorners = new int[]{-10, -15, -15, 0, 15, 15, 0};
    }
    myColor = color(155);
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
    fill(myColor);
    strokeWeight(3);
    stroke(255, 0, 0, 50);    
      
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
  public boolean getSmall() {
    return isSmall;  
  }
}
