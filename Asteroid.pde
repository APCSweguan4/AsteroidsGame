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
    myPointDirection = (int)(Math.random() * 361);
  }
  public void move() {
    turn(rotSpeed);
    super.move();
  }
  public double getCenterX() {
    return myCenterX;
  }
  public double getCenterY() {
    return myCenterY;
  }
}
