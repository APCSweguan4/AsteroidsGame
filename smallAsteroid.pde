class smallAsteroid extends Asteroid {
  public smallAsteroid(double centerX, double centerY) {
    isSmall = true;
    randNum = Math.random();
    rotSpeed = Math.random() * 11 - 5;
    if (randNum < 0.5)  {
      corners = 6;
      xCorners = new int[]{-13, 13, 20, 13, -13, -20};
      yCorners = new int[]{-15, -15, 0, 15, 15, 0};
    } else {
      corners = 6;
      xCorners = new int[]{-13, 13, 20, 13, -13, -20};
      yCorners = new int[]{-15, -15, 0, 15, 15, 0};
    }
    myColor = color(155);
    myCenterX = centerX;
    myCenterY = centerY;
    myXspeed = (int)(Math.random() * 7) - 3;
    myYspeed = (int)(Math.random() * 7) - 3;
    while (myXspeed == 0) {
      myXspeed = (int)(Math.random() * 7) - 3;
    }
    while (myYspeed == 0) {
      myYspeed = (int)(Math.random() * 7) - 3;
    }
    myPointDirection = (int)(Math.random() * 361);
  }
}
