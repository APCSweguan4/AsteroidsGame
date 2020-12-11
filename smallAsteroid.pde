class smallAsteroid extends Asteroid {
  public smallAsteroid(double centerX, double centerY) {
    isSmall = true;
    randNum = Math.random();
    rotSpeed = Math.random() * 11 - 5;
    if (randNum < 0.5)  {
      corners = 7;
      xCorners = new int[]{-5, -2, 5, 9, 6, -5, -9};
      yCorners = new int[]{-5, -8, -8, 0, 8, 8, 0};
    } else {
      corners = 5;
      xCorners = new int[]{-5, 5, 8, 0, -8};
      yCorners = new int[]{-5, -5, 5, 10, 5};
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
